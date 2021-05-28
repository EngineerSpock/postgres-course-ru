CREATE VIEW products_suppliers_categories AS
SELECT product_name, quantity_per_unit, unit_price, units_in_stock,
company_name, contact_name, phone,
category_name, description
FROM products
JOIN suppliers USING (supplier_id)
JOIN categories USING (category_id);

SELECT *
FROM products_suppliers_categories;

SELECT *
FROM products_suppliers_categories
WHERE unit_price > 20;

DROP VIEW products_suppliers_categories;

DROP VIEW IF EXISTS products_suppliers_categories;