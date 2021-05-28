create or replace function get_total_number_of_goods() returns bigint AS $$
	select sum(units_in_stock)
	from products
$$ language sql;

create or replace function get_total_number_of_goods() returns real AS $$
	select avg(unit_price)
	from products
$$ language sql;



select get_total_number_of_goods() as total_goods --as в самой функции будет проигнорирован

--hw
create or replace function get_max_price_from_discontinued() returns real AS $$
	select max(unit_price)
	from products
	where discontinued = 1
$$ language sql;

select get_max_price_from_discontinued()

--Unless the function is declared to return void, 
--the last statement must be a SELECT, or an INSERT, UPDATE, or DELETE that has a RETURNING clause.

--*DO*--
--DO executes an anonymous code block, or in other words a transient anonymous function in a procedural language.
--The code block is treated as though it were the body of a function with no parameters, returning void. It is parsed and executed a single time.
DO $$
BEGIN
   select sum(units_in_stock)
   from products
END$$;