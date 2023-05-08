# Creating new data

_**This is a Makers Bite.** Bites are designed to train specific skills or
tools. They contain an intro, a demonstration video, some exercises with an
example solution video, and a challenge without a solution video for you to test
your learning. [Read more about how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to write `INSERT` SQL queries to create new records.

## Introduction

We use the `INSERT` query to create new records into a table. The general syntax is:

```sql
INSERT INTO [table name]
  ( [list of columns] )
  VALUES( [list of values] );
```

In the list of columns, we can choose to specify only the columns we need to insert values for.

For the sake of simplicity, it's best to always specify _all_ columns to insert, except for the `id` column, as it is configured to be generated automatically by PostgreSQL.

Run the following in the `psql` REPL:
```sql
-- We don't specify the value for the `id`
-- column, the database will automatically pick one.
INSERT INTO artists 
  (name, genre)
  VALUES('Massive Attack', 'Alternative');
```

## Demonstration

[Here's a video demonstration.](https://www.youtube.com/watch?v=9wT1FVQbPZw&t=2218s) Make sure you attempt the exercise before watching the solution.

## Exercise

1. `INSERT` a new record in `albums` with title 'Mezzanine', and release year 1998.
2. We forgot to link this new record with the correct artist. Use an `UPDATE` query to update the `artist_id` of that new album with Massive Attack (it should have the `id` value 5).

[Solution video](https://www.youtube.com/watch?v=9wT1FVQbPZw&t=2385s)

## Challenge

Insert a new artist of your choice, and a new album related to that artist ([here's an idea](https://en.wikipedia.org/wiki/OK_Computer), if you can't pick one).

Then run a `SELECT` query to check the new artist is now in the table.

[Next Challenge](06_using_table_plus.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=sql_bites%2F05_creating_new_data.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=sql_bites%2F05_creating_new_data.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=sql_bites%2F05_creating_new_data.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=sql_bites%2F05_creating_new_data.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=sql_bites%2F05_creating_new_data.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
