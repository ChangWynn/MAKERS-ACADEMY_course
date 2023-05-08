# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem
_Put or write the user story here. Add any clarifying notes you might have._
As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.


## 2. Design the Class Interface
_Include the initializer and public methods with all parameters and return values._

```ruby
class Playlist
  def initialize
    @tracks = []
  end

  def add_track(track) #track is an array
    # add track into @tracks
    # don't return anything
  end

  def see_playlist
    # return list of tracks
  end
end
```
## 3. Create Examples as Tests
_Make a list of examples of how the class will behave in different situations._
```ruby

# 0 printby default, see_playlist return []
# see_playlist => []

# 1 track is an empty string
# add_track("") => []

# 2 add track and print track
# add_track("thriller") => ["thriller"]

# 3 add multiple tracks and print playlist
# add_track("thriller")
# add_track("hotel california")
# => ["thriller", "hotel california"]

# 4 user is adding multiple track at once
# add_track("thriller", "hotel california") => ["thriller", "hotel california"]

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
