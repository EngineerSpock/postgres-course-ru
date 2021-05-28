SELECT ship_country, COUNT(*)
FROM orders
WHERE freight > 50
GROUP BY ship_country
ORDER BY COUNT(*) DESC;

SELECT category_id, SUM(UnitsInStock)
FROM products
GROUP BY category_id
ORDER BY SUM(units_in_stock) DESC;
LIMIT 5