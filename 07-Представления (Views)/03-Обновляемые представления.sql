SELECT * FROM orders;

CREATE OR REPLACE VIEW heavy_orders AS
SELECT * 
FROM orders
WHERE freight > 50;

SELECT * 
FROM heavy_orders
ORDER BY freight;

CREATE OR REPLACE VIEW heavy_orders AS
SELECT * 
FROM orders
WHERE freight > 100;

CREATE OR REPLACE VIEW products_suppliers_categories AS
SELECT product_name, quantity_per_unit, unit_price, units_in_stock, discontinued,
company_name, contact_name, phone, country,
category_name, description
FROM products
JOIN suppliers USING (supplier_id)
JOIN categories USING (category_id);

-----
SELECT MAX(order_id)
FROM orders;

INSERT INTO heavy_orders
VALUES (11078, 'VINET', 5, '2019-12-10', '2019-12-15', '2019-12-14', 1, 120, 
		'Hanari Carnes', 'Rua do Paco', 'Bern', NULL, 3012, 'Switzerland');
		
SELECT * 
FROM heavy_orders
ORDER BY order_id DESC;

--показать что мы не можем удалить то чего нет в самой вьюхе
SELECT MIN(freight)
FROM orders;

DELETE FROM heavy_orders WHERE freight < 0.05;

--а теперь удаляем то что есть во вьюхе
SELECT MIN(freight)
FROM heavy_orders;

DELETE FROM heavy_orders WHERE freight < 100.25;

DELETE FROM order_details
WHERE order_id = 10854;