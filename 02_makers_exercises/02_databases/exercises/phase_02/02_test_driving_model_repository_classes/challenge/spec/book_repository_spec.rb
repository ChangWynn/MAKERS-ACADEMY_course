require "book_repository"

describe BookRepository do
  def reset_students_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end
  def empty_table
    seed_sql = File.read('spec/seeds_books_empty.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_students_table
  end

  context "#all method" do
    it "should return an empty list if database is empty" do
      empty_table
      result = subject.all
      expect(result).to eq []
    end
    it "should return a list of books" do
      result = subject.all
      expect(result.length).to eq 3
      expect(result.first.id).to eq "1"
      expect(result.first.title).to eq "Dracula"
      expect(result.first.author_name).to eq "Bram Stoker"
    end
  end

  context "#find method" do
    it "should return a single book from the id" do
      result = subject.find(3)
      expect(result.id).to eq "3"
      expect(result.title).to eq "Emma"
      expect(result.author_name).to eq "Jane Austen"
    end
  end

  context "#create method" do
    it "should add a new book to the database" do
      subject.create("The Age of Innocence", "Edith Wharton")
      result = subject.all
      expect(result.last.id).to eq "4"
      expect(result.last.title).to eq "The Age of Innocence"
      expect(result.last.author_name).to eq "Edith Wharton"
    end
  end

  context "#update method" do
    it "should add a new book to the database" do
      subject.update("The Age of Innocence", "Edith Wharton", "3")
      result = subject.all
      expect(result.length).to eq 3
      expect(result.last.id).to eq "3"
      expect(result.last.title).to eq "The Age of Innocence"
      expect(result.last.author_name).to eq "Edith Wharton"
    end
  end

  context "#delete method" do
    it "should delete a book from the database" do
      subject.delete(2)
      expect { subject.find(2) }.to raise_error IndexError
      result = subject.all
      expect(result.length).to eq 2
      expect(result.first.id).to eq "1"
      expect(result.last.id).to eq "3"
      expect(result.first.title).to eq "Dracula"
      expect(result.last.title).to eq "Emma"
      expect(result.first.author_name).to eq "Bram Stoker"
      expect(result.last.author_name).to eq "Jane Austen"
    end
  end
end