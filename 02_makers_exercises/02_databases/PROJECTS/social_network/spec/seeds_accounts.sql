TRUNCATE TABLE accounts RESTART IDENTITY CASCADE; 

INSERT INTO accounts (username, email) VALUES ('Chang', 'chang@gmail.com');
INSERT INTO accounts (username, email) VALUES ('Jim', 'jim@gmail.com');