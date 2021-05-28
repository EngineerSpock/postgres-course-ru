SELECT * FROM author;

UPDATE author
SET full_name = 'Elias', rating = 5
WHERE author_id = 1;

DELETE FROM author
WHERE rating < 4.5;

DELETE FROM author;

TRUNCATE TABLE author;

DROP TABLE book;

CREATE TABLE book
(
	book_id serial,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int NOT NULL,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

INSERT INTO book(title, isbn, publisher_id)
VALUES ('title', 'isbn', 3)
RETURNING *;

UPDATE author
SET full_name = 'Walter', rating = 5
WHERE author_id = 1
RETURNING author_id;

DELETE FROM author
WHERE rating = 5
RETURNING *;