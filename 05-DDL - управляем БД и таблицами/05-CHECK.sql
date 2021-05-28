DROP TABLE IF EXISTS book;

CREATE TABLE public.book
(
    book_id integer NOT NULL,
    title text NOT NULL,
    isbn character varying(32) NOT NULL,
    publisher_id integer NOT NULL,
	  
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

ALTER TABLE book
ADD COLUMN price decimal CONSTRAINT CHK_book_price CHECK (price > 0);

INSERT INTO book
VALUES
(1, 'title', 'isbn', 1, -1.5);

