-- Subquery: что если мы хотим найти все компании поставщиков из тех стран, в которые делают заказы заказчики?
SELECT company_name
FROM suppliers
WHERE country IN (SELECT country FROM customers)

--equivalent query
SELECT DISTINCT suppliers.company_name
FROM suppliers
JOIN customers USING(country)

SELECT category_name, SUM(units_in_stock)
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
GROUP BY category_name
ORDER BY SUM(units_in_stock) DESC
LIMIT (SELECT MIN(product_id) + 4 FROM products)

--среднее кол-во товаров в наличии
SELECT AVG(units_in_stock)
FROM products
 
-- а если мы хотим вывести такие товары, количество которого в наличии больше чем в среднем
SELECT product_name, units_in_stock
FROM products
WHERE units_in_stock >
(SELECT AVG(units_in_stock)
 FROM products)
ORDER BY units_in_stock