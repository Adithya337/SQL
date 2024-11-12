-- create table products(pro_id int,pro_name varchar(15),quantity_avialble int,quantity_sold int);
-- insert into products(pro_id,pro_name,quantity_avialble,quantity_sold) values(101,'Biscuits',100,50);
-- create table sales(pro_id int ,sale_quantity int ,sale_price int ,sale_date date , total_val int);
-- insert into sales(pro_id,sale_quantity,sale_price,sale_date,total_val) values(101,1,20,TO_DATE('2024-10-23', 'YYYY-MM-DD'),20);
-- insert into products(pro_id,pro_name,quantity_avialble,quantity_sold) values(102,'Chocos',10,90);


-- create or replace procedure my_trans()
-- language plpgsql
-- as $$
-- declare
-- 	var_pro_id int;
-- begin 
-- 	select pro_id into var_pro_id from products 
-- 	where pro_name = 'Biscuits';

-- 	insert into sales(pro_id,sale_quantity,sale_price,sale_date,total_val)
-- 	values(var_pro_id,1,25,current_date,(1*25));

-- 	update products set quantity_avialble = quantity_avialble-1 , 
-- 	quantity_sold = quantity_sold+1 where pro_id = var_pro_id;

-- 	raise notice 'Product Sold';
-- end;
-- $$


create or replace procedure my_trans( IN p_pro_id int, IN p_quantity int)
language plpgsql
as $$
declare
	var_pro_id int;
	v_count int;
begin 
	select count(1) 
	into v_count
	from products 
	where pro_id = p_pro_id and products.quantity_avialble >= p_quantity;
	if v_count > 0 then 
	
		-- select pro_id into var_pro_id from products 
		-- where pro_name = 'Biscuits';
		
		insert into sales(pro_id,sale_quantity,sale_price,sale_date,total_val)
		values(p_pro_id,p_quantity,25,current_date,(p_quantity*25));
	
		update products set quantity_avialble = quantity_avialble-p_quantity , 
		quantity_sold = quantity_sold+p_quantity where pro_id = p_pro_id;

		raise notice 'Product Sold';
	else 
		raise notice 'Insufficient quantity';
	end if;
end;
$$

-- select * from products;
-- select * from sales;

-- call my_trans();

-- select * from products;
-- select * from sales;


call my_trans(102,5);