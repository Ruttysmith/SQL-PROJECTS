-- PROJECT ON SUPERMARKET DATASET

CREATE DATABASE SUPERMARKETDATA;

-- check the structure of the table
DESCRIBE sales;

-- Get a quick look at how the dataset looks
SELECT * FROM sales
LIMIT 10;

-- convert Date(from m-d-y to sql date);
UPDATE sales
SET Date = STR_TO_DATE(Date, '%m/%d/%Y');

-- change date column;
alter table sales
change date date DATE;

-- Change time column to time type;
alter table sales
MODIFY time TIME;
-- FIX NUMERIC COLUMNS
ALTER TABLE sales
MODIFY Unit_price DECIMAL(10,2),
MODIFY Total DECIMAL(10,2),
MODIFY cogs DECIMAL(10,2),
MODIFY gross_income DECIMAL(10,2),
MODIFY Rating DECIMAL(3,1);

-- count of  total rows
select count(*) AS total_rows
from sales;

-- check for duplicate
select Invoice_ID, count(*) AS duplicate_count
from sales
group by Invoice_ID
having count(*) > 1;

-- check for null/ missing values
select 
sum(case when invoice_id is null then 1 else 0 end) as missing_invoice,
sum(case when Gender is null then 1 else 0 end) as missing_gender,
sum(case when Rating is null then 1 else 0 end) as missing_rating
from sales;

-- check for valid values
select distinct gender from sales;
select distinct customer_type from sales;
select distinct payment from sales;

-- Toal customers from dataset;
select count(*) AS total_rows
from sales;

SELECT Invoice_ID, COUNT(*) AS TOTAL_CUSTOMER
FROM SALES
GROUP BY Invoice_ID;

-- Total females;
SELECT COUNT(*) AS TOTAL_FEMALE
FROM sales
WHERE GENDER = "FEMALE"; 

-- TOTAL MALE;
SELECT COUNT(*) AS TOTAL_MALE
FROM SALES
WHERE GENDER = "MALE";

SELECT GENDER, COUNT(*) AS TOTAL_GENDER
FROM SALES
group by GENDER;

-- MIN RATING;
SELECT MIN(RATING) AS MIN_RATING
FROM SALES;

-- MAX RATING;
SELECT MAX(RATING) AS MAX_RATING
FROM SALES;

-- AVERAGE RATING;
SELECT ROUND(AVG(RATING),3) AS AVG_RATING
FROM SALES;

-- WHICH PRODUCT LINE HAS THE HIGHEST RATING?
SELECT PRODUCT_LINE, AVG(RATING) AS AVG_RATING
FROM SALES
GROUP BY PRODUCT_LINE
order by AVG_RATING DESC
LIMIT 1;


SELECT PRODUCT_LINE, MIN(RATING) AS MIN_RATING
FROM SALES
GROUP BY PRODUCT_LINE
order by MIN_RATING
LIMIT 1;

SELECT PRODUCT_LINE, MAX(RATING) AS MAX_RATING
FROM SALES
GROUP BY PRODUCT_LINE
order by MAX_RATING DESC
LIMIT 1;


--  Which product line has the highest sales?

select product_line, sum(total) as highest_sales
from sales
group by Product_line
order by highest_sales desc
limit 1;

-- Do Product_line for maximum and minimum rating as well.
select product_line, sum(total) as total_sales, 
max(rating) as max_rating
from sales
group by product_line
order by total_sales desc
limit 1;

select product_line, sum(total) as total_sales, 
min(rating) as min_rating
from sales
group by product_line
order by total_sales 
limit 1;

select * from sales;

-- write a query to show customers from 'Yangon'
select Customer_type, city
from sales
where city = "Yangon"
group by Customer_type;

-- write a query to get the revenue by product line
select Product_line, sum(Total) as revenue 
from sales
group by Product_line
order by revenue desc;

-- Which city generates the highest revenue?
SELECT City, SUM(Total) AS Revenue
FROM sales
GROUP BY City
ORDER BY Revenue DESC
LIMIT 1;

-- Do males or females spend more on average?
SELECT Gender, AVG(Total) AS Avg_Spend
FROM sales
GROUP BY Gender;

-- What’s the top-selling product line?
SELECT Product_line, SUM(Quantity) AS Total_Sold
FROM sales
GROUP BY Product_line
ORDER BY Total_Sold DESC
LIMIT 1;

-- Who spends more: Members or Normal customers?
SELECT Customer_type, AVG(Total) AS Avg_Spend
FROM sales
GROUP BY Customer_type;

-- Which branch has the highest average rating?
SELECT Branch, AVG(Rating) AS Avg_Rating
FROM sales
GROUP BY Branch
ORDER BY Avg_Rating DESC
LIMIT 1;

-- What day of the week generates the most sales?
SELECT weekday(Date) AS DayOfWeek, SUM(Total) AS Revenue
FROM sales
GROUP BY DayOfWeek
ORDER BY Revenue DESC
LIMIT 1;

select * from sales;

-- Which payment method is most popular?
SELECT Payment, COUNT(*) AS Count
FROM sales
GROUP BY Payment
ORDER BY Count DESC
LIMIT 1;

-- SUMMARY;
/*From Messy Data to Meaningful Insights – The Final Analysis
Uncovering Business Insights with Data Analytics

In today’s competitive market, businesses don’t just need data — 
they need answers. That’s exactly what this project delivers.
Using a rich dataset from a retail store, I explored customer behavior,
sales performance, and product trends to uncover actionable
insights that decision-makers can rely on.

I cleaned this dataset by (removing duplicates, fixing missing values, 
and making sure everything was ready for analysis). 
It was the hard but necessary first step.

Detailed breakdown of Data Cleaning Process;

Invoice ID field was Kept as TEXT (since it’s alphanumeric, not a number).
Branch, City, Customer type, Gender, Product line, Payment
These are categorical fields → TEXT is fine.
(Optionally, you can normalize into separate lookup tables if teaching database design, but not required for analysis.)
Quantity was already INT.
Unit price, Tax 5%, Total, cogs, gross income
DOUBLE is okay, but i changed it to 
DECIMAL(10,2) for money values to avoid floating-point errors.
Date and time datatype was in TEXT. 
I changed it to DATE and TIME respectively.

I finally moved to the fun part: analyzing the cleaned data.

With the queries we ran, we were able to:
Extract key trends
Summarize useful metrics
Turn raw numbers into insights that actually tell a story

Here’s what the analysis revealed:;
Top City by Revenue: Naypyitaw leads with 110,568.86, 
showing strong purchasing power,highlighting location-based
sales opportunities..

Who spends more? On average, Females (335.10) 
spend slightly higher than Males (310.79).
a key factor for targeted marketing.

Top-Selling Product Line: Electronic Accessories with 971 units sold.
a strong product category driving sales volume.

Customer Type: Members spend more (327.79) than 
Non-members (318.12)—highlighting loyalty’s impact.

Branch Ratings: Branch C takes the lead with an average rating of 7.07.
a customer experience win.

Best Day for Sales: Day 5 generated the highest sales (56,120.86)—
potential for targeted promotions and vital for 
inventory and staffing optimization..

Most Popular Payment Method: E-wallet (345 transactions).
showing a clear shift toward digital adoption.

Highest Rated Product Line: Food & Beverages (7.11).

Product Line Revenue Leader: Food & Beverages with 56,144.96.
Food and Beverages not only had the highest sales (56,144.96) but also 
the highest rating (7.11) —proving customer love translates into revenue.

Revenue by Product Line

Food & Beverages – 56,144.96

Sports & Travel – 55,123.00

Electronic Accessories – 54,337.64

Fashion Accessories – 54,306.03

Home & Lifestyle – 53,861.96

Health & Beauty – 49,193.84

Why this matters:
This analysis doesn’t just crunch numbers—it tells a story of customer 
behavior, brand loyalty, and business opportunities. 
For learners, it’s a great example of how to move from raw 
data → insights → actionable strategies. And also,This is proof that even
a single dataset can reveal countless insights when you ask the right questions. 
For recruiters and businesses, This reflects my ability to not just analyze
data, but also tell the story behind it in a way that influences
business decisions to answer key questions like:

Which products deserve more marketing spend?

When should promotions run?

How can loyalty programs be optimized?

Next Steps:
I’ll keep building similar end-to-end projects—covering data wrangling, 
visualization, and storytelling—so that learners can practice along, 
and organizations can see how data-driven strategies improve decisions.

Data isn’t just numbers. It’s the voice of your customers, your products,
and your business — if you know how to listen.

And that’s the beauty of the process—data cleaning sets the stage, 
but analysis reveals the value.*/ 


