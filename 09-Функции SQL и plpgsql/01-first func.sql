select *
into tmp_customers
from customers

from tmp_customers

select *
from tmp_customers
--
update tmp_customers
set region = 'unknown'
where region is null
--what if this code is going to be called from the client's side?

create or replace function fix_customer_region() returns void AS $$
	update tmp_customers
    set region = 'unknown'
    where region is null
$$ language sql

--show functions section in pgAdmin
--then demonstrate
select fix_customer_region()

--hw

select * 
into tmp_order
from orders

create or replace function fix_orders_ship_region() returns void AS $$
	update tmp_order
    set ship_region = 'unknown'
    where ship_region is null
$$ language sql

select fix_orders_ship_region()