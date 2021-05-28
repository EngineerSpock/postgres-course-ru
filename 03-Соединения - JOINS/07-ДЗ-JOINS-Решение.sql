-- Найти заказчиков и обслуживающих их заказы сотрудкников
-- таких, что и заказчики и сотрудники из города London, а доставка идёт компанией Speedy Express.
-- Вывести компанию заказчика и ФИО сотрудника.
SELECT c.company_name AS customer,
       CONCAT(e.first_name, ' ', e.last_name) AS employee
FROM orders as o 
JOIN customers as c USING(customer_id)
JOIN employees as e USING(employee_id)
JOIN shippers as s ON o.ship_via = s.shipper_id
WHERE c.city = 'London'
 AND e.city = 'London'
 AND s.company_name = 'Speedy Express';

-- Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood, которых в продаже менее 20 единиц 
-- Вывести наименование продуктов, кол-во единиц в продаже, имя контакта поставщика и его телефонный номер.
SELECT product_name, units_in_stock, contact_name, phone
  FROM products
  JOIN categories USING(category_id)
  JOIN suppliers USING(supplier_id)
 WHERE category_name IN ('Beverages', 'Seafood')
   AND discontinued = 0
   AND units_in_stock < 20
 ORDER BY units_in_stock;
 
-- Найти заказчиков, не сделавших ни одного заказа
-- Вывести имя заказчика и order_id
SELECT distinct contact_name, order_id
FROM customers
LEFT JOIN orders USING(customer_id)
WHERE order_id IS NULL
ORDER BY contact_name;

--Переписать предыдущий запрос, использовав симметричный вид джойна (подсказа: речь о LEFT и RIGHT)
SELECT contact_name, order_id
FROM orders
RIGHT JOIN customers USING(customer_id)
WHERE order_id IS NULL
ORDER BY contact_name;