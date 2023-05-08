TRUNCATE TABLE cohorts RESTART IDENTITY CASCADE; 

INSERT INTO cohorts (name, starting_date) VALUES ('Jan 2023', 'January 14, 2023');
INSERT INTO cohorts (name, starting_date) VALUES ('Feb 2023', 'February 16, 2023');

TRUNCATE TABLE students RESTART IDENTITY;

INSERT INTO students (name, cohort_id) VALUES ('Jim', 1);
INSERT INTO students (name, cohort_id) VALUES ('Kyle', 2);
INSERT INTO students (name, cohort_id) VALUES ('James', 1);
INSERT INTO students (name, cohort_id) VALUES ('Kelly', 2);
INSERT INTO students (name, cohort_id) VALUES ('Jane', 1);
INSERT INTO students (name, cohort_id) VALUES ('Kris', 2);