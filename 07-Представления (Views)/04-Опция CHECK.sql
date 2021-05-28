CREATE OR REPLACE VIEW heavy_orders AS
SELECT * 
FROM orders
WHERE freight > 100;

SELECT *
FROM heavy_orders
ORDER BY freight;

INSERT INTO heavy_orders
VALUES(11900, 'FOLIG', 1, '2000-01-01', '2000-01-05', '2000-01-04', 1, 80, 'Folies gourmandes', '184, chaussee de Tournai',
	   'Lille', NULL, 59000, 'FRANCE');
	   
SELECT *
FROM heavy_orders
WHERE order_id = 11900;

CREATE OR REPLACE VIEW heavy_orders AS
SELECT * 
FROM orders
WHERE freight > 100
WITH LOCAL CHECK OPTION;

CREATE OR REPLACE VIEW heavy_orders AS
SELECT * 
FROM orders
WHERE freight > 100
WITH CASCADE CHECK OPTION;

