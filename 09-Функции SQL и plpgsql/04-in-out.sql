drop function if exists get_price_boundaries;
create or replace function get_price_boundaries(out max_price real, out min_price real) AS $$
	SELECT MAX(unit_price), MIN(unit_price)
	FROM products
$$ language sql;

select get_price_boundaries()

--

drop function if exists get_price_boundaries_by_discontinuity;
create or replace function get_price_boundaries_by_discontinuity(in is_discontinued int, out max_price real, out min_price real) AS $$
	SELECT MAX(unit_price), MIN(unit_price)
	FROM products
	where discontinued = is_discontinued
$$ language sql;

select get_price_boundaries_by_discontinuity(1)

--HW
drop function if exists get_freight_boundaries_by_shipped_dates;
create or replace function get_freight_boundaries_by_shipped_dates(
		start_date date, end_date date, out max_price real, out min_price real
	) AS $$
	
	SELECT MAX(freight), MIN(freight)
	FROM orders
	where shipped_date BETWEEN start_date and end_date
	
$$ language sql;

select get_freight_boundaries_by_shipped_dates('1997-06-01', '1997-06-12')

select *
from orders