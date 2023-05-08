CREATE TABLE posts (
	id SERIAL PRIMARY KEY,
	title text,
	content text
);

CREATE TABLE comments (
	id SERIAL PRIMARY KEY,
	author text,
	content text,
	post_id int,
	constraint fk_post foreign key(post_id)
	references posts(id)
	on delete cascade
);

INSERT INTO posts (title, content) VALUES ('Hello World', 'A Software Engineer Journey');
INSERT INTO posts (title, content) VALUES ('First Week At Makers', 'The command line');
INSERT INTO posts (title, content) VALUES ('Week 2 At Makers', 'Github and stuff');

INSERT INTO comments (author, content, post_id) VALUES ('Chang', 'Nice one', 1);
INSERT INTO comments (author, content, post_id) VALUES ('Jim', 'Loved it', 1);
INSERT INTO comments (author, content, post_id) VALUES ('Jane', 'Good luck', 2);
