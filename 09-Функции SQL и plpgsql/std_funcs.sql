--string functions--
select chr(72);

select concat('Abra', '-abra-', 'cadabra');

select upper('abcd'); -- удобно для сравнения
select lower('ABCD');

select initcap('hello, John');

--substring-related funcs
select position('lo' in 'hello'); --starting at 4
select overlay('h___o' placing 'ell' from 2 for 3); -- where from and how many chars

select substring('abra_cadabra_abra' from 6 for 7) -- by index & number of chars
--select using regex (by posix and sql)

select trim(both ' ' from ' Hello ');
select trim(leading ' ' from ' Hello ');
select trim(trailing ' ' from ' Hello ');

--select convert('text_in_ascii', 'ascii', 'UTF8')

--replace

--numerical functions--
select abs(-1), abs(1);

--what about rounding mode?
select round(3.4),round(3.6),round(3.6);
select ceil(3.4),ceil(3.5),ceil(3.6),ceil(4);
select floor(3.4),floor(3.5),floor(3.6), floor(4);

select sign(-1), sign(1);

select mod(5, 2), mod(4, 2);
select mod(5,2)=0; --if it is even?

select sqrt(16), sqrt(4.5);
select format(sqrt(4.5), 2);
select power(2, 5) --or pow in short

select greatest(1,2,3,4,5);

--DATES & TIMES--
select current_date;

select 
	extract(day from date '2020-02-20') as day, 
	extract(month from date '2020-01-15') as month, 
	extract(year from date '2020-01-15') as year
	
select date_trunc('month', date'2020-01-15') -- cut off days
select date_trunc('year', date'2020-01-15') -- cut off months & days

select current_date + integer '3';
select current_date + interval '2 hours 30 minutes';
select current_date + interval '1 day';

select localtimestamp + interval '2 hours 30 minutes';
select localtimestamp + time '02:30';

--conversion--

--todo: casting example

select convert(int, 2.5);


