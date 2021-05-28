SELECT *
FROM customers;

SELECT contact_name, city
FROM customers;

SELECT order_id, shipped_date - order_date
FROM orders;

SELECT DISTINCT city
FROM customers;

SELECT DISTINCT city, country
FROM customers;

SELECT COUNT(*)
FROM customers;

SELECT COUNT(DISTINCT country)
FROM customers