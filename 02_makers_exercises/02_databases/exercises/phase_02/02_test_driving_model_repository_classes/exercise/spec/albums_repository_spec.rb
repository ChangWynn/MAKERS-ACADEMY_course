require "spec_helper.rb"
require "album_repository"
require "pg"

RSpec.describe AlbumRepository do
  def reset_album_table
    seed_sql = File.read('spec/seeds_album.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  def empty_table
    seed_sql = File.read('spec/seeds_album_empty.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  let(:empty) { empty_table}
  before(:each) do
    reset_album_table
  end
  after(:context) do
    reset_album_table
  end

  context "#all method" do
    it "should return a empty list" do
      empty
      result = subject.all

      expect(result).to eq []
    end
    it "should return a list of albums" do
      result = subject.all

      expect(result.length).to eq 4
      expect(result.last.id).to eq "4"
      expect(result.last.title).to eq "Super Trouper"
    end
  end

  context "#find method" do
    it "should return an album from its id" do
      result = subject.find("1")

      expect(result.title).to eq "Doolittle"
      expect(result.release_year).to eq "1989"
    end
  end

  context "#create method" do
    it "should update database with new data" do
      subject.create("Rainbow", "1999")

      result = subject.all
      expect(result.last.id).to eq "5"
      expect(result.last.title).to eq "Rainbow"
      expect(result.last.release_year).to eq "1999"
    end
  end

  context "#delete method" do
    it "should delete an entry from the database" do
      subject.delete("4")

      result = subject.all
      expect(result.last.id).to eq "3"
      expect(result.last.title).to eq "Waterloo"
    end
  end
end

