require_relative "./artist"

class ArtistRepository

  def all
    sql = "SELECT * FROM artists;"
    result = DatabaseConnection.exec_params(sql, [])
    artists = []
    result.each do |record|
      artists << record_to_artist(record)
    end
    return artists
  end

  def find(id)
    sql = "SELECT * FROM artists WHERE id= $1;"
    result = DatabaseConnection.exec_params(sql, [id])
    return record_to_artist(result[0])
  end

  def create(artist)
    sql = "INSERT INTO artists 
            (name, genre) 
            VALUES( $1, $2)"
    sql_params = [artist.name, artist.genre]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM artists WHERE id = $1'
    DatabaseConnection.exec_params(sql, [id])
  end

  def update(artist)
    sql = "UPDATE artists SET name = $1, genre = $2 WHERE id = $3"
    sql_params = [artist.name, artist.genre, artist.id]
    DatabaseConnection.exec_params(sql, sql_params)
  end
  
  private

  def record_to_artist(record)
    artist = Artist.new
    artist.id = record["id"]
    artist.name = record["name"]
    artist.genre = record["genre"]
    return artist
  end
end


