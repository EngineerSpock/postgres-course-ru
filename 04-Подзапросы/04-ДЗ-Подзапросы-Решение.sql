SELECT product_name, units_in_stock
FROM products
WHERE units_in_stock < ALL
	  (SELECT AVG(quantity)
	   FROM order_details
	   GROUP BY product_id)
ORDER BY units_in_stock DESC;

SELECT AVG(quantity)
FROM order_details
GROUP BY product_id
order by AVG(quantity)
	   
SELECT o.customer_id, SUM(o.freight) AS freight_sum 
  FROM orders AS o
       INNER JOIN (SELECT customer_id, AVG(freight) AS freight_avg
                     FROM orders
                    GROUP BY customer_id) AS oa
       ON oa.customer_id = o.customer_id
 WHERE o.freight > oa.freight_avg
   AND o.shipped_date BETWEEN '1996-07-16' AND '1996-07-31'
 GROUP BY o.customer_id
 ORDER BY freight_sum;
 
SELECT customer_id, ship_country, order_price
  FROM orders
       JOIN (SELECT order_id,
                          SUM(unit_price * quantity - unit_price * quantity * discount) AS order_price
                     FROM order_details
                    GROUP BY order_id) od
       USING(order_id)
 WHERE ship_country IN ('Argentina' , 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Guyana', 'Paraguay', 
						'Peru', 'Suriname', 'Uruguay', 'Venezuela')
   AND order_date >= '1997-09-01'
 ORDER BY order_price DESC
 LIMIT 3;
 
SELECT product_name
FROM products
WHERE product_id = ANY (SELECT product_id FROM order_details WHERE quantity = 10);

SELECT distinct product_name, quantity
FROM products
join order_details using(product_id)
where order_details.quantity = 10


