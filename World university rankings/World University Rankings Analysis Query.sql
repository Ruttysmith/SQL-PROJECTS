CREATE DATABASE World_University_Ranking_Analysis;
use World_University_Ranking_Analysis;

-- import table
select * from uni_rankings2024;

/* Data Exploration Using SQL
Explore the structure of the dataset using basic SQL queries 
(e.g., SELECT, COUNT(), GROUP BY, etc.).*/

-- View the structure of the table
describe uni_rankings2024;

-- Check the total number of record
SELECT count(*) from uni_rankings2024;

-- 3. Analysis Questions
-- i. Top Universities by Overall Score
create view Top10_uni as
select university, overall from uni_rankings2024
order by Overall desc
limit 10;

select * from top10_uni;

-- ii. Top Countries by Research Performance
create view Top10_countryR as
select country, avg(research) as avg_research_score 
from uni_rankings2024
group by country
order by avg_research_score desc
limit 10;

select * from Top10_countryR;

# iii. Impact of International Outlook on Rankings
select university,`rank`,`international outlook` 
from uni_rankings2024
where `international outlook` > 90;

select * from uni_rankings2024;

select university,max(teaching) from uni_rankings2024
group by university order by max(teaching) desc
limit 1;

# iv. Correlation Between Industry Income and Rankings
select university, `rank`, `industry income` 
from uni_rankings2024
where `Industry Income` > 90;

/* 5. Conclusion and Insights
From the SQL queries, we can derive the following insights:
•	Top Universities:
The top 10 universities by overall score typically belong to countries with strong research and teaching performances.
•	Research Performance:
Countries such as the US and the UK tend to dominate research performance metrics, correlating with their high university rankings.
•	International Outlook Influence:
A high international outlook score generally correlates with better university rankings, though some universities may rank highly with moderate outlook scores due to strong research or teaching metrics.
•	Industry Income:
High industry income can be found among top universities, but it is not always a decisive factor in overall ranking compared to research and citations.
*/

