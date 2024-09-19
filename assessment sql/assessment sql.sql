create database worker;
use  worker;
-- ---------------------------------------------------------------------Q-1----------------------------------------------------------------------------------------------------------
create table worker(worker_id int,first_name 
varchar(20),last_name varchar(20)
,salary int,join_date datetime
,department varchar(20));


insert into worker (worker_id,first_name,last_name,salary,join_date,department)
values (1, 'monika', 'arora', 100000, "2014-02-20 09:0:00.0000", 'hr'),
(2, 'niharika', 'verma', 80000, "2014-06-11 09:0:00.0000", 'admin'),
(3, 'vishal', 'singhal', 300000, "2014-02-20 09:0:00.0000", 'hr'),
(4, 'amitabh', 'singh', 500000, "2014-02-20 09:0:00.0000", 'admin'),
(5, 'vivek', 'bhati', 500000, "2014-06-11 09:0:00.0000", 'admin'),
(6, 'vipul', 'diwan', 200000, "2014-06-11 09:0:00.0000", 'account'),
(7, 'satish', 'kumar', 75000, "2014-01-20 09:0:00.0000", 'account'),
(8, 'geetika', 'chauhan', 90000, "2014-04-11 09:0:00.0000", 'admin');


-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
-- Ascending and DEPARTMENT Descending.


select * from worker 
order by first_name  ,
 department desc;

-- 2.Write an SQL query to print details for Workers with the first names      
-- from the Worker table

select * from worker;

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
-- contains six alphabets. 


select first_name
from worker
where first_name like '_____h';


-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 1.

select * from employees ;

 
-- 5.Write an SQL query to fetch duplicate records having matching data in some fields of a table.

select first_name , count(first_name) as count
from worker 
group by first_name having count(first_name) >1;

-- 6. Write an SQL query to show the top 6 records of a table.

select * from worker
limit 6;


-- 7. Write an SQL query to fetch the departments that have less than five people in them.

select department from worker

group by department
having count(department) <5;


-- 8. Write an SQL query to show all departments along with the number of people in there.

select  department ,count(first_name)
from worker
group by department;

-- 9. Write an SQL query to print the name of employees having the highest salary in each 
-- department.

use worker;
SELECT FIRST_NAME,salary,department
from worker
where salary in
(select max(salary) from worker
group by  department);



-- ---------------------------------------------------------------------------Q-1---------------------------------------------------------------------------------------------



 

  
create database student;
use student;



create table student(stu_id int,stu_name varchar(30),sex varchar(30),
perc bigint,class int,section varchar(10) ,str varchar (30), dob date);

drop table student;
insert into student (stu_id,stu_name,sex,perc,class,section,str,dob)
values( 1001, 'surekha joshi', 'female', 82, 12,'A', 'science','1998-03-08'),
( 1002, 'maahi agrawal', 'female', 56, 11,'c', 'commerce','2008-11-23'),
( 1003, 'sanam verma', 'male', 59, 11,'c', 'commerce','2006-06-29'),
( 1004, 'rohit kumar', 'male', 63, 11,'c', 'commerce','1997-11-05'),
( 1005, 'dipesh pulkit', 'male', 78, 11,'b', 'science','2003-12-09'),
( 1006, 'jahanvi puri', 'female', 60, 11,'b', 'commerce','2008-11-07'),
( 1008, 'sahil saras', 'male', 56, 11,'c', 'commerce','2008-11-07'),
( 1009, 'akshra agrawal', 'female', 72, 12,'b', 'commerce','1996-01-10'),
( 1010, 'stuti mishra', 'female', 39, 11, 'f', 'science','2008-11-23'),
( 1011, 'harsh agrawal', 'male', 42, 11,'c', 'science','1998-03-08'),
( 1012, 'nikunj agrawal', 'male', 49, 12,'c', 'commerce','1998-12-08'),
( 1013, 'akriti saxena', 'female', 89, 12,'A', 'science','2008-01-23'),
( 1014, 'tani rastogi', 'female', 82, 12,'A', 'science','2008-01-23');



-- 1 To display all the records form STUDENT table. SELECT * FROM student ; 

select * from student;


-- 2. To display any name and date of birth from the table STUDENT. SELECT StdName, DOB 
-- FROM student ; 

select stu_name,dob
from student;

-- 3. To display all students record where percentage 
-- is greater of equal to 80 FROM student table. 
-- SELECT * FROM student WHERE percentage >= 80; 


select * from student 
where perc >=80;

-- 4. To display student name, stream and percentage where percentage of student is more than 80 
-- SELECT StdName, Stream, Percentage WHERE percentage > 80;  


select stu_name,str,perc
from student
where perc>80;


-- 5. To display all records of science students whose percentage is more than 75 form student table. 
-- SELECT * FORM student WHERE stream = ‘Science’ AND percentage > 75;


select * from student
where str = 'science'
and perc>75;
