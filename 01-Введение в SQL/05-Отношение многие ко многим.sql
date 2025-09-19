SELECT * FROM book;

DELETE FROM book;

INSERT INTO book
VALUES
(1, 'Book for Dummies', '123456', 1),
(2, 'Book for Smart Guys', '7890123', 1),
(3, 'Book for Happy People', '4567890', 2),
(4, 'Book for Unhappy People', '1234567', 2);

CREATE TABLE author
(
	author_id int PRIMARY KEY,
	full_name text NOT NULL,
	rating real
);

INSERT INTO author
VALUES
(1, 'Bob', 4.5),
(2, 'Alice', 4.0),
(3, 'John', 4.7);

CREATE TABLE book_author
(
	book_id int REFERENCES book(book_id),
	author_id int REFERENCES author(author_id),
	
	CONSTRAINT book_author_pkey PRIMARY KEY (book_id, author_id) -- composite key (составной ключ)
);

INSERT INTO book_author
VALUES
(1, 1),
(2, 1),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(4, 3);