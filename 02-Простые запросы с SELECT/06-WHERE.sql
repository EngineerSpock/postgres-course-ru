SELECT company_name, contact_name, phone, country
FROM customers
WHERE country = 'USA';

SELECT *
FROM products
WHERE unit_price > 20;

SELECT COUNT(*)
FROM products
WHERE unit_price < 20;

SELECT *
FROM products
WHERE discontinued = 1;

SELECT *
FROM customers
WHERE city <> 'Berlin';

SELECT *
FROM orders
WHERE order_date >= '1998-03-01';