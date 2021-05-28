CREATE TABLE customer
(
	customer_id serial,
	full_name text,	
	status char DEFAULT 'r',
	
	CONSTRAINT PK_customer_id PRIMARY KEY(customer_id),
	CONSTRAINT CHK_customer_status CHECK (status = 'r' or status = 'p')
);

INSERT INTO customer
VALUES
(1, 'name');

SELECT *
FROM customer;

INSERT INTO customer
VALUES
(1, 'name', 'd');

ALTER TABLE customer
ALTER COLUMN status DROP DEFAULT;

ALTER TABLE customer
ALTER COLUMN status SET DEFAULT 'r';


