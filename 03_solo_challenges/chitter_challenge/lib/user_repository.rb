require "bcrypt"
require_relative "./user"
require_relative "./record_methods"

class UserRepository

  # ------------
  # FIND METHOD
  # ------------

  def find_with_id(id)
    sql = "SELECT * FROM users WHERE  id = $1;"
    result_set = DatabaseConnection.exec_params(sql, [id])
    
    return _record_to_user_object(result_set)
  end

  def find_with_text(string)
    sql = "SELECT * FROM users WHERE  username = $1 OR email = $1;"
    result_set = DatabaseConnection.exec_params(sql, [string])

    return _record_to_user_object(result_set)
  end

  def find_with_object(user)
    sql = "SELECT * FROM users WHERE username = $1 OR email = $2;"
    params = [user.username, user.email]
    result_set = DatabaseConnection.exec_params(sql, params)

    return result_set.ntuples.positive? ? "found" : "not found"
  end

  def create(new_user)
    return "already exists" if find_with_object(new_user) == "found"

    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = 'INSERT INTO users (fullname, username, email, password)
            VALUES($1, $2, $3, $4);'
    params = [new_user.fullname, new_user.username, new_user.email, encrypted_password]
    DatabaseConnection.exec_params(sql, params)
    return "is successfully registered"
  end 

  def update(sql, sql_params)
    DatabaseConnection.exec_params(sql, sql_params)
    return "The user profile has been successfully updated."
  end 

  def update_password(user, old_password, new_password)
    old_password_check = BCrypt::Password.new(user.password) == old_password
    return "Current password incorrect" if old_password_check == false

    encrypted_password = BCrypt::Password.create(new_password)
    sql = 'UPDATE users SET password = $1 WHERE id = $2;'
    sql_params = [encrypted_password, user.id]
    DatabaseConnection.exec_params(sql, sql_params)

    return "Password successfully updated"
  end 

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
    return "Account deleted"
  end

  private

  def _record_to_user_object(result_set)
    return "not found" if result_set.ntuples.zero?

    record = result_set[0]
    user = Record.to_user(record)
    user_with_peeps = _get_peeps(user)
    return user_with_peeps
  end

  def _get_peeps(user)
    sql = "SELECT * FROM peeps WHERE user_id = $1;"
    result = DatabaseConnection.exec_params(sql, [user.id])
    result.each do |record|
      user.peeps << Record.to_peep(record)
    end
    return user
  end
end
