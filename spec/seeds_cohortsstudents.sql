
TRUNCATE TABLE cohorts, students RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO cohorts (title, starting_date) VALUES ('September 22', '2022-09-15');
INSERT INTO cohorts (title, starting_date) VALUES ('June 22', '2022-06-15');

INSERT INTO students (name, cohort_id) VALUES ('Alucard', '1');
INSERT INTO students (name, cohort_id) VALUES ('Mikasa', '2');
INSERT INTO students (name, cohort_id) VALUES ('Naruto', '1');

