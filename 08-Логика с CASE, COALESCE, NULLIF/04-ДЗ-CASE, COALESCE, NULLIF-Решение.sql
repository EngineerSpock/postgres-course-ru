SELECT contact_name, city, country
FROM customers
ORDER BY contact_name,
(
	CASE WHEN city IS NULL THEN country
		 ELSE city
	END
);

INSERT INTO customers(customer_id, contact_name, city, country, company_name)
VALUES
('AAAAAB', 'John Mann', 'abc', 'USA', 'fake_company'),
('BBBBBV', 'John Mann', 'acd', 'Austria', 'fake_company');

SELECT product_name, unit_price,
CASE WHEN unit_price >= 100 THEN 'too expensive'
	 WHEN unit_price >= 50 AND unit_price < 100 THEN 'average'
	 ELSE 'low price'
END AS price
FROM products
ORDER BY unit_price DESC;

SELECT DISTINCT contact_name, COALESCE(order_id::text, 'no orders')
FROM customers
LEFT JOIN orders USING(customer_id)
WHERE order_id IS NULL;

SELECT CONCAT(last_name, ' ', first_name), COALESCE(NULLIF(title, 'Sales Representative'), 'Sales Stuff') AS title
FROM employees;