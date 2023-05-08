require 'sinatra/base'
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  post '/hello' do
    params.each do |key, value| 
      @message = "invalid character detected"
      return erb(:error) if value.match?(/[^\w\d-]+/)
    end

    name = params[:name]

    return erb(:hello)
  
  end
end



