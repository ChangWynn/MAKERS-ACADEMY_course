# {{TABLE NAME}} Model and Repository Classes Design Recipe

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

*In this template, we'll use an example table `students`*

```
# EXAMPLE
Table: students
Columns:
id | name | cohort_name
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)
-- Write your SQL seed here. 
-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)
TRUNCATE TABLE accounts RESTART IDENTITY; -- replace with your own table name.
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO accounts (username, email) VALUES ('Chang', 'chang@gmail.com');
INSERT INTO accounts (username, email) VALUES ('Jim', 'jim@gmail.com');

TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO posts (title, content, views) VALUES ('Hello World', 'A software engineer journey', '100');
INSERT INTO posts (title, content, views) VALUES ('Hi there', 'My cname is Chang', '10');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# Model class
class Account
end
# Repository class
class AccountRepository
end
# Model class
class Post
end
# Repository class
class PostRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Model class
  # Replace the attributes by your own columns.
Account = Struct.new(:username, :email)
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: students
# Repository class
class AccountRepository
  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students;
    # some logic
    # Returns an array of albums objects.
  end
  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;
    # some logic
    # Returns a single Student object.
  end
  # Add more methods below for each operation you'd like to implement.
  def create(account/post)
  # sql query
  # some logic
  #do not return anything
  end
  def update(student)
    # some logic
   #do not return anything
  end
  def delete(student)
   # some logic
   #do not return anything
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES
# 1 ALL
# Get all students
expect subject.all.lenght => 2
expect subject.all.first.username => chang
expect subject.all.first.email => chang@gmail.com
expect subject.all.last.username => jim
expect subject.all.last.email => jim@gmail.com

# 2 FIND

subject.find(2)
expect subject.username => jim
expect subject.email => jim@gmail.com
# Add more examples for each method

# 3 CREATE METHOD

account = Account.new
account.username = jo
account.email = jo@gmail.com
subject.create(account)

expect subject.all.length => 3
expect subject.all.last.username => jo
expect subject.all.llast.email => jo@gmail.com


# Add more examples for each method

# 3 DELETE METHOD
subject.delete(2)
subject.all.length => 1

subject.find(2) => IndexError
# Add more examples for each method

# 3 UPDATE METHOD
account = subject.find(1)
account.username = jane
account.email = jane@gmail.com

subject.update(account)

result = subject.find(1)
expect result.username = jane
expect result.email = jane@gmail.com
# 3.1 UPDATE METHOD
account = subject.find(1)

account.email = chang2@gmail.com

subject.update(account)

result = subject.find(1)
expect result.username = 'chang'
expect result.email = chang2@gmail.com

# Add more examples for each method

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE
# file: spec/student_repository_spec.rb
def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end
describe StudentRepository do
  before(:each) do 
    reset_students_table
  end
  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._