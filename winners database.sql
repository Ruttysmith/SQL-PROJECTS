create database winners;
-- I returned all records --
select * from nobel_win;
-- I wrote an sql query to returned year,subject, and winner from nobel_win;
select year, subject, winner 
from nobel_win;
-- I wrote an sql query to update all the physics to computer_science;
update nobel_win
set subject = "computer_science"
where subject = "Physics";
select * from nobel_win;
-- I wrote a query to return all result where subject equals compter science;
select * from nobel_win
where subject = "computer_science"; 
-- I wrote an sql query to update subject=computer science and country= france;
update nobel_win
set subject = "Physics" , country = "Nigeria"
where subject = "computer_science" and COUNTRY = "France";
select * from nobel_win where subject = "physics" and country = "Nigeria"; 
/* I returned all records where year equals 1970,subject equals physics
 using the AND operator; */
select * from nobel_win
where year = 1970 and subject = "physics";
/* I returned subject,winner and country
 WHERE year=1970,subject=chemistry and country =france;*/
select subject,winner,country from nobel_win
where year = 1970 and subject = "chemistry" and country= "france";
