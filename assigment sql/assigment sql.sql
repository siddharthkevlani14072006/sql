use hr;
-- -----------------------------------------------------------------------q1-----------------------------------------------------------------------------------------------------
-- 1-- Display all information in the tables EMP and DEPT.     

select * from employees e
left  join departments d
on e.department_id = d.department_id
union 
select * from employees e
right join departments d
on e.department_id = d.department_id;


 ---- 2 Display only the hire date and employee name for each employee.  
 
 select hire_date,first_name from employees ;
 
 select * from employees;
 
 
--  3 -- Display the ename concatenated with the job ID, separated by a comma and space, and 
-- name the column Employee and Title  

seLECT 
    CONCAT(first_name,' , ', job_id) AS `employee and title`
FROM 
    employees ;
    
    -- 4--  Display the hire date, name and department number for all clerks.  
    
    select concat(first_name, ' ',last_name) as full_name,department_id,hire_date,job_id
    from employees
    where job_id like "%clerk%";
    
    
    select job_id from employees;
    
    
    
  -- 5 --  Create a query to display all the data from the EMP table. Separate each column by a 
-- comma. Name the column THE OUTPUT   

select concat(first_name,',',
last_name,',',
email,',',
phone_number,',',
hire_date,',',
job_id,',',
salary,',',
commission_pct,',',
manager_id,',',
department_id) as output
from employees;

-- 6-- Display the names and salaries of all employees with a salary greater than 2000.  

select concat(first_name,' ',last_name) as full_name,salary
 from employees where salary>2000;
 
 
-- 7--  Display the names and dates of employees with the column headers "Name" and "Start 
-- Date"  


select concat(first_name, ' ',last_name) as 'name',hire_date as 'start_date'
 from employees ;
 
 -- 8 Display the names and hire dates of all employees in the order they were hired.  
 
 
 select concat(first_name, ' ',last_name)as full_name,hire_date
 from employees
  order  by hire_date;
  
  
 -- 9  Display the names and salaries of all employees in reverse salary order. 
 
 select concat(first_name, ' ',last_name)as full_name,salary
 from employees  order by  salary desc;
 
 -- 10--  Display 'ename" and "deptno" who are all earned commission and display salary in 
-- -- reverse order

select first_name,department_id,salary
from employees where commission_pct is not null 
order by salary desc;

-- 11 Display the last name and job title of all employees who do not have a manager  

select e.last_name,e.manager_id,j.job_title
from employees e
  join jobs j
on e.job_id = j.job_id
 where manager_id is null;
 
 -- 12 Display the last name, job, and salary for all employees whose job is sales representative 
-- or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
select job_id from employees;


select last_name,job_id,salary from employees
where job_id in ('sa_rep','st_clerk') 
and salary not in ('2000','3500','5000');

-- --------------------------------------------------------------------- questiom -2------------------------------------------------------------------------------------------

-- 1) Display the maximum, minimum and average salary
--  and commission earned.    

select max(salary),min(salary),avg(salary)
from employees
where commission_pct is not null 
group by job_id;

-- 2) Display the department number, total salary payout and total commission payout for 
-- each department. 

select department_id,sum(salary),sum(commission_pct)
from employees
group by department_id  ;


-- 3) Display the department number and number of employees in each department.   

select department_id,count(employee_id)
from employees
group by department_id;

-- 4) Display the department number and total salary of employees in each department.  

select department_id, sum(salary)
from employees
group by department_id;


-- 5) Display the employee's name who doesn't earn a commission. Order the result set 
-- without using the column name  

select first_name
from employees 
where commission_pct is null
order by 1;

-- 6-- Display the employees name, department id and commission. If an Employee doesn't  
-- earn the commission, then display as 'No commission'. Name the columns appropriately

select first_name,department_id ,
case
   when commission_pct is null then 'no commission'
   else commission_pct
end as commission
from employees;

-- 7 Display the employee's name, salary and commission multiplied by 2. If an Employee 
-- doesn't earn the commission, then display as 'No commission. Name the columns 
-- appropriately

select first_name,salary ,
case
when commission_pct is not null then commission_pct *2
else 'no commission'
end as commission
from employees;

-- 8) Display the employee's name, department id who have the first name same as another 
-- employee in the same department 

select e.first_name,e.department_id
 from employees e
 join employees f 
 on e.department_id = f.department_id
 where e.first_name = f.first_name;
 
 --  9 Display the sum of salaries of the employees working under each Manager.  
 
 select sum(salary),manager_id
 from employees where manager_id is not null
 group by manager_id;
 
 
 -- 10) Select the Managers name, the count of employees working under and the department 
-- ID of the manager.   


select e.first_name,count(e.employee_id),e.department_id,e.manager_id 
from employees e 
join employees s 
 on e.employee_id=s.manager_id 
group by e.employee_id,manager_id;



-- 11) Select the employee name, department id, and the salary. Group the result with the 
-- manager name and the employee last name should have second letter 'a!  

select first_name,department_id,salary,manager_id
from employees e
where last_name like '_a%';


-- Or12) Display the average of sum of the salaries and group the result with the department id. 
-- --order the result with the department id. 


select avg(salary),sum(salary),department_id
from employees
group  by department_id
order by department_id;


--  13 Select the maximum salary of each department along with the department id 

select max(salary),department_id
from employees
group by department_id;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1

select commission_pct,salary ,
case
when salary is not null then salary/10
else 1
end as salary
from employees ;

-- ---------------------------------------------------------------------------Q4-----------------------------------------------------------------------------------------------
-- 1 Write a query to display the last name, department number, department name for all 
-- employees.   

select e.last_name,e.department_id,d.department_name
from employees e
join departments d
on e.department_id = d.department_id;


-- 2 Create a unique list of all jobs that are in department 4. Include the location of the 
-- department in the output. 

select distinct j.job_id,d.department_id
from job_history j
join departments d
on j.department_id = d.department_id
where d.department_id = 4;

-- 3. Write a query to display the employee last name,department name,location id and city of 
-- all employees who earn commission.   

select e.last_name,d.department_name,l.location_id,l.city
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where e.commission_pct is not null;

-- 4. Display the employee last name and department name of all employees who have an 'a' 
-- in their last name  

select e.last_name,d.department_name
from employees e
join departments d
on e.department_id = d.department_id
where e.last_name like '%a%';

-- 5. Write a query to display the last name,job,department number and department name for 
-- all employees who work in ATLANTA.   

select e.last_name,j.job_id,e.department_id,d.department_name
from employees e
join departments d
on e.department_id = d.department_id
join job_history j
on d.department_id = j.department_id
where d.location_id = 'atlanat';


-- 6. Display the employee last name and employee number along with their manager's last 
-- name and manager number.

select e1.last_name as employee_name,e1.employee_id as employee_number,
e2.last_name as manager_name,e2.manager_id as manager_number
from employees e1
left join employees e2
on e1.manager_id = e2.manager_id;


-- 7. Display the employee last name and employee number along with their manager's last 
-- name and manager number (including the employees who have no manager).

select e1.last_name as employee_name,e1.employee_id as employee_number,
e2.last_name as manager_name,e2.manager_id as manager_number
from employees e1
left join employees e2
on e1.manager_id = e2.manager_id;

-- 8. Create a query that displays employees last name,department number,and all the 
-- employees who work in the same department as a given employee

 

select e.last_name,e.department_id,m.last_name
from employees e
join employees m
on e.department_id = m.department_id
where e.employee_id=101 and e.employee_id <>m.employee_id;




-- 9. Create a query that displays the name,job,department name,salary,grade for all 
-- employees.  Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)   

select e.first_name,d.department_name,e.salary,j.job_id,
case
when salary >=5000 then 'a'
when salary >=3000 then 'b' 
else 'c'
end as grades
from employees e
join departments d
on e.department_id = d.department_id
join job_history j
on d.department_id = j.department_id;

-- 10. Display the names and hire date for all employees who were hired before their 
-- managers along withe their manager names and hire date. Label the columns as Employee 
-- name, emp_hire_date,manager name,man_hire_date



select e.first_name as employee_name,e.hire_date as emp_hire_date,
m.first_name as manager_name,m.hire_date as man_hire_date
from employees e
join employees m
on e.manager_id = m.employee_id 
where e.hire_date > m.hire_date;



-- --------------------------------------------------------------Q-6---------------------------------------------------------------------------------------------------




-- 1. Write a query to display the last name and hire date of any employee in the same 
-- department as SALES.   

select e.last_name,e.hire_date,d.department_name
from employees e
join departments d
on e.department_id = d.department_id
where d.department_name = 'sales';

-- 2. Create a query to display the employee numbers and last names of all employees who 
-- earn more than the average salary. Sort the results in ascending order of salary.

select employee_id,last_name ,salary
from employees 
where salary> 
(select avg(salary) from employees);


select avg(salary) from employees;


-- 3. Write a query that displays the employee numbers and last names of all employees who 
-- work in a department with any employee whose last name contains a' u   

select employee_id,last_name,department_id
from employees 
where last_name like'%a%' or 
last_name like '%u%';


-- 4. Display the last name, department number, and job ID of all employees whose 
-- department location is ATLANTA.

select e.last_name,e.department_id,e.job_id
from employees e
join departments d
on e.department_id = d.department_id 
join  locations l
on d.location_id = l.location_id
where l.city = 'atlanata';

select * from locations;
select * from departments;

-- 5. Display the last name and salary of every employee who reports to FILLMORE.


select last_name,salary
from employees 
where manager_id =
(select manager_id 
from employees
where first_name = 'neena');
use hr;

-- 6. Display the department number, last name, and job ID for every employee in the 
-- OPERATIONS department


select department_id,last_name,job_id
from employees 
where department_id = 
(select department_id from departments 
where department_name = 'operation');

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all 
-- employees who earn more than the average salary and who work in a department with any 
-- employee with a 'u'in their name

select employee_id,last_name,salary
from employees 
where salary >
 (select avg(salary) from employees ) and
last_name like '%u%';

--  8. Display the names of all employees whose job title is the same as anyone in the sales 
-- dept.

select first_name
from employees 
where  department_id = 
(select department_id from departments
where department_name = 'sales');


-- 9. Write a compound query to produce a list of employees showing raise percentages, 
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
-- given a 15% raise, and employees in department 6 are not given a raise.   

select employee_id,salary,department_id,
case
when department_id in (1,3) then 0.05
when department_id = 2 then  0.10
when department_id in (4,5) then 0.15
else 0.00
end as commission
from employees;



-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
-- names and salaries.  

select LAST_NAME,salary 
from employees
order by salary desc
limit 3;

-- 11. Display the names of all employees with their salary and commission earned. Employees 
-- with a null commission should have O in the commission column  

select first_name,salary,
case
when commission_pct is null then 0
else commission_pct
end as commission
from employees;

-- 12. Display the Managers (name) with top three salaries along with their salaries and 
-- department information from employee

select concat(first_name, ' ',last_name) as manager_name,salary,department_id,manager_id
from employees
where employee_id in
(select manager_id from employees
order by salary desc) limit 3;

-- -----------------------------------------------------------------q3 string-function -------------------------------------------------------------------------------------------------

-- 1. Write a query that displays the employee's last names only from the string's 2-5th 
-- position with the first letter capitalized and all other letters lowercase, Give each column an 
-- appropriate label.;

select concat(upper(substring(last_name,2,1)),substring(last_name,3,3)) ,last_name from employees;

-- 2. Write a query that displays the employee's first name and last name along with a " in 
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
-- month on which the employee has joined.


select concat(first_name, ' -',last_name) as full_name,
month(hire_date) as join_month
from employees
where first_name like '%a%'
and last_name like '%a%';




-- 3. Write a query to display the employee's last name and if half of the salary is greater than 
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
-- 1500 each. Provide each column an appropriate label.  


select last_name ,
case
when salary > 10000 then salary*(1+0.10)
else salary*(1+0.115)
end as new_salary,
1500 as bonus
from employees;


-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
-- department id, salary and the manager name all in Upper case, if the Manager name 
-- consists of 'z' replace it with '$!  



select concat(substring(employee_id,1,2),"00",substring(employee_id,3),
"e"),
department_id,salary,replace(upper(first_name),"Z","$")
from employees;


use hr;


-- 5. Write a query that displays the employee's last names with the first letter capitalized and 
-- all other letters lowercase, and the length of the names, for all employees whose name 
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
-- employees' last names  


select concat(substring(upper(last_name),1,1),substring(lower(last_name),2)),length(last_name)
from employees
where first_name like 'j%' or
first_name like 'a%' or
first_name like 'n%'
order by last_name;

-- 6. Create a query to display the last name and salary for all employees. Format the salary to 
-- be 15 characters long, left-padded with $. Label the column SALARY   


select last_name,lpad(format(salary,2),15 , "$")
from employees;



-- 7. Display the employee's name if it is a palindrome  


select  first_name
from employees
where reverse(first_name)= first_name;


 -- 8.Display First names of all employees with initcaps.
 
 select concat(substring(upper(first_name),1,1),substring(lower(first_name),2)) from employees;
 
 
 
--  9. From LOCATIONS table, extract the word between first and second space from the 
-- STREET ADDRESS column

select substring(street_address,1,2) from locations;


SELECT substring_index(substring_index(street_address, " ",2)," ",-1) as address from locations;


   
   
-- 10. Extract first letter from First Name column and append it with the Last Name. Also add 
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should 
-- be in lower case. Display this along with their First Name.  



select concat(substring(lower(first_name),1,1),lower(last_name),
"@systechusa.com") as 'e-mail address',lower(first_name)
from employees;


-- 11. Display the names and job titles of all employees with the same job as Trenna. 


select e.first_name,j.job_title
from employees e
join jobs j
on e.job_id = j.job_id
where j.job_id =
(select job_id
from employees
where first_name = 'trenna');

-- 12. Display the names and department name of all employees working in the same city as 
-- Trenna.  


select e.first_name,d.department_name
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where l.location_id in
(select location_id from departments 
where  department_id in
(select department_id
from employees
where first_name = 'trenna'));


-- 13. Display the name of the employee whose salary is the lowest.  


select first_name,salary
from employees
where salary =
(select min(salary)
from employees);

-- 14. Display the names of all employees except the lowest paid. 

select first_name
from employees
where salary <>
(select min(salary)
from employees);

-- -----------------------------------------------------------------q7 date -------------------------------------------------------------------------------------------------

-- 1) Find the date difference between the hire date and resignation_date for all the 
-- employees. Display in no. of days, months and year(1 year 3 months 5 days). 
-- Emp_ID Hire Date Resignation_Date 
-- 1   1/1/2000 7/10/2013 
-- 2  4/12/2003 3/8/2017 
-- 3  22/9/2012 21/6/2015 
-- 4  13/4/2015 NULL 
-- 5  03/06/2016 NULL 
-- 6  08/08/2017 NULL 
-- 7  13/11/2016 NULL   


select employee_id,start_date,end_date,
timestampdiff(day,start_date,end_date) as total_days,
floor(timestampdiff (day,start_date,end_date)/365) as total_year,
floor(timestampdiff(day,start_date,end_date)%  365/30) as total_month,
floor(timestampdiff(day,start_date,end_date)% 365%30) as total_days
from  job_history;



-- 2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, 
-- yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)   


 select date_format(start_date,'%m/%d/%Y'),
 case
 when end_date is not null  then date_format(end_date,'%M %d, %y')
 else 'DEC, 01th 1900'
 end as date_formate
 from job_history;
 
 
 
 -- 3) Calcuate experience of the employee till date in Years and months(example 1 year and 3 
-- months)  
 
 
 select start_date,end_date,employee_id,
 timestampdiff(year,start_date,now()) as tot_year ,
 floor(timestampdiff(month,start_date,now()) % 365/30) as total_mon_exp
 from job_history;
 
 use hr;
 
 -- 4) Display the count of days in the previous quarter  
 
 
 SELECT DATEDIFF(
    last_day(DATE_SUB(CURDATE(), INTERVAL QUARTER(CURDATE()) QUARTER)),
    DATE_ADD(LAST_DAY(DATE_SUB(CURDATE(), INTERVAL (QUARTER(CURDATE()) + 1) QUARTER)), INTERVAL 1 DAY)
) + 1 AS days_in_previous_quarter;

--  5.Fetch the previous Quarter's second week's first day's date

SELECT DATE_ADD(
    DATE_SUB(LAST_DAY(DATE_SUB(CURDATE(), INTERVAL QUARTER(CURDATE()) QUARTER)), INTERVAL 1 MONTH), 
    INTERVAL 7 DAY
) AS first_day_second_week_previous_quarter;


 

 -- 6.Fetch the financial year's 15th week's dates (Format: Mon DD YYYY) 
 
 
SELECT 
    DATE_FORMAT(DATE_ADD(financial_year_start, INTERVAL (15 - 1) * 7 DAY), '%a %d %Y') AS start_of_15th_week,
    DATE_FORMAT(DATE_ADD(financial_year_start, INTERVAL 15 * 7 - 1 DAY), '%a %d %Y') AS end_of_15th_week
FROM (
    SELECT IF(MONTH(CURDATE()) >= 4, 
               MAKEDATE(YEAR(CURDATE()), 91),  
               MAKEDATE(YEAR(CURDATE()) - 1, 91)) AS financial_year_start  
) AS financial_year;





-- 7) Find out the date that corresponds to the last Saturday of January, 2015 using with clause. 

with january_2015 as(
select '2015-01-31' as last_day_january
)
select
      date_sub(last_day_january, interval weekday(last_day_january) +1 day) as last_saturday
      from january_2015;