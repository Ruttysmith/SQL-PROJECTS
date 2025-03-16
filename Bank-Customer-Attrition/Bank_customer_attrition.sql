# BANK CUSTOMER ATTRITION INSIGHTS;

CREATE DATABASE bank_customer_attrition_insights;
USE bank_customer_attrition_insights;

-- SELECT: Rtrieve all customer details
/*The SELECT statement is used to retrieve data from a database. 
It allows you to specify the columns you want to retrieve.*/

select * from customer_attrition;

-- 2. Retrieve only customerid, Surname, and balance.
select customerId, Surname, Balance from customer_attrition;

-- Distinct
-- 3. Retrieve unique country names.
select distinct geography from customer_attrition;

-- Where Clause & Logical functions
select * from customer_attrition;

-- 4. Return att records where age is greater than 50
select * from customer_attrition where age > 50;

-- 5. Filter customer from France who have exited;
select * from customer_attrition where Geography = "France" and Exited = 1;

-- 6. Return all records where balance is between 50000 and 100000;
select * from customer_attrition where Balance between 50000 and 100000;

-- 7. Return all records where creditscore is greater than 800 or balance is greater 100000;
select * from customer_attrition where CreditScore > 800 or Balance > 100000;

-- Group By
-- 8. Count customers by country
select Geography, count(*) as customercount from customer_attrition
Group By Geography;

-- 9. Count customer by tenure
select tenure, count(*) from customer_attrition 
group by tenure
order by count(*) desc;

-- HAVING
-- 10. Countries with more than 3000 customers;
select geography, count(*) as customercount from customer_attrition
group by geography
having count(*) > 3000;

-- LIMIT 
-- 11. Retrieve the top 5 highest credit score customers
select * from customer_attrition order by creditscore desc limit 5;

-- 12. Top 3 highest balance.
select * from customer_attrition order by balance desc limit 3; 

-- 13. Top 10 oldest customer.
select * from customer_attrition order by age desc limit 10;

-- LIKE
-- 14. Find customer whose surname starts with JO;
select * from customer_attrition where surname like "jo%";

-- 15. Find customer whose surname ends with SON;
select * from customer_attrition where surname like "%son";

-- 16.  Find customer whose surname contains with AN;
select * from customer_attrition where surname like "%an%";

-- Aggregate funtions
-- 17. Retrieve the avg, max, min, sum,count balance from the dataset;
select avg(balance) from customer_attrition;
select max(balance) from customer_attrition;
select min(balance) from customer_attrition;
select sum(balance) from customer_attrition;
select count(balance) from customer_attrition;

-- CASE
-- 18. Categorize customers based on satisfaction score
select customerid, satisfaction_score, 
case
when satisfaction_score >= 4 then "High"
when satisfaction_score = 3 then "Medium"
else "low"
end as satisfaction_level
from customer_attrition;

-- 19. Classifying customer based on credit score
select customerid, creditscore,
case
when creditscore >= 750 then "Excellent"
when creditscore >= 600 then "Good"
else "poor"
end as credit_category from customer_attrition
limit 10;

-- 20. Increase balance by 10% for active members (Assuming balance is mutable);
update customer_attrition 
set balance = balance *1.1 
where isactivemember = 1;

select * from customer_attrition;

update customer_attrition 
set surname = "Smith" 
where  Rownumber=36;
select * from customer_attrition;

 
