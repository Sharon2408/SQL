--Using the already created database named Firstdatabase
use Firstdatabase
 -- Creating table trainers in Firstdatabase
 CREATE TABLE Trainers (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATE,
DEPARTMENT CHAR(25)
);
--inserting values to trainers table in firstdatabase
INSERT INTO Trainers
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-05-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-02-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-04-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-06-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-07-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-09-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-12-20', 'Admin');

select * from Trainers

-- 1.) Write an SQL query to get the count of employees in each department.
SELECT COUNT(FIRST_NAME) as 'No of Employees',  DEPARTMENT FROM Trainers GROUP BY DEPARTMENT;

--2.) Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.

SELECT  JOINING_DATE , DATEADD (DAY,5,JOINING_DATE) AS 'Induction Program' from Trainers

--3.) Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.

select 

