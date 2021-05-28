CREATE TABLE public.publisher
(
    publisher_id integer NOT NULL,
    publisher_name varchar(128) NOT NULL,
    address text NOT NULL,
    
	CONSTRAINT PK_publisher_id PRIMARY KEY(publisher_id)
);

CREATE TABLE public.book
(
    book_id integer NOT NULL,
    title text NOT NULL,
    isbn character varying(32) NOT NULL,
    publisher_id integer NOT NULL,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);


--добавим немного данных в publisher
INSERT INTO publisher 
VALUES 
(1, 'Everyman''s Library', 'NY'),
(2, 'Oxford University Press', 'NY'),
(3, 'Grand Central Publishing', 'Washington'),
(4, 'Simon & Schuster', 'Chicago');

--без FK мы можем пихать любые значения
INSERT INTO book
VALUES 
(1, 'The Diary of a Young Girl', '0199535566', 10); -- Everyman's Library

SELECT *
FROM book;

TRUNCATE TABLE book;

ALTER TABLE book
ADD CONSTRAINT fk_books_publisher FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id);

-- теперь всякую дичь на вставить
insert into book
values 
(1, 'The Diary of a Young Girl', '0199535566', 10);

--если хотим сразу задать ограничение при создании таблицы
DROP TABLE book;

CREATE TABLE public.book
(
    book_id integer NOT NULL,
    title text NOT NULL,
    isbn character varying(32) NOT NULL,
    publisher_id integer NOT NULL,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id),
	CONSTRAINT FK_book_publisher FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

--если хотим удалить ограничение
ALTER TABLE book
DROP CONSTRAINT FK_book_publisher;

