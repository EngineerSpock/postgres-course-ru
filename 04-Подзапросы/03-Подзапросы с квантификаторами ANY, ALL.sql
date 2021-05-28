--выбрать все уникальные компании заказчиков которые делали заказы на более чем 40 единиц товаров
--с джойнами
SELECT DISTINCT company_name
FROM customers
JOIN orders USING(customer_id)
JOIN order_details USING(order_id)
WHERE quantity > 40;

--с подзапросом
SELECT DISTINCT company_name --from course
FROM customers
WHERE customer_id = ANY(SELECT customer_id FROM orders
					   JOIN order_details USING(order_id)
					   WHERE quantity > 40);

-- можно комбинировать джойны с подзапросами
-- это у нас просто среднее количество единиц товара по всем заказам
SELECT AVG(quantity)
FROM order_details;
	   
-- давайте выберем такие продукты, количество которых больше среднего по заказам
-- используя предыдущий запрос в качестве подзапроса можно написать следующий запрос:
SELECT DISTINCT product_name, quantity
FROM products
JOIN order_details USING(product_id)
WHERE quantity >
	  (SELECT AVG(quantity)
	   FROM order_details);
	   
	   
-- найти все продукты количество которых больше среднего значения количества заказанных товаров из групп, полученных группированием по product_id
SELECT AVG(quantity)
FROM order_details
GROUP BY product_id;

SELECT DISTINCT product_name, quantity
FROM products
JOIN order_details USING(product_id)
WHERE quantity > ALL
	  (SELECT AVG(quantity)
	   FROM order_details
	   GROUP BY product_id)
ORDER BY quantity;