CREATE VIEW orders_customers_employees AS
SELECT order_date, required_date, shipped_date, ship_postal_code,
company_name, contact_name, phone,
last_name, first_name, title
FROM orders
JOIN customers USING (customer_id)
JOIN employees USING (employee_id);

SELECT *
FROM orders_customers_employees
WHERE order_date > '1997-01-01';

--

CREATE OR REPLACE VIEW orders_customers_employees AS
SELECT order_date, required_date, shipped_date, ship_postal_code, ship_country, --add ship_country
company_name, contact_name, phone, postal_code, --add postal_code
last_name, first_name, title, reports_to --add reports_to
FROM orders
JOIN customers USING (customer_id)
JOIN employees USING (employee_id);

SELECT *
FROM orders_customers_employees
ORDER BY ship_country;

--
ALTER VIEW products_suppliers_categories RENAME TO products_detailed;

--
DROP VIEW IF EXISTS orders_customers_employees;

select * from products;

drop view active_products;
create or replace view active_products
as
select product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price,
units_in_stock, units_on_order, reorder_level, discontinued
FROM products
where discontinued <> 1
with local check option;

insert into active_products
values(78, 'abc', 1, 1, 'abc', 1, 1, 1, 1, 1);

--
SELECT product_name, unit_price,
CASE WHEN unit_price>95 THEN 'expensive'
     WHEN unit_price>= 50 and unit_price < 95 THEN 'middle range'
	 WHEN unit_price < 50 THEN 'cheap'
END AS expensiveness
FROM products
ORDER BY unit_price DESC;

--
select company_name, coalesce(region, 'unknown region') 
from suppliers;
