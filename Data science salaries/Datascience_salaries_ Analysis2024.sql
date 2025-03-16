CREATE DATABASE DataScience_Salaries_2024;

-- import table
use datascience_salaries2024;
-- Displaying the table data
select* from datascience_salaries2024;
-- view the structure of the table
describe datascience_salaries2024;
-- Total number of records in the dataset
select count(*) from datascience_salaries2024;

-- Data overview and exploration
-- Qstn 1: Retrieve the first 10 rows of the dataset.
select * from datascience_salaries2024
limit 10;

-- Qstn 2: Retrieve a list of distinct job_title values.
select distinct job_title from datascience_salaries2024;

/* Qstn 3: Count how many unique employee locations (employee_residence) 
are present in the dataset*/
select distinct employee_residence, company_location from datascience_salaries2024;

-- Salary Analysis by Job title and country
/* Qstn 4: Retrieve the job title and average salary for each job title,
 ordered from highest to lowest.*/
 select job_title, AVG(salary) as Average_salary from datascience_salaries2024
 group by job_title
 order by Average_salary desc;
 
-- Qstn 5: Get the top 5 highest paying job titles.
select max(salary) as maximum_salary, job_title from datascience_salaries2024
group by job_title
order by maximum_salary
limit 5;

/* Qstn 6: Calculate the average salary for employees in different
 countries (company_location), filtering
only countries with at least 10 employees.*/
select avg(salary) as Average_salary, company_location from datascience_salaries2024;

-- Experience level and Remote work impact
-- Qstn 7: Calculate the average salary based on the experience_level of employees.
select avg(salary) as average_salary, experience_level from datascience_salaries2024
group by experience_level
order by average_salary;

select * from datascience_salaries2024;

-- Qstn 8: Find the average salary for employees who work fully remotely (remote_ratio = 100).
select job_title,avg(salary) as average_salary,employment_type,remote_ratio
from datascience_salaries2024
where employment_type = "PT" AND remote_ratio = 100
group by job_title
order by average_salary;

/* Qstn 9: Compare the average salary of employees who work fully remotely versus those 
who don’t (remote ratio less than 100).*/
select job_title,avg(salary) as average_salary,employment_type, remote_ratio 
from datascience_salaries2024 
where remote_ratio > 100 AND remote_ratio < 100
group by job_title 
order by average_salary desc;

-- Salary Trends Over Time
-- Qstn 10: Find the number of employees hired per year, grouped by experience_level.
select experience_level, count(job_title) as number_of_emp, work_year
from datascience_salaries2024
group by experience_level
order by work_year;


-- Qstn 11: Get the highest, lowest, and average salary for each year.
select max(salary) as maximum_salary, min(salary) as minimum_salary,
avg(salary) as average_salary, work_year from datascience_salaries2024
group by work_year;

select * from datascience_salaries2024;
-- Filtering and Logical Operators
-- Qstn 12:Retrieve the details of employees who live in the US and earn more than $150,000.
select job_title, employee_residence, salary from datascience_salaries2024
where employee_residence = "US" AND salary > 150000;

-- Qstn 13: Find all employees who work in Germany or have a salary below $80,000.
select job_title, employee_residence, salary from datascience_salaries2024
where employee_residence = "GB" AND salary < 80000;

-- Qstn 14: Retrieve employees who either work remotely or have an experience level of SE (Senior).
select  job_title, employment_type, experience_level
from datascience_salaries2024
where employment_type = "PT" OR experience_level = "SE";

-- Updating Records
-- Qstn 15:Increase the salary by 10% for all employees who have the job title 'Data Scientist'.
update datascience_salaries2024
set salary= salary * 1.10
where job_title = `Data Scientist`;

/*Qstn 16: Change the job_title to 'Senior Data Analyst' for employees with more than 10 years 
of experience (experience_level = 'SE').*/
update datascience_salaries2024
set job_title = `senoir Data Analyst`
where experience_level = "SE";

/* Insight Presentation
According to the wage trend in the dataset, the highest income was 30,400,000 in the work year 2021 and the highest average salary was 559350.9908. 
These salaries sharply decreased until the work year 2024, when they were 3,300,000 and 152216.5892, respectively.
The minimum wage for the 2020 work year is $14,000. With a remote ratio of 100, the employee with the title "Data scientist" 
who works entirely remotely earns the highest average compensation. 
The highest average wage, 209271.7778, is earned by the employee with the most experience.*/

/* Here are insights derived from the Dataset:

1. **Significant Decrease in Wages Over Time**:
   - The highest income and average salaries showed a sharp decline from 2021 to 2024. 
   - The highest individual income dropped from **30,400,000** in 2021 to **3,300,000** in 2024, an **89% reduction**.
   - The average salary decreased from **559,350.9908** in 2021 to **152,216.5892** in 2024, a **73% decrease**.

2. **Historical Wage Baseline**:
   - The minimum wage recorded in 2020 was **$14,000**, which may represent the lower threshold for compensation in the dataset.

3. **Remote Work and Compensation**:
   - Employees working remotely (remote ratio of 100) tend to earn higher compensation, with the title "Data Scientist" specifically standing out as having the **highest average compensation** in this category.

4. **Experience and Earnings**:
   - Compensation positively correlates with experience, as the **highest average wage of 209,271.7778** is earned by the most experienced employee.

### Possible Conclusions:
- The decline in wages over the years might reflect economic factors such as market saturation, economic downturns, or changes in industry demand.
- Remote work offers competitive compensation, possibly due to cost savings for employers or the value placed on niche roles like "Data Scientist."
- Experience remains a significant factor influencing wage levels, emphasizing the value of expertise in the job market. */

