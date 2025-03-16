create database HR_analysis;
-- Return record where salary greater than 60,000;
select LastName,FirstName,salary from hr_data
where salary > 60000;

-- Return record where salary less than 8,000;
select LastName,FirstName,DepartmentID,Salary from hr_data
where salary < 80000;

-- return records where last name is chan;
select LastName,FirstName,DepartmentID from hr_data
where LastName = "chan";

-- return lastname,firstname,deptid of emp who work in either dep 60 or 100
select LastName,FirstName,DepartmentID from hr_data
where DepartmentID = 6 or DepartmentID = 10;

select * from hr_data;
/*return last&firstname alias fullname, deptid, salary, dateofhire of
emp. whose firstname does not contain d letter v" in it. deptid in asc oorder*/
select concat(LastName,FirstName) as FullName,DepartmentID,Salary,DateofHire from hr_data
where FirstName not like '%V%'
order by DepartmentID;

-- return last&firstname alias fullname,salary of emp who do not earn commission.
select concat(LastName,FirstName) as FullName,Salary from hr_data
where commission is NULL;

-- return last&firstname alias fullname,salary,mobileno. where sal. btwn 17000 & 9000
select concat(LastName,FirstName) as FullName,Salary,MobileNo from hr_data
where salary between 17000 and 9000;

-- return emp firstname,salary that ends with t;
select FirstName,LastName,Salary from hr_data
where FirstName like "%t";

select concat(FirstName,LastName) as FullName,Salary from hr_data
where Salary not between 7000 and 15000
order by FullName;

-- return FirstName,LastName,Manager,Salary record that ends with y
select FirstName,LastName,Manager,Salary from hr_data
where lastname like "%y";

-- return records that starts with c and ends with y
select * from hr_data where LastName like "c%y";

-- return record that has ar within the name;
select * from hr_data where LastName like "%ar%";

-- return record in which a is the second position;
select * from hr_data where FirstName like "_a%";

-- return value that starts with a and end with at least 3 characters;
select * from hr_data where FirstName like "a___%";


-- write all record where performancescore is exceeds;
select * from hr_data
where PerformanceScore = "Exceeds";
/* return all the records where sex equals female and 
their marital is married*/
select * from hr_data 
where sex = "female" and maritalDesc = "Married";

select lastname,FirstName,manager from hr_data
where sex = "female" and maritalDesc = "single"
and employmentstatus = "active";

select * from hr_data 
where sex = "female" or maritalDesc = "Married";

select * from hr_data where not sex = "male";
select * from hr_data where not sex = "female";

select * from hr_data where PerformanceScore
in("Exceeds","Fully Meets", "needs improvement");

