--Raise Error
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

select get_season(15) --raise error how to?, array of months and for loop over it?