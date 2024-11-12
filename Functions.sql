-- create or replace function fn_mid1(varchar , integer,integer)
-- returns varchar
-- as
-- $$
-- declare word ALIAS for $1;
-- begin
-- 	return substring(word,$2,$3);
-- end;
-- $$
-- language plpgsql;
-- select fn_mid1('Adithya',3,6);


-- create or replace function fn_mid1(buffer varchar ,start_pos integer,end_pos integer)
-- returns varchar
-- as
-- $$
-- begin
-- 	return substring(buffer,start_pos,end_pos);
-- end;
-- $$
-- language plpgsql;
-- select fn_mid1('Adithya',3,6);



-- create or replace function fnMakeFull(fname varchar ,lname varchar)
-- returns varchar
-- as
-- $$
-- begin
-- 	if fname is null and lname is null then
-- 		return null;
-- 	elsif fname is null then
-- 		return fname;
-- 	elsif lname is null then
-- 		return lname;
-- 	else
-- 		return fname ||' '||lname ;
-- 	end if;
-- end;
-- $$
-- language plpgsql;
-- select fnMakeFull('Adithya','Vardhan');


-- create or replace function fnSwap(inout num1 integer,inout num2 integer)
-- as
-- $$
-- begin
-- 	select num1,num2 into num2,num1;
-- end;
-- $$
-- language plpgsql;

-- select * from fnSwap(10,20)


create or replace function fnMean(numeric[])
returns numeric
as
$$
declare total numeric :=0;
		val numeric ;
		cout int:= 0 ;
		n_array ALIAS for $1;
begin
	foreach val in array n_array
	loop
		total := total+val;
		cout := cout+1;
	end loop;
	return total/cout;
end;
$$
language plpgsql;

select fnMean(ARRAY[10,20,30,40]);