SELECT *
FROM customers
WHERE country = 'Mexico' OR country = 'Germany' OR country = 'USA' OR country = 'Canada';

SELECT *
FROM customers
WHERE country IN ('Mexico', 'Germany', 'USA', 'Canada');

SELECT *
FROM producrs
WHERE categoryid IN (1, 3, 5, 7)

SELECT *
FROM customers
WHERE country NOT IN ('Mexico', 'Germany', 'USA', 'Canada');

SELECT *
FROM producrs
WHERE categoryid NOT IN (1, 3, 5, 7)