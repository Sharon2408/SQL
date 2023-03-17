-- TO USE THE DATABASE 
use Firstdatabase

-- CREATING A SCHEMA
CREATE SCHEMA FIRSTDATABASE_SCHEMA

--CREATING A TABLE NAMED Employee 
create table task2.Employee3
(
Emp_ID int PRIMARY KEY ,
Emp_NAME VARCHAR(20) UNIQUE,
Emp_AGE INT CHECK(Emp_AGE > 18),
Emp_SALARY INT DEFAULT 10000,
Emp_DESIGNATION VARCHAR(20) DEFAULT 'Trainee'
)
-- TO VIEW THE TABLE
SELECT * FROM Employee

-- INSERTING VALUES INSIDE THE TABLE FOR THE SPECIFIED COLUMN
INSERT INTO  Employee (Emp_ID,Emp_NAME,Emp_AGE) VALUES(1,'JOHN',20),(1,'JOHN',20),(1,'JOHN',20),(1,'JOHN',20)


--RENAMING A TABLE 
EXEC SP_RENAME 'Employee','Employee_Details'

--RETRIVING THE RENAMED TABLE
SELECT * FROM Employee_Details

--RENAMING A DATABASE
EXEC SP_RENAMEDB 'dbname','Second_database'

--RENAMING SCHEMA (REPLACING)

create schema task3

Alter SCHEMA task3 transfer task2.employee3 

select* from task3.employee3 -- TO TEST WHETHER IT IS REPLACED OR NOT 

-- CREATING A TABLE WITH id as identity column, name, salary, increment, computed column as Revised salary(sal+inc)

CREATE TABLE TRAINEE
(
ID INT IDENTITY(1,1),
NAME VARCHAR(20),
SALARY INT ,
INCREMENT INT)


INSERT INTO TRAINEE VALUES ('HEMANTH',100000,200000),('HARSHAN',80000,50000),('sharon',19000,20000),('HARI',70000,80000)
SELECT * FROM TRAINEE

ALTER TABLE TRAINEE2 ADD REVISED_SALARY AS (SALARY + INCREMENT)


-- TO Retrieve all the records whose salary is >20000 and move them into a new table using

SELECT * INTO TRAINEE2 FROM TRAINEE WHERE SALARY>75000
SELECT *FROM TRAINEE2
use Second_database
ALTER TABLE TRAINEE2 drop REVISED_SALARY1