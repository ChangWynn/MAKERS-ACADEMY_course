require_relative "./account"

class AccountRepository
  def all
    accounts = []
    sql = 'SELECT * FROM accounts;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      accounts << _record_to_object(record)
    end
    return accounts
  end

  def find(id)
    sql = 'SELECT * FROM accounts WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    record = result_set[0]

    return _record_to_object(record)
  end 

  def create(account)
    sql = 'INSERT INTO accounts 
            (username, email) 
            VALUES($1, $2)'
    sql_params = [account.username, account.email]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM accounts WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end

  def update(account)
    sql = 'UPDATE accounts SET username = $1, email = $2 WHERE id = $3;'
    sql_params = [account.username, account.email, account.id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  private

  def _record_to_object(record)
    account = Account.new
    account.id = record["id"]
    account.username = record["username"]
    account.email = record["email"]
    return account
  end
end