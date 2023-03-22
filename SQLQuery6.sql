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

SELECT TRAINEE_ID,JOINING_DATE, CHOOSE(MONTH([JOINING_DATE]),'January','February','March','April','May','June',
 'July','August','September','October','November','December') AS ordermonth FROM Trainers;

--4.) Write an SQL query to perform the total and subtotal of salary in each department.
 SELECT coalesce (DEPARTMENT, 'All Departments') AS Department , sum (salary) as Salary_Sum FROM Trainers
  GROUP BY ROLLUP (DEPARTMENT)

--5.) Write an SQL query to retrieve first 3 records randomly.
select top 3 * from Trainers order by NEWID()

--6.) Show the working of composite key with any example.
CREATE TABLE orders (
   ORDER_ID int ,
   CUSTOMER_ID int ,
   PRODUCT_NAME varchar(15),
   ORDER_DATE datetime,
   PRIMARY KEY (order_id, customer_id)
);

select * from orders

insert into orders values (3,3,'Eraser',2021-02-23 ),(2,1,'Pen',2021-02-23 )

--7.) Show the working of IIF and CASE for the above table.

SELECT TRAINEE_ID,FIRST_NAME,LAST_NAME,SALARY,
CASE
    WHEN salary >= 200000 THEN 'Senior Employee'
    WHEN salary >= 100000 THEN 'Junior Employee'
    ELSE 'Trainee'
END AS 'Employee Details'
FROM Trainers;

--8) Show the working of Sequence.
CREATE SEQUENCE TrainerSequence
AS INT
START WITH 1 
INCREMENT BY 1 

CREATE TABLE Employees
(
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    Gender NVARCHAR(10)
);

INSERT INTO Employees VALUES
(NEXT VALUE for TrainerSequence, 'Ben', 'Male');
INSERT INTO Employees VALUES
(NEXT VALUE for TrainerSequence, 'Sara', 'Female');
INSERT INTO Employees VALUES
(NEXT VALUE for TrainerSequence, 'Sar', 'male');
INSERT INTO Employees VALUES
(NEXT VALUE for TrainerSequence, 'Sara Tendulkar', 'Female');


select * from Employees

--9.) Show the working of creation of Synonym for a table in DB1 from DB2.

create Synonym tab for NF1 . [dbo].[Employee]  
 select * from tab

 --10.) Show the working of IDENTITY_INSERT.
 create table empdetails(
 id int identity(1,1),
 name varchar(20),
 salary money,
 increment money)

 
 insert into empdetails(name,salary,increment) values ('varma',30000,5000),('lohith',25000,5000),('vikram',18000,5000)

 set identity_insert empdetails on;
 insert into empdetails(id,name,salary,increment) values(100,'Alfin',20000,3000) 
  set identity_insert empdetails off;
   insert into empdetails(name,salary,increment) values('Siva',10000,2000) 
    select *from empdetails