TRUNCATE TABLE posts RESTART IDENTITY; 


INSERT INTO posts (title, content, views, account_id) VALUES ('Hello World', 'A software engineer journey', 100, 1);
INSERT INTO posts (title, content, views, account_id) VALUES ('Hi there', 'My name is Chang', 10, 1);