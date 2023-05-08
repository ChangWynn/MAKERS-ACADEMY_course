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
  before(:each) do
    reset_album_table
  end

  context "#all method" do
    it "should return a empty list" do
      empty_table
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
    it "should return an album given its id" do
      result = subject.find("1")

      expect(result.title).to eq "Doolittle"
      expect(result.release_year).to eq "1989"
    end
    it "should return an album given its id" do
      result = subject.find("1")

      expect(result.title).to eq "Doolittle"
      expect(result.release_year).to eq "1989"
    end
  end

  context "#create method" do
    it "should add a new album to the table" do
      album = double :Album, title: "Lose Yourself", release_year: "2002", artist_id: "3"
      subject.create(album)
      expect(subject.all.length).to eq 5

      result = subject.find(5)
      expect(result.id).to eq "5"
      expect(result.title).to eq "Lose Yourself"
      expect(result.release_year).to eq "2002"
    end
  end

  context "#delete method" do
    it "should delete album from the table" do
      subject.delete(3)
      expect(subject.all.length).to eq 3
      expect(subject.all[2].title).to eq "Super Trouper"
      expect{ subject.find(3) }.to raise_error IndexError
    end
  end

  context "#update method" do
    it "should update an existing album in the table" do
      album = subject.find(3)
      album.title = "Lose Yourself"
      album.release_year = "2002"
      
      subject.update(album)
      result = subject.find(3)
      expect(result.title).to eq "Lose Yourself"
      expect(result.release_year).to eq "2002"
    end
    it "should update an existing album in the table" do
      album = subject.find(2)
      album.release_year = "8819"

      subject.update(album)
      result = subject.find(2)
      expect(result.title).to eq "Surfer Rosa"
      expect(result.release_year).to eq "8819"
    end
  end

  
end

