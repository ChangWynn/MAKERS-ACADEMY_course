# Test-driving a Repository class "find" method

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills.
They contain a mixture of text and video, and may contain some challenge exercises without
proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to test-drive a "Repository" class method to SELECT a single record from the
database.

## Intro

You previously learned how to test-drive a Repository class method to retrieve _all_ records
from a table (we named this method `all`). 

In this section, you will learn how to test-drive a method `find` that returns _a single
record using its id_. It will perform a filtered `SELECT` query to retrieve that single
row.

Here is the expected behaviour for this method:

```ruby
repository = StudentRepository.new 

student = repository.find(1) # Performs a SELECT query and returns a single Student object.

student.id # 1
student.name # "David"
```

And its design:

| Method      |Job| Arguments | SQL query it performs                                    | Returns  |
| ----------- |----|-----------| ----------------------------------------------|----------|
| `find`      |Get one student by ID| An `id` (number) | `SELECT ... ` | A single `Student` |

### Micro Exercise

Write the SQL query to select the record with id `1` from the `albums` table.

## SQL parameters

We need our Ruby method to receive the id to find as an argument, and build a SQL query
that uses this value to find the right record.

We'll use what is called a SQL **parameter**. Here's an example of a "parameterised"
query:

```sql
SELECT name, cohort_name FROM students WHERE id = $1;
```

The placeholder `$1` is then dynamically replaced by our program when executing the query.
Here's how it looks like once implemented with Ruby:

```ruby
# file: lib/student_repository.rb

class StudentRepository

  def find(id)
    # The placeholder $1 is a "parameter" of the SQL query.
    # It needs to be matched to the corresponding element 
    # of the array given in second argument to exec_params.
    #
    # (If we needed more parameters, we would call them $2, $3...
    # and would need the same number of values in the params array).
    sql = 'SELECT name, cohort_name FROM students WHERE id = $1;'

    params = [id]

    result = DatabaseConnection.exec_params(sql, params)

    # (The code now needs to convert the result to a
    # Student object and return it)
  end
end
```

## Demonstration

[Here's a video demonstration.](https://www.youtube.com/watch?v=0Uog3mL--Nc)

## Exercise

_Work in the project directory `music_library` you've worked on before._

Use the Design recipe document used to test-drive the `AlbumRepository#all`
method previously — following the steps 5 to 8 for the new `AlbumRepository#find` method. 

1. Test-drive and implement the method `find` on the `AlbumRepository` class. 
2. Modify the program in `app.rb` so it prints out to the terminal the data of the record
   with id `3`, using the new method.

[Example Video solution](https://www.youtube.com/watch?v=NjHsqKMziuI)

## Challenge

To work on this challenge, first:
  * Setup a new project directory `recipes_directory`.
  * Create a new database `recipes_directory`.
  * Create a new test database `recipes_directory_test` for your tests.

Then:

1. Design and create the table for the following user stories.  

    ```
    As a food lover,
    So I can stay organised and decide what to cook,
    I'd like to keep a list of all my recipes with their names.

    As a food lover,
    So I can stay organised and decide what to cook,
    I'd like to keep the average cooking time (in minutes) for each recipe.

    As a food lover,
    So I can stay organised and decide what to cook,
    I'd like to give a rating to each of the recipes (from 1 to 5).
    ```
2. Test-drive the Repository class for this new table. You should design,
   test-drive and implement two methods `all` and `find`.
3. Write code in the main file `app.rb` so it prints out the list of recipes.


[Next Challenge](06_designing_schema_two_tables.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F05_test_driving_find_method.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F05_test_driving_find_method.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F05_test_driving_find_method.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F05_test_driving_find_method.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F05_test_driving_find_method.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
