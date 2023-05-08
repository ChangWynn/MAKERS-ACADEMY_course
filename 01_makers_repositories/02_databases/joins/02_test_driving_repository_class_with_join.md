# Test-driving a Repository method with a JOIN

_**This is a Makers Bite.** Bites are designed to train specific skills or
tools. They contain an intro, a demonstration video, some exercises with an
example solution video, and a challenge without a solution video for you to test
your learning. [Read more about how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to test-drive "Model" and "Repository" classes to SELECT related records from the database.

## Demonstration

[It's a bit easier to follow on the video.](https://www.youtube.com/watch?v=9G7XmM2uoR0)

## Intro

You've previously learned how to test-drive a method `find` that retrieves a single record, and return a model object.

To select an artist and all the corresponding albums, we could write the following code:

```ruby
artist_repository = ArtistRepository.new
album_repository = AlbumRepository.new

artist = artist_repository.find(1)

albums = album_repository.all

# And then filter the albums array depending on the artist_id value
```

However this is not great because of the N+1 problem mentioned in the previous section. 

You've learned how to use `JOIN` to select data from two tables in a single query, to solve this problem. In this section, you'll learn how to build a method `find_with_****`, that returns a single record, alongside its related rows in the other table.

For example, we could fetch a single artist, and get its related albums this way:

```ruby
# Example:

repository = ArtistRepository.new

# Perfoms a SELECT with a JOIN and returns an Artist object.
# This object also has an attribute .albums, which is an array
# of Album objects.
artist = repository.find_with_albums(1)

artist.id # 1

artist.albums # is an array of Album objects
artist.albums.last.id # 12
```

We'll need to add the attribute `albums` to the `Artist` class. By default, this would be an empty array.

```ruby
# file: lib/artist.rb

class Artist
  attr_accessor :id, :name, :genre, :albums

  def initialize
    @albums = []
  end
end
```

Then we'll test-drive, encoding the expected behaviour as an RSpec test.

```ruby
# file: spec/artist_repository_spec.rb

describe ArtistRepository do

  # (...)

  it 'finds artist 1 with related albums' do
    repository = ArtistRepository.new
    artist = repository.find_with_albums(1)

    expect(artist.name).to eq('Pixies')
    expect(artist.albums.length).to eq(3)
  end
end
```

And then the method implementation:

```ruby
# file: lib/artist_repository.rb

class ArtistRepository
  def find_with_albums(id)
    sql = 'SELECT artists.id,
                  artists.name,
                  artists.genre,
                  albums.id AS album_id,
                  albums.title,
                  albums.release_year
          FROM artists
          JOIN albums ON albums.artist_id = artists.id
          WHERE artists.id = $1;'

    params = [id]

    result = DatabaseConnection.exec_params(sql, params)

    artist = Artist.new

    artist.id = result.first['id']
    artist.name = result.first['name']
    artist.genre = result.first['genre']

    result.each do |record|
      album = Album.new
      album.id = record['album_id']
      album.title = record['title']
      album.release_year = record['release_year']

      artist.albums << album
    end

    return artist
  end
end
```

## Exercise

Use the database `student_directory_2` from the previous section.

If you didn't design and create the tables previously, [load this SQL into the database](../resources/seeds/student_directory_2.sql).

1. Test-drive and implement the three classes for the `students` and `cohorts` table.   
  You should end up with three classes:
    * `Student`
    * `Cohort`
    * `CohortRepository` — test-drive the method `find_with_students`.

2. Write a small program in `app.rb` using the class `CohortRepository` to print out the data of one cohort with its students to the terminal.

<!-- OMITTED -->

## Challenge

Use the database `blog` you created [in this earlier challenge.](../challenges/06_designing_schema_two_tables.md#challenge)

1. Test-drive and implement the three classes for the `posts` and `comments` tables.

2. Write a small program in `app.rb` using the class `PostRepository` to print out the data of one post with its comments to the terminal.

[Next Challenge](03_using_joins_with_many_to_many.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=joins%2F02_test_driving_repository_class_with_join.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=joins%2F02_test_driving_repository_class_with_join.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=joins%2F02_test_driving_repository_class_with_join.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=joins%2F02_test_driving_repository_class_with_join.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=joins%2F02_test_driving_repository_class_with_join.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
