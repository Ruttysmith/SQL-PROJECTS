create database Student_Performance;
select * from studentsperformance;
-- TO RENAME A COLUMN--
alter table studentsperformance change `parental level of education` Parental_level_of_education varchar(100);
select Parental_level_of_education from studentsperformance;
alter table studentsperformance change `test preparation course` test_preparation_course varchar(100);
alter table studentsperformance change `math score` math_score char(100);
alter table studentsperformance change `reading score` reading_score char(100);
alter table studentsperformance change `writing score` writing_score char(100);
-- I returned all records from studentperformance tables--
select * from studentsperformance;
-- I returned gender and all scores from the studentperformance tables--
select gender, math_score, reading_score,writing_score
from studentsperformance;
-- I returned all records where gender equals male--
select * from studentsperformance
where gender = "male";
/*I returned parental level of education,maths_score,reading_score and writing_score where 
math_score is greater than 90 */
select Parental_level_of_education, math_score,reading_score,writing_score from studentsperformance
where math_score > 90 ;
/*I returned parental level of education,maths_score,reading_score and writing_score where 
math_score equals to 100 */
select Parental_level_of_education, math_score,reading_score,writing_score from studentsperformance
where math_score = 100 ;
-- I returned all record where parental level of eduction not bachelor degree --
select * from studentsperformance
where Parental_level_of_education <> "bachelor's degree";
-- I returned race/ethnicity, math_score where maths_score is greateer than or equals to 70 --
select `race/ethnicity`, math_score from studentsperformance
where math_score >= 70 ;
-- I returned gender, lunch,test preparation course, and all scores where lunch = standard --
select gender, lunch, test_preparation_course, math_score, reading_score, writing_score from studentsperformance
where lunch = "standard" ;
-- I returned all records where all female have completed their courses using And operator--
select * from studentsperformance
where gender = "female" AND test_preparation_course = "completed";
/*I RETURNED ALL RECORDS WHERE parental level of education equals some clloege
 and gender equals male and test prep. equals completed using AND operator */
select * from studentsperformance
where parental_level_of_education = "some college" AND gender = "male" AND test_preparation_course = "completed";
/*I RETURNED ALL RECORDS WHERE parental level of education equals some college
 or gender equals male or test prep. equals completed using OR operator*/
select * from studentsperformance
where parental_level_of_education = "some college" OR gender = "male" OR test_preparation_course = "completed";
-- I returned some college and high school in parental level of education column using IN operator --
select * from studentsperformance
where parental_level_of_education IN("some college","high school");
-- I returned the total score for math,reading and writng --
SELECT sum(math_score), sum(reading_score), sum(writing_score)
 from studentsperformance;
 -- I returned the minimum score for math,reading and writing  --
 select min(math_score), min(reading_score), min(writing_score)
 from studentsperformance;
 -- I returned all information where math score equals zero --
 select * from studentsperformance
 where math_score = 0;
 -- I returned the maximum score for math,reading and writing  --
 select max(math_score), max(reading_score), max(writing_score)
 from studentsperformance; 