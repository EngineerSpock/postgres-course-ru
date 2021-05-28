SELECT product_name, unit_price,
CASE WHEN units_in_stock >= 100 THEN 'lots of'
	 WHEN units_in_stock >= 50 AND units_in_stock < 100 THEN 'average'
	 WHEN units_in_stock < 50 THEN 'low number'
	 ELSE 'unknown'
END AS amount
FROM products;

SELECT order_id, order_date,
CASE WHEN date_part('month', order_date) BETWEEN 3 and 5 THEN 'spring' 
     WHEN date_part('month', order_date) BETWEEN 6 and 8 THEN 'summer'
	 WHEN date_part('month', order_date) BETWEEN 9 and 11 THEN 'autumn'
	 ELSE 'winter'
END AS bla
FROM orders;

