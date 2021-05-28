Была такая функция:

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

Что если передать чушь (15)?

drop function if exists get_season;
create or replace function get_season(month_number int) returns text AS $$
declare
	season text;
begin
	if month_number NOT BETWEEN 1 and 12 THEN
		RAISE EXCEPTION 'Invalid month. You passed:(%)', month_number USING HINT='Allowed from 1 up to 12', ERRCODE=12882;
	end if;

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


create or replace function get_season_caller1(month_number int) returns text AS $$
declare
	err_ctx text;
	err_msg text;
	err_details text;
	err_code text;
BEGIN
    return get_season(15);
EXCEPTION
	WHEN SQLSTATE '12882' then
        GET STACKED DIAGNOSTICS err_ctx = PG_EXCEPTION_CONTEXT,
						  err_msg = MESSAGE_TEXT,
                          err_details = PG_EXCEPTION_DETAIL,
                          err_code = RETURNED_SQLSTATE;		
		RAISE INFO 'My custom handler:';
        RAISE INFO 'Error msg:%', err_msg;
        RAISE INFO 'Error details:%', err_details;	 
		RAISE INFO 'Error code:%', err_code;	 
		RAISE INFO 'Error context:%', err_ctx;		
	RETURN NULL;		
END;
$$ language plpgsql;

create or replace function get_season_caller2(month_number int) returns text AS $$
declare
	err_ctx text;
	text_var1 text;
	text_var2 text;
	text_var3 text;
BEGIN
    return get_season(15);
EXCEPTION
    --when others then
	WHEN SQLSTATE '12882' then  
	--won't catch by another code
		RAISE INFO 'My custom handler:';
        RAISE INFO 'Error Name:%',SQLERRM;
        RAISE INFO 'Error State:%', SQLSTATE;			
	RETURN NULL;		
END;
$$ language plpgsql;

select get_season_caller2(15);