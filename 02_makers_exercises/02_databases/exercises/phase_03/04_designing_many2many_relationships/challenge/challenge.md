# Two Tables (Many-to-Many) Design Recipe Template


## 1. Extract nouns from the user stories or specification

```
As a cinema company manager,
So I can keep track of movies being shown,
I want to keep a list of movies with their title and release date.

As a cinema company manager,
So I can keep track of movies being shown,
I want to keep a list of my cinemas with their city name (e.g 'London' or 'Manchester').

As a cinema company manager,
So I can keep track of movies being shown,
I want to be able to list which cinemas are showing a specific movie.

As a cinema company manager,
So I can keep track of movies being shown,
I want to be able to list which movies are being shown a specific cinema.

```

```
Nouns:
movies title release_date
cinemas location
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
movies | title, release_date
cinemas | location


## 3. Decide the column types.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:
Table: movies
id: SERIAL
title: text
release_date: date

Table: cinemas
id: SERIAL
location: text
```

## 4. Design the Many-to-Many relationship

Make sure you can answer YES to these two questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)

```
one movie, multiple cinemas ? yes
one cinemas, multiple movies ? yes
```

_If you would answer "No" to one of these questions, you'll probably have to implement a One-to-Many relationship, which is simpler. Use the relevant design recipe in that case._

## 5. Design the Join Table
The naming convention is `table1_table2`.

movies_cinemas

## 4. Write the SQL.

```sql
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text
);
-- Create the second table.
CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name text
);
-- Create the join table.
CREATE TABLE posts_tags (
  post_id int,
  tag_id int,
  constraint fk_post foreign key(post_id) references posts(id) on delete cascade,
  constraint fk_tag foreign key(tag_id) references tags(id) on delete cascade,
  PRIMARY KEY (post_id, tag_id)
);
```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < posts_tags.sql
```