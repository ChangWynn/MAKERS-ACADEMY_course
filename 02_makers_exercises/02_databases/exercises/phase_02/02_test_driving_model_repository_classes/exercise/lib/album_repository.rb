require_relative "./album"

class AlbumRepository
  def all
    sql = "SELECT * FROM albums;"
    result = DatabaseConnection.exec_params(sql, [])
    albums = []
    result.each do |album|
      new_album = Album.new
      new_album.id = album["id"]
      new_album.title = album["title"]
      new_album.release_year = album["release_year"]
      new_album.artist_id = album["artist_id"]
      albums << new_album
    end
    return albums
  end

  def find(id)
    sql = "SELECT * FROM albums WHERE id=#{id};"
    result = DatabaseConnection.exec_params(sql, [])

    album = Album.new
    album.id = result[0]["id"]
    album.title = result[0]["title"]
    album.release_year = result[0]["release_year"]
    album.artist_id = result[0]["artist_id"]
    return album
  end

  def create(title, release_year)
    sql = "INSERT INTO albums (title, release_year) VALUES(\'#{title}\', \'#{release_year}\');"
    result = DatabaseConnection.exec_params(sql, [])
  end
  def delete(id)
    sql = "DELETE FROM albums WHERE id = #{id};"
    result = DatabaseConnection.exec_params(sql, [])
  end
end


