-- 6. Write a MySQL query to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000. 

-- table => jobs
-- columns -> job_id , job_title,min_salary,max_salary,
-- check max_salary > 25000 or not

create table jobs (
job_id int primary key,
job_title varchar(100) not null,
min_salary decimal(10,2) ,
max_salary decimal(10,2),
check(max_salary <= 25000)         -- this line ensure that max_salary will not exceed over this value forever 
);
Alter table jobs add  column job_title int not null;
select * from jobs;
describe jobs;

-- 
-- 7. Write a MySQL query to create a table named countries 
-- including columns country_id, country_name and region_id 
-- and make sure that no countries except Italy, India and China will be entered in the table. 

-- table -> countries
-- columns -> country_id,country_name,region_id
-- put a condition to prevent countries => Italy , India, China

-- 
create table if not exists countries (
country_id int primary key not null,
country_name varchar(50) not null,
region_id decimal(10,0) ,
check(country_name in ('Italy','India','China'))
);
describe countries;

insert into countries (country_id,country_name ,region_id) values (234,'India',1333431231);  -- will return failed as the condition we put 

insert into countries (country_id,country_name ,region_id) values (134,'Italy',1333431231);
insert into countries (country_id,country_name ,region_id) values (2934,'China',1333431231);
insert into countries (country_id,country_name ,region_id) values (234,'USA',1333431231);   -- failed as the exception 

select * from countries;

-- drop table countries;

-- 8. Write a MySQL query to create a table named job_histry 
-- including columns employee_id, start_date, end_date, job_id and department_id 
-- and make sure that the value against column end_date will be entered at the time of insertion 
-- to the format like '--/--/----'

-- table -> job_history
-- columns -> employee_id,start_date,end_date,jop_id,department_id
--  end_date -> format (--/--/----)

create table if not exists job_history(
employee_id int  primary key auto_increment ,  
start_date varchar(10) not null ,
end_date varchar(10) not null,
job_id int not null,
department_id decimal(10,2) not null,
check(end_date REGEXP  "^[0-9]{2}/[0-9]{2}/[0-9]{4}$"),   -- this is hard to implement 
CHECK (start_date LIKE '__/__/____')   -- this is simple + easy to write 

);
-- drop table job_history;
-- REGEXP -> this is called Regular expression used to match a string into the database
-- ^ -> start of the pattern
-- $ -> end of the pattern
insert into job_history (start_date,end_date,job_id,department_id) values ('12/09/1222','09/09/2000',12343,1234);
insert into job_history (start_date,end_date,job_id,department_id) values ('11/07/1999','10/08/2100',123453,1334);
select * from job_history;

-- 9. Write a MySQL query to create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.


-- countries 
-- columns -> country_id, country_name,region_id 
-- no duplicates at country_id 
drop table countries;
create table if not exists countries (
country_id int primary key not null unique ,
country_name varchar(50) not null ,
region_id decimal(10,0) 

);
insert into countries (country_id,country_name ,region_id) values (1,'USA',12344);
insert into countries (country_id,country_name,region_id) values (2,'Norway',12354);
select * from countries c;
describe countries;


-- stop at example;10