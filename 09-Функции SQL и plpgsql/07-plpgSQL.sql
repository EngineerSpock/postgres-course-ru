--*RETURN in plpgsql*--
CREATE OR REPLACE FUNCTION get_total_number_of_goods() RETURNS bigint AS $$
BEGIN
	RETURN sum(units_in_stock)
	FROM products;
END;
$$ LANGUAGE plpgsql;

SELECT get_total_number_of_goods();

CREATE OR REPLACE FUNCTION get_max_price_from_discontinued() RETURNS real AS $$
BEGIN
	RETURN max(unit_price)
	FROM products
	WHERE discontinued = 1;
END;
$$ LANGUAGE plpgsql;

SELECT get_max_price_from_discontinued();

CREATE OR REPLACE FUNCTION get_price_boundaries(OUT max_price real, OUT min_price real) AS $$
BEGIN
	--max_price := MAX(unit_price) FROM products;
	--min_price := MIN(unit_price) FROM products;
	SELECT MAX(unit_price), MIN(unit_price)
	INTO max_price, min_price
	FROM products;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_price_boundaries();

CREATE OR REPLACE FUNCTION get_sum(x int, y int, out result int) AS $$
BEGIN
	result = x + y;
	RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_sum(2, 3);

DROP FUNCTION IF EXISTS get_customers_by_country;
CREATE FUNCTION get_customers_by_country(customer_country varchar) RETURNS SETOF customers AS $$
BEGIN
	RETURN QUERY
	SELECT *
	FROM customers
	WHERE country = customer_country;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_customers_by_country('USA');



--* Declaring variables*--:
drop function if exists get_square;
create or replace function get_square(ab real, bc real, ac real) returns real AS $$
declare
	perimeter real;
begin
	perimeter:=(ab+bc+ac)/2;
	return sqrt(perimeter * (perimeter - ab) * (perimeter - bc) * (perimeter - ac));
end;
$$ language plpgsql;

select get_square(6, 6, 6)

--*Final example here*--
CREATE OR REPLACE FUNCTION middle_priced()
RETURNS SETOF products AS $$

	DECLARE
		average_price real;
		bottom_price real;
		top_price real;
	BEGIN
		SELECT AVG(unit_price) INTO average_price
		FROM products;

		bottom_price := average_price * .75;
		top_price := average_price * 1.25;

		RETURN QUERY SELECT * FROM products
		WHERE unit_price between bottom_price AND top_price;
	END;
$$ LANGUAGE plpgsql;
