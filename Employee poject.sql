create database employee_data;
-- Return complete information about the employees;
select * from employee;  

-- Write a SQL query to find the salaries of all employees. Return salary;
select salary from employee; 

/*Write a SQL query to find the unique designations 
of the employees. Return job name*/
select distinct job_name from employee;

/*Write a SQL query to list the employees’ name, increased their 
salary by 15%, and expressed as number of dollars*/
select emp_name,concat("$",Salary) from employee
where (Salary*1.15);

-- Write a SQL query to list the employee's name and job name as a format of "employee & job";
select concat(emp_name, " ",job_name) as employee_job
from employee;

-- Write a query in SQL to produce the output of employees as follows.Go to the editor employee Jonas(manager);
select concat(emp_name," ","(",job_name,")") as employee from employee;

/*Write a SQL query to find those employees with hire date in the format like february 22, 1991.
 Return employee id, employee name, salary, hire date*/
select emp_id,emp_name,salary, hire_date, date_format(hire_date,"%M %d %Y") from employee;

-- Write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length;
select char_length(emp_name) as employee_name_length from employee;

-- Write a SQL query to find the employee id, salary, and commission of all the employees;
select emp_id, salary, commission from employee;

--	Write a SQL query to find the unique department with jobs. Return department id, job name;
select distinct dep_id,job_name from employee;

-- Write a SQL query to find those employees who do not belong to the department 2001. Return complete information about the employees;
   select * from employee
   where dep_id <> 2001;
   select * from employee
   where dep_id not in (2001);
   
   -- Write a SQL query to find those employees who joined before 1991. Return complete information about the employees;
   select * from employee
   where hire_date < 1991;
   
--	Write a SQL query to compute the average salary of those employees who work as ‘analyst’. Return average salary;
select avg(salary) from employee
where job_name = "ANALYST";
  
  -- Write a SQL query to find the details of the employee ‘blaze’;
select * FROM employee
where emp_name = "blaze";

-- Write a SQL query to find those employees whose commission is more than their salary. Return complete information about the employees;
select * from employee
where commission > salary;

-- Write a SQL query to find those employees whose salary exceeds 3000 after giving 25% increment. Return complete information about the employees;
select * from employee
where (salary*1.25) > 3000;

-- Write a SQL query to find the names of the employees whose length is six. Return employee name;
select emp_name from employee
where length(emp_name) = 6;

-- Write a SQL query to find those employees who joined in the month January. Return complete information about the employees;
select * from employee
where extract(month from hire_date) =1;

--	Write a SQL query to find those employees who joined in the month December. Return complete information about the employees;
select * from employee
where extract(month from hire_date) = 12;

-- Write a SQL query to find the name of employees and their manager separated by the string 'works for';
select emp_name, concat("works for"),manager_id
from employee;------------;


-- 21 Write a SQL query to find those employees whose designation is ‘clerk’. Return complete information about the employees;
select * from employee
where job_name = "clerk";

-- 22 Write a SQL query to find those employees whose experience is more than 27 years. Return complete information about the employees;
select * from employee
where hire_date >("1995-02-23");

-- 23 Write a SQL query to find those employees whose salaries are less than 3500. Return complete information about the employees;
select * from employee
where salary < 3500;

-- 24 Write a SQL query to find the employee whose designation is ‘analyst’. Return employee name, job name and salary;
select emp_name,job_name, salary from employee
where job_name = "analyst";

-- 25 Write a SQL query to find those employees who have joined in the year 1991.return complete information about the employees;
select * from employee
where hire_date = 1991;

