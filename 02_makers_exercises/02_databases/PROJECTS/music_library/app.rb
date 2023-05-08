require_relative './lib/album_repository'
require_relative './lib/artist_repository'
require_relative './lib/database_connection'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    choice = nil
    @io.puts 'Welcome to the music library manager!'
    while choice != 0
      @io.puts 'What would you like to do?'
      @io.puts ' 1 - List all albums'
      @io.puts ' 2 - List all artists'
      @io.puts ' 3 - Add an album'
      @io.puts 'Enter your choice:'
      choice = @io.gets.chomp.to_i
      if choice == 1
        @io.puts "Here is the list of albums:"
        albums = @album_repository.all
        albums.each { |album| @io.puts " * #{album.id} - #{album.title}"}
      elsif choice == 2
        @io.puts "Here is the list of artists:"
        artists = @artist_repository.all
        artists.each { |artist| @io.puts " * #{artist.id} - #{artist.name}"}
      elsif choice == 3
        @io.puts 'What is the title?'
        title = @io.gets.chomp
        @io.puts 'What is the release year?'
        release_year = @io.gets.chomp
        @io.puts 'What is the artist_id?'
        artist_id = @io.gets.chomp
        album = Album.new
        album.title = title
        album.release_year = release_year
        album.artist_id = artist_id
        @album_repository.create(album)
      end
    end
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end


# require_relative 'lib/database_connection'
# require_relative 'lib/album_repository'

# DatabaseConnection.connect('music_library')

# repository = AlbumRepository.new

# album = Album.new
# album.title = 'Trompe le Monde'
# album.release_year = 1991
# album.artist_id = 1

# repository.create(album)



# repository.delete(15)


# all_albums = repository.all

# all_albums.each do |album|
#   p album
# end