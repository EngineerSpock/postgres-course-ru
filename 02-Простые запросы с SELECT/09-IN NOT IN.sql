SELECT *
FROM customers
WHERE country = 'Mexico' OR country = 'Germany' OR country = 'USA' OR country = 'Canada';

SELECT *
FROM customers
WHERE country IN ('Mexico', 'Germany', 'USA', 'Canada');

SELECT *
FROM products
WHERE category_id IN (1, 3, 5, 7)

SELECT *
FROM customers
WHERE country NOT IN ('Mexico', 'Germany', 'USA', 'Canada');

SELECT *
FROM products
WHERE category_id NOT IN (1, 3, 5, 7)
