-- drop table if exists cars;
-- CREATE  table  cars (
--     id INT PRIMARY KEY,
--     name VARCHAR(50),
--     color VARCHAR(30),
--     brand VARCHAR(50)
-- );
-- INSERT INTO cars (id, name, color, brand) VALUES
-- (1, 'Civic', 'Red', 'Honda'),
-- (2, 'Civic', 'Black', 'Honda'),
-- (3, 'Corolla', 'White', 'Toyota'),
-- (4, 'Corolla', 'White', 'Toyota'),
-- (5, 'Mustang', 'Blue', 'Ford'),
-- (6, 'Mustang', 'Red', 'Ford'),
-- (7, 'Swift', 'Red', 'Maruti'),
-- (8, 'Swift', 'Blue', 'Maruti'),
-- (9, 'Civic', 'White', 'Honda'),
-- (10, 'Corolla', 'Black', 'Toyota');

-- begin;

-- delete from cars where id not in (select max(id) from cars group by name,color,brand);

-- delete from cars where id  in 
-- (select max(id) from cars group by name,color,brand having count(*) > 1);

-- delete from cars where id in 
--(select a.id from cars a join cars b on a.name = b.name and a.color = b.color and a.brand = b.brand and a.id < b.id) ;

-- delete from cars where id in 
-- (select id from (select *,row_number() over(partition by name,color,brand ) as rn from cars) a where  rn >1)  ;

rollback;

-- select * from cars;