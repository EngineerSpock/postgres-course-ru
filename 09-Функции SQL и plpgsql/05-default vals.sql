drop function if exists get_price_boundaries_by_discontinuity;
create or replace function get_price_boundaries_by_discontinuity
	 (in is_discontinued int DEFAULT 1, out max_price real, out min_price real) AS $$
	SELECT MAX(unit_price), MIN(unit_price)
	FROM products
	where discontinued = is_discontinued
$$ language sql;

select get_price_boundaries_by_discontinuity(1);
select get_price_boundaries_by_discontinuity(); --with default

--hw
drop function if exists get_freight_boundaries_by_shipped_dates;
create or replace function get_freight_boundaries_by_shipped_dates(
		start_date date DEFAULT '1997-06-01', end_date date DEFAULT '1997-06-12', out max_price real, out min_price real
	) AS $$
	
	SELECT MAX(freight), MIN(freight)
	FROM orders
	where shipped_date BETWEEN start_date and end_date
	
$$ language sql;

select get_freight_boundaries_by_shipped_dates('1997-06-01', '1997-06-12');
select get_freight_boundaries_by_shipped_dates();
