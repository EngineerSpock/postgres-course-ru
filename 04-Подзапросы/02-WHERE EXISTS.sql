-- выбрать компании и имена заказчиков, которые делали заказы весом от 50 до 100
SELECT company_name, contact_name
FROM customers
WHERE EXISTS (SELECT customer_id FROM orders
              WHERE customer_id=customers.customer_id AND
              freight BETWEEN 50 AND 100);
			   

-- выбрать компании и имена заказчиков, которые делали заказы между 1-м февраля 95года и 15-м февраля того же года
SELECT company_name, contact_name
FROM customers
WHERE EXISTS (SELECT customer_id FROM orders
              WHERE customer_id=customers.customer_id AND
               orderdate BETWEEN '1995-02-01' AND '1995-02-15');
			   
--которые НЕ делали такие заказы
 SELECT companyname,contactname
 FROM customers
 WHERE NOT EXISTS (SELECT customer_id FROM orders
               WHERE customerid=customers.customerid AND
                orderdate BETWEEN '1995-02-01' AND '1995-02-15');


-- выбрать продукты которые не покупались в период с 1-го февраля 95года и 15-м февраля того же года
SELECT productname
FROM products
WHERE NOT EXISTS (SELECT orders.orderid FROM orders
                  JOIN order_details USING(orderid)
              	  WHERE order_details.productid=products.productid AND
                  orderdate BETWEEN '1995-02-01' AND '1995-02-15');