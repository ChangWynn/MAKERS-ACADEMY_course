TRUNCATE TABLE posts RESTART IDENTITY CASCADE; -- replace with your own table name.
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO posts (title, content) VALUES ('Hello World', 'A Software Engineer Journey');
INSERT INTO posts (title, content) VALUES ('First Week At Makers', 'The command line');
INSERT INTO posts (title, content) VALUES ('Week 2 At Makers', 'Github and stuff');

TRUNCATE TABLE comments RESTART IDENTITY; -- replace with your own table name.
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO comments (author, content, post_id) VALUES ('Chang', 'Nice one', 1);
INSERT INTO comments (author, content, post_id) VALUES ('Jim', 'Loved it', 1);
INSERT INTO comments (author, content, post_id) VALUES ('Jane', 'Good luck', 2);





