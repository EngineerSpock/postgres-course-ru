-- UNION & UNION ALL - same number of columns in both queries
SELECT country
FROM customers
UNION
SELECT country
FROM employees

SELECT country
FROM customers
UNION ALL
SELECT country
FROM employees

-- distinct would not help, if want disctinct - use UNION
SELECT DISTINCT country
FROM customers
UNION ALL
SELECT DISTINCT country
FROM employees

SELECT country 
FROM customers
INTERSECT
SELECT country
FROM suppliers

SELECT country 
FROM customers
EXCEPT
SELECT country
FROM suppliers

--EXCEPT returns all rows that are in the result of query1 but not in the result of query2. 
--(This is sometimes called the difference between two queries.) 
--Again, duplicates are eliminated unless EXCEPT ALL is used.
SELECT country 
FROM customers
EXCEPT ALL
SELECT country
FROM suppliers