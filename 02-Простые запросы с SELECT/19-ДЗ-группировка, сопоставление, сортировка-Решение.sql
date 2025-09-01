SELECT *
FROM orders
WHERE ship_country LIKE 'U%';

SELECT order_id, customer_id, freight, ship_country
FROM orders
WHERE ship_country LIKE 'N%'
ORDER BY freight DESC
LIMIT 10;

SELECT first_name, last_name, home_phone, region
FROM employees
WHERE region IS NULL;

SELECT COUNT(*)
FROM customers
WHERE region IS NOT NULL;

SELECT country, COUNT(*)
FROM suppliers
GROUP BY country
ORDER BY COUNT(*) DESC;

SELECT ship_country, SUM(freight)
FROM orders
WHERE ship_region IS NOT NULL
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY SUM(freight) DESC

SELECT country
FROM customers
UNION
SELECT country
FROM suppliers
ORDER BY country

SELECT country 
FROM customers
INTERSECT
SELECT country
FROM suppliers
INTERSECT
SELECT country
FROM employees

SELECT country 
FROM customers
INTERSECT
SELECT country
FROM suppliers
EXCEPT
SELECT country
FROM employees
