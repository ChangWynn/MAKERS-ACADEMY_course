require_relative "lib/database_connection"
require_relative "lib/book_repository"

DatabaseConnection.connect("book_store")

book_repo = BookRepository.new

book_repo.all.each do |book|
  p "#{book.id} - #{book.title} - #{book.author_name}"
end

p book_repo.find(5)