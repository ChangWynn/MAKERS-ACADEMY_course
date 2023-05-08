# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

<!--
So that I can record my experiences
I want to keep a regular diary
class = diary

So that I can reflect on my experiences
I want to read my past diary entries
method: all => return all entry diaries

So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed
method "" > return best entry for reading time (wpm * time_available)

So that I can keep track of my tasks
I want to keep a todo list along with my diary
class todo_list

So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries 
method = print #number from diary entries
-->


## 2. Design the Class System
_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    @entries = []
    @todo_list = {complete: [], incomplete: []}
  end

  def entries
    #return a list of entries
  end

  def todo_list
    #return list of incomplete tasks
  end
  
  def phone_numbers
    #return a list of #phone numbers extracted from the entries
  end

  def find_best_entry(wpm, minutes)
    # wpm is the number of word the user can read per minutes
    # minutes is the amount of time the user has available for reading
    # the method returns the entry that has the closest or exact amount of words the user can read in the limit of time he has defined.
  end
end

class Task
  def intialize(task)
    #...
  end
  def add(class_object)
    # add task to todo_list > incomplete
    # do not return anything
  end
  def mark_done(class_object)
    # mark a task as completed
    # do not return antyhing
  end
end

class DiarEntry
  def intialize(content)
    #...
  end
  def add(class_object)
    # add entry to diary object
    # do not return anything
  end
  def count_word
    # counts the number of word in entry
    # returns an integer.
  end
  def extract_numbers
    # extract valid phone numbers from entry.
    # a valid phone number is a number that has 11 digits.
    # return a list of numbers. numbers are strings.
  end
end
```
## 3. Create Examples as Integration Tests

```ruby

```

## 4. Create Examples as Unit Tests

```ruby

```

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._