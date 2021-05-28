--*IF-THEN-ELSE*--
drop function if exists convert_temp_to;
create or replace function convert_temp_to(temperature real, to_celsius bool DEFAULT true) returns real AS $$
declare
	result_temp real;
begin
	if to_celsius then
		result_temp = (5.0/9.0)*(temperature-32);
	else
		result_temp:=(9*temperature+(32*5))/5.0;
	end if;
	
	return result_temp;
end;
$$ language plpgsql;

select convert_temp_to(80);
select convert_temp_to(26.7, false);

--*IF-ELSIF-ELSE*--

drop function if exists get_season;
create or replace function get_season(month_number int) returns text AS $$
declare
	season text;
begin
	if month_number BETWEEN 3 and 5 then
		season = 'Spring';
	elsif month_number BETWEEN 6 and 8 then
		season = 'Summer';
	elsif month_number BETWEEN 9 and 11 then
		season = 'Autumn';
	else
		season = 'Winter';
	end if;
	
	return season;

end;
$$ language plpgsql;

select get_season(12)

