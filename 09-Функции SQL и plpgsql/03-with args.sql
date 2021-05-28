create or replace function get_product_price_by_name(prod_name varchar) returns real as $$
	select unit_price
	from products
	where product_name = prod_name
$$ language sql;

select get_product_price_by_name('Chocolade')

select *
from products;

--тут на самом деле нет гарантии что название уникально и может вернуться таблица 
--а не одно значение в теории

--hw
drop function get_order_quantity;
create or replace function get_order_quantity(ship_country varchar) returns smallint as $$
	select MAX(quantity)
	from orders
	join order_details using(order_id)
	--where ship_country = $1
	where ship_country = get_order_quantity.ship_country
$$ language sql;

select get_order_quantity('France');

select *
from orders
join order_details using(order_id)
where ship_country = 'France'
order by quantity desc
join order_details using(order_id)