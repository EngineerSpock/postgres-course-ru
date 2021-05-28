DROP TABLE exam;
CREATE TABLE exam
(
	exam_id serial UNIQUE NOT NULL,
	exam_name varchar(256),
	exam_date date
);

ALTER TABLE exam
DROP CONSTRAINT exam_exam_id_key;

ALTER TABLE exam
ADD PRIMARY KEY(exam_id);


CREATE TABLE person
(
	person_id int NOT NULL,
    first_name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL,    
    CONSTRAINT pk_person_id PRIMARY KEY (person_id)
);

CREATE TABLE passport
(
	passport_id int,
    serial_number int NOT NULL,
    registration text NOT NULL,
	person_id int NOT NULL,
	
    CONSTRAINT pk_passport_serial_number PRIMARY KEY (passport_id),
	CONSTRAINT FK_passport_person FOREIGN KEY (person_id) REFERENCES person(person_id)
);

ALTER TABLE book
ADD COLUMN weight decimal CONSTRAINT CHK_book_weight CHECK (weight > 0 AND weight < 100);

INSERT INTO book
VALUES
(1, 'title', 'isbn', 1, 120.5, 120);

CREATE TABLE student
(
	student_id serial,
	full_name varchar,		
	grade int DEFAULT 1
);

INSERT INTO student
VALUES
(1, 'vasia');

SELECT *
FROM student;

ALTER TABLE student
ALTER COLUMN DROP DEFAULT;

ALTER TABLE products
ADD CONSTRAINT CHK_products_price CHECK(unit_price > 0);

SELECT MAX(product_id) FROM products;

CREATE SEQUENCE IF NOT EXISTS products_product_id_seq
START WITH 78 OWNED BY products.product_id;


ALTER TABLE products
ALTER COLUMN product_id SET DEFAULT nextval('products_product_id_seq')

INSERT INTO products(product_name, supplier_id, category_id, quantity_per_unit, 
					 unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES
('prod', 1, 1, 10, 20, 20, 10, 1, 0)
RETURNING product_id;
