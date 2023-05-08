# Setting up a project

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to setup a Ruby project that connects to a database.

<!-- OMITTED -->

## Introduction

In this series of challenges you will build a few different projects. Before we get started, you'll need to set up a new RSpec project.

This project will use a few components:

* **Ruby and RSpec**  
  The programming language and test framework will be the same as what you've previously used.
* **The `pg` gem**  
  This library allows us to send SQL queries to the database, and retrieve the result set.
* **A class `DatabaseConnection`**  
  This class acts as a thin layer with methods to connect to PostgreSQL and send SQL queries to it.

[To set up your project follow this guide.](../pills/setting_up_database_project.md)

Follow the guidance linked above to create a new project `music_library`. Then move on to the next step.

## Demonstration

[A video demonstration is here.](https://www.youtube.com/watch?v=9pwchQJwc5Q).

## Setting up the test database

We don't want our RSpec tests to use and modify with the data used by our program users. Therefore we need to create a new database which will be used only by RSpec tests. Such a database is usually suffixed by `_test`. Let's create a test version of the `music_library` database:

```bash
# In your terminal

createdb music_library_test
```

Then make sure you connect to this database in your `spec_helper.rb` file:

```ruby
# file: spec/spec_helper.rb

DatabaseConnection.connect('music_library_test')
```


[Next Challenge](02_test_driving_model_repository_classes.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F01_setting_up_project.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F01_setting_up_project.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F01_setting_up_project.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F01_setting_up_project.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=challenges%2F01_setting_up_project.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
