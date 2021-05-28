SELECT contact_name, company_name, phone, first_name, last_name, title,
	order_date, product_name, ship_country, products.unit_price, quantity, discount
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
JOIN customers ON orders.customer_id = customers.customer_id
JOIN employees ON orders.employee_id = employees.employee_id
WHERE ship_country = 'USA';

SELECT contact_name, company_name, phone, first_name, last_name, title,
	order_date, product_name, ship_country, products.unit_price, quantity, discount
FROM orders
JOIN order_details USING(order_id)
JOIN products ON USING(product_id)
JOIN customers ON USING(customer_id)
JOIN employees ON USING(employee_id)
WHERE ship_country = 'USA';

SELECT order_id, customer_id, first_name, last_name, title
FROM orders
NATURAL JOIN employees;