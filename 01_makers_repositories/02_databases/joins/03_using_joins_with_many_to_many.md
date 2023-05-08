# Using many-to-many relationships

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to select using a `JOIN` with many-to-many relationship between two tables.

## Introduction

Let's consider the two following tables:

```sql
create table posts (
	id SERIAL PRIMARY KEY,
	title text
);

create table tags (
	id SERIAL PRIMARY KEY,
	name text 
);
```

A single post can be associated with many different tags (e.g one post tagged with `coding`, `ruby`), but a
single tag could also be associated with different posts (many posts could be tagged with
`coding`).

A **many-to-many relationship** is needed when a record from the first table can have
_many_ records in the other table, and the other way is also true.

Such a relationship is made with a third table used to associate records between the two tables. This
third table is called a **join table**

## Importing the seed data

Import the seed data in the file
[`blog_posts_tags.sql`](../resources/seeds/blog_posts_tags.sql) into a new database. This
will create three tables (`posts`, `tags`, and their join table `posts_tags`) and insert some records.

Once this is done, use TablePlus or `psql` to work through the following examples and exercises.

## Using a `JOIN` to select

```sql
-- Select all the tags associated with a given post.
-- Note how we're using two different joins to "link"
-- all the three tables together:
--    * first, by matching only records in the join table for the given post
--    * second, by matching only tags for these records in the join table
SELECT tags.id, tags.name
  FROM tags 
    JOIN posts_tags ON posts_tags.tag_id = tags.id
    JOIN posts ON posts_tags.post_id = posts.id
    WHERE posts.id = 2;
```

When writing a complex `JOIN` like above, it's often a good idea to diagram the "path" of the different joins, from the initial condition (here, the post ID) to the final result we need (the tags).

It's often helpful to read such a query in "reverse", starting from the end of it:
  1. We filter records in `posts` by the post ID.
  2. We join the `posts` table with the `posts_tags` join table. 
  3. We join the `posts_tags` join table with the `tags` table.
  4. We get the tags.

## Linking two records

When dealing with a one-to-many relationship, linking two records together would be done
by using the right value for the foreign key on one of the tables.

When using a many-to-many relationship, however, we need to insert a new record in the join table,
using the two primary keys for the two records we need to link together.

```sql

INSERT INTO posts (title) VALUES ('My amazing post');
-- New post inserted with id 3

INSERT INTO tags (name) VALUES ('poetry');
-- New tag inserted with id 5

INSERT INTO posts_tags (post_id, tag_id) VALUES (3, 5);
```

<!-- OMITTED -->

## Exercise One

Use a `SELECT` query with a `JOIN` to retrieve all the posts associated with the tag
`'travel'`.

You should get the following result set:

```
 id |          title          
----+-------------------------
  4 | My weekend in Edinburgh
  6 | A foodie week in Spain
```

<!-- OMITTED -->

## Challenge

Use SQL to insert a new tag `'sql'` and associate the post titled `'SQL basics'` with this tag.

Then use a `SELECT` query with a `JOIN` to retrieve all posts associated with the tag
`'sql'` and verify the above worked.


[Next Challenge](04_designing_many_to_many_relationships.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=joins%2F03_using_joins_with_many_to_many.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=joins%2F03_using_joins_with_many_to_many.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=joins%2F03_using_joins_with_many_to_many.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=joins%2F03_using_joins_with_many_to_many.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=joins%2F03_using_joins_with_many_to_many.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
