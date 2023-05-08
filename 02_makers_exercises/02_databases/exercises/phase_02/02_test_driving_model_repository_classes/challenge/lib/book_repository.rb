require_relative "./book.rb"

class BookRepository
  def all
    books = []
    sql = "SELECT * FROM books;"
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |book|
      new_entry = Book.new
      new_entry.id = book["id"]
      new_entry.title = book["title"]
      new_entry.author_name = book["author_name"]
      books << new_entry
    end

    return books
  end

  def find(id)
    sql = "SELECT * FROM books WHERE id = #{id};"
    result_set = DatabaseConnection.exec_params(sql, [])

    
    new_entry = Book.new
    new_entry.id = result_set[0]["id"]
    new_entry.title = result_set[0]["title"]
    new_entry.author_name = result_set[0]["author_name"]

    return new_entry
  end

  def create(title, author_name)
    sql = "INSERT INTO books (title, author_name) VALUES('#{title}', '#{author_name}');"
    DatabaseConnection.exec_params(sql, [])
  end

  def update(title, author_name, id)
    sql = "UPDATE books SET title = '#{title}', author_name = '#{author_name}' WHERE id = #{id};"
    DatabaseConnection.exec_params(sql, [])
  end

  def delete(id)
    sql = "DELETE FROM books WHERE id = #{id};"
    DatabaseConnection.exec_params(sql, [])
  end
end
