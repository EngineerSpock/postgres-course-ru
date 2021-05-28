SELECT *
FROM orders
LIMIT 10;

SELECT order_id, order_date, COALESCE(ship_region, 'unknown') AS ship_region
FROM orders
LIMIT 10;

SELECT *
FROM employees;

SELECT last_name, first_name, COALESCE(region, 'N/A') as region
FROM employees;

SELECT contact_name, COALESCE(NULLIF(city, ''), 'Unknown') as city
FROM customers;

CREATE TABLE budgets
(
	dept serial,
	current_year decimal NULL,
	previous_year decimal NULL
);

INSERT INTO budgets(current_year, previous_year) VALUES(100000, 150000);
INSERT INTO budgets(current_year, previous_year) VALUES(NULL, 300000);
INSERT INTO budgets(current_year, previous_year) VALUES(0, 100000);
INSERT INTO budgets(current_year, previous_year) VALUES(NULL, 150000);
INSERT INTO budgets(current_year, previous_year) VALUES(300000, 250000);
INSERT INTO budgets(current_year, previous_year) VALUES(170000, 170000);
INSERT INTO budgets(current_year, previous_year) VALUES(150000, NULL);

SELECT dept,
	COALESCE(TO_CHAR(NULLIF(current_year, previous_year), 'FM99999999'), 'Same as last year') AS budget
FROM budgets
WHERE current_year IS NOT NULL;