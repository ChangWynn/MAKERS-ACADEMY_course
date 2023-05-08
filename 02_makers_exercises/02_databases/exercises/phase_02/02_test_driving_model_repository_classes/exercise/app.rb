require_relative 'lib/database_connection'
require_relative 'lib/album_repository'

DatabaseConnection.connect('music_library')

album_repo = AlbumRepository.new

album_repo.all.each do |album|
  p album
end

