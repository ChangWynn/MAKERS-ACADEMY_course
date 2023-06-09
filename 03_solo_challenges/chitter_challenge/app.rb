require 'sinatra/base'
require 'sinatra/reloader'
require "time"
require "bcrypt"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/user'

DatabaseConnection.connect

class Application < Sinatra::Base 

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  # ------------------
  # HOMEPAGE
  # ------------------
  
  get '/' do
    @message = _session_message
    @peeps = _peep_repo.all
    set_up_open_session
    find_peep_owner_lambda

    return erb(:index)
  end

  def set_up_open_session
    @session_is_open = true unless session[:username].nil?
    return @user = _user_repo.find_with_text(session[:username]) if @session_is_open
  end

  def find_peep_owner_lambda
    @peep_owner = lambda do |user_id| 
      _user_repo.find_with_id(user_id).username
    end
  end

  # ------------------
  # FIND USER FEATURE
  # ------------------

  post "/find_user" do
    search = params[:search]
    @user = _user_repo.find_with_text(search)

    if @user == "not found"
      session[:message] = "user not found"
      redirect "/"
    else
      redirect "/user/#{@user.username}"
    end
  end

  get "/user/:username" do
    username = params[:username]
    @user = _user_repo.find_with_text(username)

    return erb(:"public/public_profile")
  end

  # ---------------
  # SIGNUP BEHAVIOR
  # ---------------

  get "/signup" do
    @message = _session_message
    return erb(:"authentication/signup")
  end

  post "/signup" do
    new_user = params_to_user_object(params)
    @user = _user_repo.create(new_user)

    if @user == "already exists"
      session[:message] = "This user already exist. Please login."
      redirect "/signup"
    elsif @user == "is successfully registered"
      session[:username] = new_user.username
      redirect "/"
    end
  end

  def params_to_user_object(params)
    new_user = User.new
    new_user.fullname = params[:fullname]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]
    return new_user
  end

  # ------------------
  # LOGIN BEHAVIOR
  # ------------------

  get '/login' do
    @message = _session_message || "Enter your email address and password"
    return erb(:"authentication/login")
  end

  post '/login' do
    email, password = params[:email], params[:password]

    user = login(email, password)
    if user == "not found"
      session[:message] = "This email address does not exist. Please sign up."
      redirect "/login"
    elsif user == "incorrect password"
      session[:message] = "Password incorrect"
      redirect "/login"
    else
      session[:username] = user.username
      redirect "/"
    end
  end

  def login(email, submitted_password)
    user = _user_repo.find_with_text(email)
    return "not found" if user == "not found"

    stored_password = BCrypt::Password.new(user.password)
    return "incorrect password" if stored_password != submitted_password 
      
    return user
  end

  get "/logout" do
    session[:username] = nil
    redirect "/"
  end

  # --------------------
  # USER PRIVATE PROFILE
  # --------------------

  get "/:username" do
    @user = _user_repo.find_with_text(params[:username])
    return erb(:"private/private_profile")
  end

  get "/:username/edit_profile" do
    @user = _user_repo.find_with_text(params[:username])
    @message = _session_message
    return erb(:"private/edit_profile")
  end

  # --------------------------------
  # PERSONAL INFORMATION UPDATE PAGE
  # --------------------------------

  get "/:username/edit_profile/:attribute" do
    @username = params[:username]
    @attribute_name = params[:attribute]
    @message = _session_message

    return erb(:"private/update_attribute")
  end

  post "/:username/edit_profile/:attribute" do
    process = update_profile_with(params)
    fallback_process if process == "failed"

    
    @username = @user_repo.find_with_id(@user_id).username
    session[:username] = @username
    session[:message] = "#{params[:attribute].capitalize} successfully updated."
    redirect "/#{@username}/edit_profile"
  end

  def update_profile_with(params)
    return "failed" if availability_for(params[:new_value]) == "failed"
    
    @user_id = @user_repo.find_with_text(params[:username]).id
    sql_query_args = get_sql_args(params[:attribute], params[:new_value])
    @user_repo.update(sql_query_args[0], sql_query_args[1])
  end

  def availability_for(new_value)
    return _user_repo.find_with_text(new_value) == "not found" ? "granted" : "failed"
  end

  def get_sql_args(attribute_name, new_value)
    case attribute_name
    when "username"
      sql = 'UPDATE users SET username = $1 WHERE id = $2;'
    when "email"
      sql = 'UPDATE users SET email = $1 WHERE id = $2;'
    end

    sql_params = [new_value, @user_id]
    return [sql, sql_params]
  end

  def fallback_process
    session[:message] = "This #{params[:attribute]} is not available"
    @username, @attribute = params[:username], params[:attribute]

    redirect "/#{@username}/edit_profile/#{@attribute}"
  end

  # ------------------
  # UPDATE PASSWORD
  # ------------------

  get "/:username/new_password" do
    @username = params[:username]
    @message = _session_message
    return erb(:"private/new_password")
  end

  post "/:username/new_password" do
    username = params[:username]
    user = _user_repo.find_with_text(username)

    update_status = @user_repo.update_password(
      user, 
      params[:current_password], 
      params[:new_password]
      )
    if update_status == "Current password incorrect"
      session[:message] = update_status
      redirect "/#{username}/new_password"
    elsif update_status == "Password successfully updated"
      session[:message] = update_status
      redirect "/#{username}/edit_profile"
    end
  end

  # ----------------------------
  # CREATE, EDIT AND DELETE PEEP
  # ----------------------------
  post "/new_peep" do
    peep = Peep.new
    peep.time = Time.now
    peep.content = params[:content]
    peep.user_id = _user_repo.find_with_text(session[:username]).id
    _peep_repo.create(peep)

    redirect "/"
  end

  get "/edit_peep/:id" do
    @peep = _peep_repo.find(params[:id]) 
    return erb(:"chat/edit_peep")
  end

  post "/edit_peep/:id" do
    peep = _peep_repo.find(params[:id])
    peep.content = params[:content]
    @peep_repo.update(peep)
    redirect "/"
  end

  get "/delete_peep/:id" do
    @peep = _peep_repo.find(params[:id])
    return erb(:"chat/delete_peep")
  end

  post "/delete_peep/:id" do
    peep = _peep_repo.find(params[:id])
    delete_confirmation = params[:confirmation_answer]

    @peep_repo.delete(peep.id) if delete_confirmation == "Yes"

    redirect "/"
  end

  # --------------
  # DELETE ACCOUNT
  # --------------
  get "/:username/delete_account" do
    @message = _session_message
    @username = params[:username]
    return erb(:"authentication/delete_account")
  end

  post "/:username/delete_account" do
    confirmation = params[:confirmation]
    password = params[:password]
    username = params[:username]

    user = _user_repo.find_with_text(username)
    deletion_confirmed = confirmation == "confirm delete account"
    password_correct = BCrypt::Password.new(user.password) == password

    if deletion_confirmed && password_correct
      @user_repo.delete(user.id)
      session[:username] = nil
      redirect "/"
    else
      session[:message] = "Sorry, something went wrong."
      redirect "/#{username}/delete_account"
    end
  end

  private 

  def _user_repo
    @user_repo ||= UserRepository.new
  end

  def _peep_repo
    @peep_repo ||= PeepRepository.new
  end

  def _session_message
    session.delete(:message)
  end
end
