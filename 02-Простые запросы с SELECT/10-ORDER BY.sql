SELECT DISTINCT country
FROM customers;

SELECT DISTINCT country
FROM customers
ORDER BY country;

SELECT DISTINCT country
FROM customers
ORDER BY country ASC;

-- if we want to make it descending, then:
SELECT DISTINCT country
FROM customers
ORDER BY country DESC;

-- we also can ordery by more than one column:
SELECT DISTINCT country, city
FROM customers
ORDER BY country DESC, city DESC;

--nothing stops us from using ASC and DESC as we want (combining them):
SELECT DISTINCT country, city
FROM customers
ORDER BY country DESC, city ASC;