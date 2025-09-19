CREATE TABLE person
(
	person_id int PRIMARY KEY,
	first_name varchar(64) NOT NULL,
	last_name varchar(64) NOT NULL
);

CREATE TABLE passport
(
	passport_id int PRIMARY KEY,
	serial_number int NOT NULL,
	registration text NOT NULL,
	fk_passport_person int UNIQUE REFERENCES person(person_id)
);

/*
INSERT INTO person VALUES (1, 'John', 'Snow');
INSERT INTO person VALUES (2, 'Ned', 'Stark');
INSERT INTO person VALUES (3, 'Rob', 'Baratheon');
*/

-- Пакетная вставка N строк
INSERT INTO person (person_id, first_name, last_name) 
VALUES 
    (1, 'John', 'Snow'),
    (2, 'Ned', 'Stark'),
    (3, 'Rob', 'Baratheon');


/*
INSERT INTO passport VALUES (1, 123456, 1, 'Winterfell');
INSERT INTO passport VALUES (2, 789012, 2, 'Winterfell');
INSERT INTO passport VALUES (3, 345678, 3, 'King''s Landing');
*/
INSERT INTO passport (passport_id, serial_number, registration, fk_passport_person)
VALUES
    (1, 123456, 'Winterfell', 1),
    (2, 789012, 'Winterfell', 2),
    (3, 345678, 'King''s Landing', 3);

