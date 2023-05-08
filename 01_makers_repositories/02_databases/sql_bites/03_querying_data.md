# Querying data

_**This is a Makers Bite.** Bites are designed to train specific skills or
tools. They contain an intro, a demonstration video, some exercises with an
example solution video, and a challenge without a solution video for you to test
your learning. [Read more about how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to write `SELECT` SQL queries to select and filter records from a table.

<!-- OMITTED -->

## Introduction

The `SELECT` SQL query is used to retrieve records from a table.

Here's the general syntax of a `SELECT` query:

```
SELECT [columns to select] FROM [table name];
```

The result of running a `SELECT` query on the database is called a **result set**, and is also in the shape of a table.

The columns of that result set will be the ones you asked for in the query, and the rows are all the matching records.

## Selecting columns in the result set

Here's a simple `SELECT` query that we can run on the music library database. It selects records from the table `albums`, keeping in the result set only values for the columns `id` and `title`. 

```sql
SELECT id, title FROM albums;
```

Run this query and you should get the following **result set**. We didn't specify any condition yet, so we get _all_ records in the table.

```
 id |        title         
----+----------------------
  1 | Doolittle
  2 | Surfer Rosa
  3 | Waterloo
  4 | Super Trouper
  5 | Bossanova
  6 | Lover
  7 | Folklore
  8 | I Put a Spell on You
  9 | Baltimore
```

(You can use the up and down arrow keys to scroll this result set in your terminal, and use `q` to exit and go back to the REPL).

## Filtering

So far you've been querying _all_ records from the table, without picking the ones you needed.

We can filter records by adding conditions to the query, with the `WHERE` keyword. Here's the general syntax:

```
SELECT [columns to select] FROM [table name] WHERE [conditions];
```

And here are some examples. They also contain some SQL comments (a commented line is started with `--`).

```sql
-- From albums,
-- filter where id is '2',
-- and select only values for the columns id, title and release_year.
SELECT id, title, release_year
  FROM albums
  WHERE id = 2;

-- From albums,
-- filter where title is 'Doolittle',
-- and select only values for the columns id, title and release_year.

-- Make sure to always use single quotes ('')
-- to delimitate strings in conditions.
SELECT id, title, release_year
  FROM albums
  WHERE title = 'Doolittle';

-- We can use =, <, <=, >, >=
-- to compare values.

-- From albums,
-- filter where release_year is greater than 1990,
-- and select only values for the columns id, title and release_year.
SELECT id, title, release_year
  FROM albums
  WHERE release_year > 1990;

-- We can use the keywords AND and OR
-- to combine conditions.

-- From albums,
-- filter where release_year is greater than 1990 AND artist_is is '1',
-- and select only values for the columns id, title, release_year and artist_id.
SELECT id, title, release_year, artist_id
  FROM albums
  WHERE release_year > 1989 AND artist_id = 1;
```

*You'll note that we can write a SQL query over more than one line, to improve readability, since we always end a query with the semicolon `;`*

## Primary and foreign keys

You've probably noticed, by now, the two columns having `id` in their name (`id` and `artist_id`), and storing only numeric values. These columns are called "keys", and they come in two different types:
  * The first column `id` is the **primary key**. Every table has a primary key, and it is by convention always called `id`.  
  Values for this column are used to uniquely identify each record, a bit like a social security number. You usually won't pick the value to insert, as PostgreSQL can automatically assign a new value for this column when a new row is inserted, ensuring it's unique.
  * The second column `artist_id` is called a **foreign key**. It is used to indicate which artist record (in the `artists` table) is associated with an album record.  
  For example, in the last query from the examples above, we've asked for all albums having the value `1` for `artist_id`. This value `1` points to a **primary key** value in the `artists` table (this means all album records with the same `artist_id` belong to the same artist record).

```
  albums                                                    artists

 id |        title         | artist_id |                  | id |     name     
----+----------------------+-----------+                  |----+--------------
  1 | Doolittle            |         1 | ---------------> |  1 | Pixies
  2 | Surfer Rosa          |         1 |                  |    |
  3 | Waterloo             |         2 | ---------------> |  2 | ABBA
  4 | Super Trouper        |         2 |                  
  5 | Bossanova            |         1 |                                
```

## Demonstration

[Here's a video demonstration.](https://www.youtube.com/watch?v=9wT1FVQbPZw&t=935s) Make sure you attempt the exercise before watching the solution.

## Exercise One

Run a `SELECT` query to list values for the column `release_year` from the `albums` table.

You should get a similar result set:

```
 release_year 
--------------
         1989
         1988
         1974
         1980
         1990
         2019
         2020
         1965
         1978
```

[Solution video](https://www.youtube.com/watch?v=9wT1FVQbPZw&t=1619s)

## Exercise Two

Run a filtered `SELECT` query to list only the `release_year` of the album with title `'Bossanova'`.

You should get the following result set:

```
 release_year 
--------------
         1990
(1 row)
```

[Solution video](https://www.youtube.com/watch?v=9wT1FVQbPZw&t=1619s)

## Challenge

Find the titles of the albums released by 'Pixies' _and_ released between 1980 and 1990 (inclusive).

You should get the following result set:

```
       title        
--------------------
 Doolittle
 Surfer Rosa
 Bossanova
```

[Next Challenge](04_updating_and_deleting_date.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=sql_bites%2F03_querying_data.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=sql_bites%2F03_querying_data.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=sql_bites%2F03_querying_data.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=sql_bites%2F03_querying_data.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=sql_bites%2F03_querying_data.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
