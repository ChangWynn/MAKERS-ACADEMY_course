TRUNCATE TABLE posts RESTART IDENTITY CASCADE;
INSERT INTO "public"."posts" ("title") VALUES
('How to use Git'),
('Ruby classes'),
('Using IRB'),
('My weekend in Edinburgh'),
('The best chocolate cake EVER'),
('A foodie week in Spain'),
('SQL basics');

TRUNCATE TABLE tags RESTART IDENTITY CASCADE;
INSERT INTO "public"."tags" ("name") VALUES
('coding'),
('travel'),
('cooking'),
('ruby');

TRUNCATE TABLE posts_tags RESTART IDENTITY;
INSERT INTO "public"."posts_tags" ("post_id", "tag_id") VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 3),
(6, 2),
(7, 1),
(6, 3),
(2, 4),
(3, 4);