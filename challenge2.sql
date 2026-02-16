-- Write a MySQL query to create a table named jobs
--   including columns job_id, job_title, min_salary and max_salary,
-- and make sure that, the default value for job_title is blank 
-- and min_salary is 8000 and max_salary is NULL
--  will be entered automatically at the time of insertion if no value assigned for the specified columns.
-- Database Design Services
show tables;

create table if not exists jobs (
 job_id int  auto_increment primary key,
 job_title varchar(35) Not null default'',
 min_salary int check(min_salary=8000),
 max_salary int  default Null 
)

-- primary key -> include not null+unique(no id's are equal)
select * from jobs;
describe jobs;
-- 
-- 11. Write a MySQL query to create a table named countries
-- including columns country_id, country_name and region_id 
-- and make sure that the country_id column will be a key field which will not contain any duplicate data 
-- at the time of insertion. 
-- drop table countries ;
-- create table if not exists countries (
-- 	country_id varchar(10) primary key Unique ,
-- 	country_name varchar(20) Not null ,
-- 	region_id int Not null unique )
describe  countries;

--


-- 12. Write a MySQL query to create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto incremented value. 
-- drop table countries ;
-- create table if not exists countries (
-- 	country_id int primary key auto_increment  ,
-- 	country_name varchar(20) Not null ,
-- 	region_id int Not null  )
describe  countries;

--

-- 13. Write a MySQL query to create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique. 
-- drop table countries ;
-- create table if not exists countries (
-- 	country_id int  primary key Unique ,
-- 	country_name varchar(20) Not null ,
-- 	region_id int Not null unique )
describe  countries;

-- you can also make this create table countries (
--     country_id int not null,
--     region_id int not null,
--     country_name varchar(20) not null,
--     primary key (country_id, region_id)
-- );  but in this case region_id,country_id will be altogether as a composite primary keys  and this is useful if we need more  than unique column to identify the rows of the table but the common is one primary key 

-- 4. Write a MySQL query to create a table job_history including columns employee_id, start_date, end_date, job_id
--  and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion 
-- and the foreign key column job_id contain only those values which are exists in the jobs table. 



-- create table if not exists jobs (
--  job_id int  auto_increment primary key,
--  job_title varchar(35) Not null default'',
--  min_salary int check(min_salary=8000),
--  max_salary int  default Null 
-- )
-- 
-- create table if not exists job_history (
-- 	employee_id int primary key,
-- 	start_date Date not null,
-- 	end_date Date not null,
-- 	job_id int not null unique,
-- 	department_id decimal(10,0) not null unique,
-- 	foreign key (jop_id) references jobs(job_id) 
-- )
-- describe job_history;
-- describe jobs;

-- write a MySQL query to create a table employees including columns employee_id, first_name, last_name, email,
--  phone_number hire_date, job_id, salary, commission, manager_id and department_id
--  and make sure that, the employee_id column does not contain any duplicate value at the time of insertion 
--  and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values
-- , which combinations are exists in the departments table.
-- 
-- Assume the structure of departments table below.
-- 
-- +-----------------+--------------+------+-----+---------+-------+
-- | Field           | Type         | Null | Key | Default | Extra |
-- +-----------------+--------------+------+-----+---------+-------+
-- | DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
-- | DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
-- | MANAGER_ID      | decimal(6,0) | NO   | PRI | 0       |       |
-- | LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
-- +-----------------+--------------+------+-----+---------+-------+
-- CREATE  table if not exists departments (
-- 	department_id decimal(4,0) default 0,
-- 	department_name varchar(30) null ,
-- 	manager_id  decimal(6,0),
-- 	location_id decimal(4,0) null ,
-- 	Primary key (department_id,manager_id) 
-- 
-- ) 
-- create table if not exists employees (
-- employee_id int primary key ,
-- first_name varchar(20) not null,
-- last_name varchar(20) not null,
-- email varchar(50) not null,
-- phone_number varchar(20) not null,
-- hire_date Date not null ,
-- job_id  int not null,
-- salary varchar(20) not null ,
-- commission varchar(20) not null ,
-- manager_id decimal(6,0) not null unique,
-- department_id decimal(4,0) not null unique,
-- foreign key (department_id,manager_id) references departments(department_id,manager_id)
-- )
describe employees;
-- 
-- 16. Write a MySQL query to create a table employees including columns employee_id, first_name, last_name, email, phone_number
-- hire_date, job_id, salary, commission, manager_id and department_id and make sure that, 
-- the employee_id column does not contain any duplicate value at the time of insertion, 
-- and the foreign key column department_id, reference by the column department_id of departments table, 
-- can contain only those values which are exists in the departments table and another foreign key column job_id,
--  referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table.
--  The InnoDB Engine have been used to create the tables. MySQL Database Hosting
-- 
-- "A foreign key constraint is not required merely to join two tables. 
-- For storage engines other than InnoDB, it is possible when defining a column to use a REFERENCES tbl_name(col_name) clause,
--  which has no actual effect, and serves only as a memo or comment to you that the column which you are currently defining 
-- is intended to refer to a column in another table.



create table if not exists employees (
employee_id int primary key ,
first_name varchar(20) not null,
last_name varchar(20) not null,
email varchar(50) not null,
phone_number varchar(20) not null,
hire_date Date not null ,
job_id  int not null,
salary varchar(20) not null ,
commission varchar(20) not null ,
manager_id decimal(6,0) not null unique,
department_id decimal(4,0) not null unique,
foreign key (department_id,manager_id) references departments(department_id,manager_id)
)




-- 7. Write a MySQL query to create a table employees including columns employee_id, first_name, last_name, job_id,
-- salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, 
-- and the foreign key column job_id, referenced by the column job_id of jobs table, 
-- can contain only those values which are exists in the jobs table.
-- The InnoDB Engine have been used to create the tables. 
-- The specialty of the statement is that,
--  The ON UPDATE CASCADE action allows you to perform cross-table update and 
-- ON DELETE RESTRICT action reject the deletion. The default action is ON DELETE RESTRICT. 
-- drop table employees;
-- create table if not exists employees (
-- employee_id int primary key ,
-- first_name varchar(20) not null,
-- last_name varchar(20) not null,
-- email varchar(50) not null,
-- phone_number varchar(20) not null,
-- hire_date Date not null ,
-- job_id  int not null,
-- salary varchar(20) not null ,
-- commission varchar(20) not null ,
-- manager_id decimal(6,0) not null unique,
-- department_id decimal(4,0) not null unique,
-- foreign key (department_id,manager_id) references departments(department_id,manager_id) on update cascade 
-- )

CREATE  table if not exists departments (
	department_id decimal(4,0) default 0,
	department_name varchar(30) null ,
	manager_id  decimal(6,0),
	location_id decimal(4,0) null ,
	Primary key (department_id,manager_id) 

) ;
-- we will update the value of department_id and see does the value of it's child in employees will change or not  but first let's enter a data into table
-- insert into departments (department_id,department_name,manager_id,location_id) values(1234,'mission',98888,123);
--  create table if not exists employees (
-- employee_id int primary key ,
-- first_name varchar(20) not null,
-- last_name varchar(20) not null,
-- email varchar(50) not null,
-- phone_number varchar(20) not null,
-- hire_date Date not null ,
-- job_id  int not null,
-- salary varchar(20) not null ,
-- commission varchar(20) not null ,
-- manager_id decimal(6,0) not null unique,
-- department_id decimal(4,0) not null unique,
-- foreign key (department_id,manager_id) references departments(department_id,manager_id) on update cascade 
-- )
insert into employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission,manager_id,department_id) values 
(12345,'Ahmed','Qasim','ahmed@gmail.com','12387676655','2020-02-20',8882,'$22222','$89',98888,1234) ;
select * from departments;
select * from employees;
update departments set manager_id=99911 where manager_id=98888  ;
select * from departments;
-- so as you see after I changed this value into this column in parent table -> as we used on update cascade so the value of the same child will change respectly
-- but if you didn't use on update cascade and used  ON DELETE RESTRICT or didn't use any of them so this will be as a default  ON DELETE RESTRICT and you can't change the parent as there's a restriction between them.
-- stop at  problem 18;
