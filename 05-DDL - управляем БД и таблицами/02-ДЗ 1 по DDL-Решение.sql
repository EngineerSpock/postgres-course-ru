CREATE TABLE teacher
(
	teacher_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar,
	title varchar
);

ALTER TABLE teacher
ADD COLUMN middle_name varchar;

ALTER TABLE teacher
DROP COLUMN middle_name;

ALTER TABLE teacher
RENAME birthday TO birth_date;

ALTER TABLE teacher
ALTER COLUMN phone SET DATA TYPE varchar(32);

CREATE TABLE exam
(
	exam_id serial,
	exam_name varchar(256),
	exam_date date
);

INSERT INTO exam (exam_name, exam_date)
VALUES ('exam 1', '2018-01-10'),
       ('exam 2', '2018-02-10'),
       ('exam 3', '2018-03-10');

SELECT * FROM exam;

TRUNCATE TABLE exam RESTART IDENTITY;
