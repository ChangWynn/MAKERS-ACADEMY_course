# Test-driving a Repository class

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills.
They contain a mixture of text and video, and may contain some challenge exercises without
proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to test-drive "Model" and "Repository" classes to SELECT records from the database.

## Introduction

In the realm of PostgreSQL, we manipulate tables, column names and records. However, in
Ruby programs, we represent data using classes, objects and attributes. We
therefore need a way to transform the data retrieved from the database into data that
can be used in our program. 

To achieve this, you will learn how to build two kind of classes — they're regular Ruby
classes, but designed to achieve a specific purpose in our program:
* A **Model** class is used to hold a record's data.   
  For example, if we have a table `students`, we'd have a class `Student`, with attributes
  for each column. A single object holds the data for a specific student record. This class usually doesn't contain any logic, but is only used to hold data.

* A **Repository** class implements methods to run SQL queries on the database to retrieve, create, update or delete data.  
  For example, if we have one table `students`, we'd have a class `StudentRepository`
  containing methods that communicates with the database using SQL.

Here's how these classes would be mapped to a project structure:

```
project/
   app.rb
   lib/
      student.rb
      student_repository.rb
   spec/
      student_repository_spec.rb
```

And here's an example behaviour for such two classes, `StudentRepository` and `Student`:

```ruby
repository = StudentRepository.new 

all_students = repository.all # Performs a SELECT query and returns an array of Student objects.

new_student = Student.new
new_student.name = 'Josh'
new_student.cohort_name = 'March 22'

repository.create(new_student) # Creates a new student by performing a INSERT query.
```

This technique (converting records from a database into objects we use in our program) is
also called **object-relational mapping**.

## Demonstration

[It's a bit easier to follow on the video.](https://www.youtube.com/watch?v=fX_IXqDVplg)

## Designing a Repository class

When designing a Repository class, it is good to keep in mind (or better, on a notepad or
document) the list of methods to implement, alongside the SQL query to run.

Here is an example for the class `StudentRepository` described above.

| Method      |Job| Arguments | SQL query it executes                                    | Returns  |
| ----------- |----|-----------| ----------------------------------------------|----------|
| `all`       |Get all students| none      | `SELECT ... FROM students;` | Array of `Student` |
| `find`      |Get one student by ID| An `id` (number) | `SELECT ... FROM students WHERE id = ...;` | A single `Student` |
| `create`    |Insert one student| A `Student` object  | `INSERT INTO students ...` | none |

You can see how we design the methods of the Repository class to use Model objects as arguments or return values, and which SQL queries these methods send to the
database to read, create or update data.

### Design Recipe

Follow this [Design
Recipe](../resources/repository_class_recipe_template.md) to design, test-drive and
implement these two classes for a table. The outline is:
  1. Design and create the table if needed.
  2. Create test SQL seeds.
  3. Define the Model and Repository class names.
  4. Implement the Model class.
  5. Design the Repository class interface.
  6. Write test examples.
  7. Test-driven and implement the Repository class behaviour.

## Exercise

Work in the same project directory `music_library` for this exercise.

1. Copy the [Design Recipe Template](../resources/repository_class_recipe_template.md) and
   adapt it to test-drive and implement the two classes for the `albums` table. 

    **You should skip step 1**, as the table is already created in your database.

2. Write a small program in `app.rb` using the class `AlbumRepository` to print out the
   list of albums to the terminal.

[Video solution](https://www.youtube.com/watch?v=NhAS1pnjfK4)

<!-- OMITTED -->

## Challenge

This is a process feedback challenge. That means you should record yourself doing it and
submit that recording to your coach for feedback. [How do I do
this?](https://github.com/makersacademy/golden-square/blob/main/pills/process_feedback_challenges.md)

To work on this challenge, first:
  * Setup a new project directory `book_store` [following the
    guidance](../pills/setting_up_database_project.md).
  * Create a new database `book_store`.
  * [Import this SQL seed into that new database.](../resources/seeds/book_store.sql)

Then, start recording yourself, and: 
1. Copy the [Design Recipe Template](../resources/repository_class_recipe_template.md) and
   adapt it to test-drive and implement the two classes for the `books` table. Since the table is already created, so you can skip step 1.
2. Write a small program in `app.rb` using the class `BookRepository` to print out the
   list of books to the terminal. You should get an output that looks roughly like this:

```bash
# In the project directory book_store

$ ruby app.rb

1 - Nineteen Eighty-Four - George Orwell
2 - Mrs Dalloway - Virginia Woolf
3 - Emma - Jane Austen
4 - Dracula - Bram Stoker
5 - The Age of Innocence - Edith Wharton
```

[After you're done, submit your recording here](https://airtable.com/shrNFgNkPWr3d63Db?prefill_Item=db_as01).

[Next Challenge](03_creating_sequence_diagrams.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F02_test_driving_model_repository_classes.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F02_test_driving_model_repository_classes.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F02_test_driving_model_repository_classes.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F02_test_driving_model_repository_classes.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F02_test_driving_model_repository_classes.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
