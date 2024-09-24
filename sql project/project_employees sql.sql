create database project;
use project;

select * from employees_dataset;

alter table employees_dataset change column `First Name` first_name text;
alter table employees_dataset change column `last Name` last_name text;
alter table employees_dataset change column `start date` start_date text;
alter table employees_dataset change column `monthly salary` monthly_salary int;
alter table employees_dataset change column `annual salary` annual_salary int;
alter table employees_dataset change column `job rate` job_rate int;
alter table employees_dataset change column `sick leaves` sick_leaves int;
alter table employees_dataset change column `unpaid leaves` unpaid_leaves text;
alter table employees_dataset change column `overtime hours` overtime_hours text;
alter table employees_dataset  rename to      employee  ;

-- ------------------------------------------------------------------------q-1------------------------------------------------------------------------------------------------
-- 1  How many employees are there in total?


select count(first_name)
from employee;



-- 2 How many male and female employees are there?

select gender ,count(*) as gen_ratio
from employee
group by gender;



-- 3 How many employees are in each department?


select count(first_name),department
from employee
group by department;


-- 4 What is the average monthly salary of employees?

select avg(monthly_salary) as avg_sal
from employee;


 --  5 is the total annual salary for all employees combined
 
 select sum(annual_salary) 
 from employee;
 
 
 
 -- 6-Who are the top 5 highest paid employees based on their annual salary?
 
 
 select annual_salary
 from employee
 order by annual_salary desc
 limit  5;
 
 
 
 -- 7How many employees work in each country?
 
 
 
 select count(*),country
 from employee
 group by country;

 -- --8 How many employees have more than 5 years of experience?
 
 select  count(*)
 from employee
 where years >5;
 
 
 -- 9What is the average job rate across all employees?
 
 select avg(job_rate)
 from employee;
 
 
 ---- 10 What is the gender ratio within each department?
 
 
 
 
 sELECT Department, Gender, COUNT(*) AS total FROM employee 
 GROUP BY Department, Gender order by department;
 
 
 
 
 -- --11 Which departments have the highest average salary?
 
 
 select department ,avg(annual_salary)
 from employee
 group by department
 order by avg(annual_salary) desc limit 1;
 
 
 -- 12 How many employees have not taken any sick leave?
 
 select count(*) sick_leave 
 from employee
 where sick_leaves = 0;
 
 
-- 13 How many sick leaves have been taken by employees in each department?
 
 
 select  count(sick_leaves) ,department
 from employee
 group by department;
 
 
 -- 13Find employees who started before 2015.

select first_name
from employee
where start_date <2015;


-- 14List employees who work in a specific country (e.g., 'egypt').

select first_name
from employee
where country = 'egypt';

-- 15Find employees who have worked overtime .

select first_name 
from employee
where overtime_hours is not null;

-- 16List employees whose job rate is greater than 3%. 

select first_name,last_name 
from employee
where job_rate >3;


-- 17Find the department with the highest number of employees.


select department,count(first_name)
from employee
group by department
order by count(first_name) desc
limit 1;



-- --18 List employees who have taken no sick leaves and worked overtime.

select first_name 
from employee
where sick_leaves = 0
and overtime_hours is not null;

-- 19Retrieve employees with monthly salary above 2,000 and less than 10,000.


select first_name,monthly_salary
from employee
where monthly_salary between 2000 and 10000;

-- 20Find the center with the most employees.

select count(first_name) ,center
from employee
group by center
order  by count(first_name) desc
limit 1;

-- 21List employees who have worked more than the average number of years.

select first_name
from employee
where years >
(select avg(years)
from employee)
;

---- 22 Calculate the total annual salary for each country. 


select sum(annual_salary),country
from employee
group by country;

-- 23Find employees who have the highest annual salary in each department.

select first_name,department,annual_salary
from employee
where annual_salary in
(select max(annual_salary)
from employee
group by department);


-- --24 List departments with more than 10 employees and an average salary above 15,000.

select department,count(first_name),avg(annual_salary)
from employee
group by department
having count(first_name) >10
and avg(annual_salary) >15000;



-- 25Get the total number of unpaid leaves taken by employees in each country, ordered by the highest first.


select country,sum(unpaid_leaves)
from employee
group by country
order by sum(unpaid_leaves) desc;



-- 26Find the employee(s) who have the highest overtime hours and also work more than 2 years.

select first_name,last_name,overtime_hours,years
from employee
where years >2
and overtime_hours =
(select max(overtime_hours)
from employee);


---- 27 Show the departments where the total overtime hours are greater than the average overtime hours across all employees.

select department, sum(overtime_hours)
from employee
group by department
having sum(overtime_hours) > avg(overtime_hours);

--- -28 Find employees whose job rate is consistently higher across multiple centers.

select first_name,last_name ,count( distinct job_rate)
from employee
group by first_name,last_name
having count(distinct job_rate) = 1;


---- 29 Calculate the total salary cost for employees who have taken sick leaves and worked overtime.

select sum(annual_salary)
from employee 
where sick_leaves >0
and overtime_hours
is not null;


-- 30Get the top 3 employees with the highest job rate who have not taken any unpaid leaves.

select first_name,job_rate
from employee

where unpaid_leaves = 0
order by job_rate
desc 
limit 3;




-- --31 Find employees who earn more than the average salary of their country.

select first_name,last_name,country,annual_salary
from employee
where annual_salary >
(select avg(annual_salary)
from employee );

-- 32List departments where more than 50% of employees have a job rate below 90%.


SELECT Department
FROM employee
GROUP BY Department
HAVING SUM(CASE WHEN job_rate < 90 THEN 1 ELSE 0 END) > 0.5 * COUNT(*);

use project;


---- 33 Employees with Above-Average Salary in Department

select department,(annual_salary)
from employee
where annual_salary >
(select avg(annual_salary)
from employee);


-- . 34 Top 3 Highest Paid Employees by Department


select annual_salary,first_name,department
from employee
order by annual_salary
desc limit 3;


-- 35. Average Salary by Department and Gender

select avg(annual_salary),department,gender
from employee
group by department,gender
order by department;



-- 34. Employees with More Overtime than Average

select first_name,overtime_hours
from employee
where overtime_hours >
(select avg(overtime_hours)
from employee);


-- 35. Employee with Maximum Overtime by Department

select first_name,overtime_hours,department 
from employee
where overtime_hours =
(select max(overtime_hours)
from employee);

-- 36. Total Overtime Pay (assuming 1.5x job rate)

SELECT first_name, last_name, (overtime_hours * job_rate * 1.5) AS overtime_pay 
FROM employee;


-- 7. Employees Who Took No Sick Leaves


 select first_name
 from employee
 where sick_leaves = 0 ;
 
--  38. Departments with the Highest Sick Leave Rate

select department ,sick_leaves
from employee
order by sick_leaves desc
limit 1;

-- 39. Employees with Above-Average Years of Service

select first_name,years
from employee
where years >
(select avg(years)
from employee
);


-- 40. Find Employees with the Longest Tenure in Each Department

select department,first_name,years
from employee
where years =
(select max(years)
from employee
);