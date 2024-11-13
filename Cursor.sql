-- create table students(id serial primary key,full_name varchar ,branch_id int);
-- INSERT INTO students (
--     id,
--     full_name,
--     branch_id
-- )
-- VALUES
--     (1, 'M.S Dhoni', NULL),
--     (2, 'Sachin Tendulkar', 1),
--     (3, 'R. Sharma', 1),
--     (4, 'S. Raina', 1),
--     (5, 'B. Kumar', 1),
--     (6, 'Y. Singh', 2),
--     (7, 'Virender Sehwag ', 2),
--     (8, 'Ajinkya Rahane', 2),
--     (9, 'Shikhar Dhawan', 2),
--     (10, 'Mohammed Shami', 3),
--     (11, 'Shreyas Iyer', 3),
--     (12, 'Mayank Agarwal', 3),
--     (13, 'K. L. Rahul', 3),
--     (14, 'Hardik Pandya', 4),
--     (15, 'Dinesh Karthik', 4),
--     (16, 'Jasprit Bumrah', 7),
--     (17, 'Kuldeep Yadav', 7),
--     (18, 'Yuzvendra Chahal', 8),
--     (19, 'Rishabh Pant', 8),
--     (20, 'Sanju Samson', 8);


-- select * from students;
begin;
declare my_cursor cursor for select * from students;
FETCH relative 1 FROM my_cursor;