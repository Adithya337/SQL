drop table if exists teams;
create  table teams(team_name varchar(10));
insert into teams values ('KKR'),('MI'),('PSK');

select concat(t1.team_name,' VS ',t2.team_name) as teams
from teams t1
join teams t2
on t1.team_name < t2.team_name 
order by teams;
-----------------------------------------------------
-- Write a sql query to find teachers who teaches only Maths and Science
CREATE TABLE teacher_subjects (
    teacher_id INT,
    subject VARCHAR(50),
    marks INT
);
INSERT INTO teacher_subjects (teacher_id, subject, marks) VALUES
(101, 'Maths', 85),
(101, 'Science', 90),
(102, 'Maths', 78),
(102, 'English', 88),
(102, 'Physics', 88),
(103, 'Science', 92),
(103, 'Maths', 80),
(104, 'Science', 75),
(104, 'History', 70),
(105, 'Maths', 95),
(105, 'Science', 89);

select teacher_id,count(*) as cnt from teacher_subjects
group by teacher_id
having count(*) = 2
and sum(case when subject in ('Maths','Science') then 1 else 0 end) = 2;
---------------------------------
-- monthly count of new customer auqisitions
CREATE TABLE rides (
    ride_id INT,
    cust_id INT,
    ride_timestamp TIMESTAMP,
    city_id INT,
    ride_status VARCHAR(20)
);
INSERT INTO rides 
(ride_id, cust_id, ride_timestamp, city_id, ride_status)
VALUES

(1, 101, '2025-01-05 09:30:00', 1, 'COMPLETED'),
(2, 102, '2025-01-10 11:00:00', 1, 'COMPLETED'),
(3, 101, '2025-02-03 14:20:00', 2, 'CANCELLED'),
(4, 103, '2025-02-08 18:45:00', 1, 'COMPLETED'),
(5, 104, '2025-02-15 10:10:00', 2, 'COMPLETED'),
(6, 105, '2025-03-01 08:00:00', 1, 'COMPLETED'),
(7, 102, '2025-03-04 19:30:00', 3, 'COMPLETED'),
(8, 106, '2025-03-12 12:15:00', 2, 'COMPLETED'),
(9, 107, '2025-04-02 16:00:00', 1, 'CANCELLED'),
(10, 108, '2025-04-10 09:45:00', 3, 'COMPLETED');

with cte as (select cust_id,min(ride_timestamp) as first_date 
from rides
group by 1)
select format_date(first_Date,'MM') as month,count(*) as cnt from cte group by 1 order by month;

select date_trunc('year',  first_Date) as month,count(*) as cnt from cte group by 1 order by month;

-----------------------------------------------------------------------------------
-- overlapping festivals
drop table if exists festivals;
CREATE TABLE festivals (
    id INT,
    festival_name VARCHAR(100),
    start_date DATE,
    end_date DATE
);
INSERT INTO festivals (id, festival_name, start_date, end_date)
VALUES

-- No overlap
(1, 'Pongal Fest', '2025-01-10', '2025-01-12'),

-- Partial overlap with id 1
(2, 'Harvest Carnival', '2025-01-11', '2025-01-15'),

-- No overlap with previous
(3, 'Music Fiesta', '2025-01-20', '2025-01-22'),

-- Fully inside id 5
(4, 'Food Expo', '2025-02-05', '2025-02-06'),

-- Larger interval containing id 4
(5, 'Cultural Week', '2025-02-01', '2025-02-10'),

-- Same start date as id 7
(6, 'Book Fair', '2025-03-01', '2025-03-03'),

-- Same start date overlap
(7, 'Art Festival', '2025-03-01', '2025-03-05'),

-- Same end date as id 7
(8, 'Dance Gala', '2025-02-27', '2025-03-05'),

-- One-day festival
(9, 'Flash Mob Event', '2025-04-10', '2025-04-10'),

-- Back-to-back with id 9 (usually not overlap)
(10, 'Tech Summit', '2025-04-11', '2025-04-13'),

-- Exact same range as id 12
(11, 'Summer Fest', '2025-05-01', '2025-05-07'),

-- Exact overlap
(12, 'City Carnival', '2025-05-01', '2025-05-07');

select * from festivals f1
join festivals f2 
on f1.festival_name <> f2.festival_name
where f1.end_date >= f2.end_date and f1.start_date <= f2.start_date;
--Count of festivals which are running on particular start date
select f1.start_date,count(*) as cnt
from festivals f1,festivals f2
where f1.start_date between f2.start_date and f2.end_Date
group  by 1
