--Отдельный крупный вопрос касается возврата множественных строк

--*How to return a set of primitive type values*--
drop function if exists get_average_prices_by_product_categories;
create or replace function get_average_prices_by_product_categories() 
		returns setof double precision as $$
	
	select AVG(unit_price)
	from products
	group by category_id	
	
$$ language sql;

select * from get_average_prices_by_product_categories()
--to name the resulting column use 'as'
select * from get_average_prices_by_product_categories() as average_prices

--*How to return a set of columns*--
--*With OUT parameters*--
drop function if exists get_average_prices_by_product_categories;
create or replace function get_average_prices_by_product_categories(out sum_price real, out avg_price float8) 
		returns setof record as $$
	
	select SUM(unit_price), AVG(unit_price)
	from products
	group by category_id;
				
$$ language sql;

select sum_price from get_average_prices_by_product_categories();
select sum_price, avg_price from get_average_prices_by_product_categories();

--won't work
select sum_of, in_avg from get_average_prices_by_product_categories();

--will work
select sum_price as sum_of, avg_price as in_avg 
from get_average_prices_by_product_categories();

--*How to return a set of columns*--
--*WithOUT OUT parameters*--
drop function if exists get_average_prices_by_product_categories;
create or replace function get_average_prices_by_product_categories() 
		returns setof record as $$
	
	select SUM(unit_price), AVG(unit_price)
	from products
	group by category_id;
				
$$ language sql;

--won't work in all 4 syntax options
select sum_price from get_average_prices_by_product_categories();
select sum_price, avg_price from get_average_prices_by_product_categories();
select sum_of, in_avg from get_average_prices_by_product_categories();
select * from get_average_prices_by_product_categories();

--works only this
select * from get_average_prices_by_product_categories() as (sum_price real, avg_price float8);

--returns table
drop function if exists get_customers_by_country;
create or replace function get_customers_by_country(customer_country varchar) 
		returns table(char_code char, company_name varchar) as $$
	
	select customer_id, company_name
	from customers	
	where country = customer_country
	
$$ language sql;

--правила селекта все те же что и при returns setof
select * from get_customers_by_country('USA');
select company_name from get_customers_by_country('USA');
select char_code, company_name from get_customers_by_country('USA');

--setof table
drop function if exists get_customers_by_country;
create or replace function get_customers_by_country(customer_country varchar) 
		returns setof customers as $$
	
	-- won't work: select company_name, contact_name
	select *
	from customers	
	where country = customer_country
	
$$ language sql;

select * from get_customers_by_country('USA');
-- получим просто простыню текста: select get_customers_by_country('USA');

select contact_name, city
from get_customers_by_country('USA');


--hw
drop function if exists sold_more_than;
create or replace function sold_more_than(min_sold_boundary int) 
		returns setof products as $$
	
	select * from products
	where product_id IN (
		select product_id from
		(select sum(quantity), product_id
		 from order_details
		 group by product_id
		 having sum(quantity) >min_sold_boundary
		) as filtered_out
	)
	
$$ language sql;

select sold_more_than(100)

--see also (todo):
https://dba.stackexchange.com/questions/96109/return-type-of-joining-stored-procedure-postgresql

