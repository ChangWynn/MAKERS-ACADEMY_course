require_relative "./album"

class AlbumRepository

  def all
    sql = "SELECT * FROM albums;"
    result = DatabaseConnection.exec_params(sql, [])
    albums = []
    result.each do |record|
      albums << record_to_album(record)
    end
    return albums
  end

  def find(id)
    sql = "SELECT * FROM albums WHERE id= $1;"
    result = DatabaseConnection.exec_params(sql, [id])
    return record_to_album(result[0])
  end

  def create(album)
    sql = "INSERT INTO albums 
            (title, release_year, artist_id) 
            VALUES( $1, $2, $3)"
    sql_params = [album.title, album.release_year, album.artist_id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM albums WHERE id = $1'
    DatabaseConnection.exec_params(sql, [id])
  end

  def update(album)
    sql = "UPDATE albums SET title = $1, release_year = $2 WHERE id = $3"
    sql_params = [album.title, album.release_year, album.id]
    DatabaseConnection.exec_params(sql, sql_params)
  end
  
  private

  def record_to_album(record)
    new_album = Album.new
    new_album.id = record["id"]
    new_album.release_year = record["release_year"]
    new_album.title = record["title"]
    return new_album
  end
end


