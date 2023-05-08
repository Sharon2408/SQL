-- 1)
-- Create Sample database. Create
create DATABASE [IF NOT EXISTS] Sample;
use Sample
-- a. Create Employee table with Eid, EmpName, Department, Salary as columns
create table Employee
(
  Emp_ID int Primary Key not null,
  Emp_name varchar(25),
  Department varchar(30) ,
  salary int
  );

-- b. Insert a single record
insert into Employee values(101,'Andrew','HR',25000)

-- c. Insert multiple records (Atleast 10 records)
insert into Employee values
(102, 'John Doe', 'Sales', 50000),
(103, 'Jane Smith', 'Production', 60000),
(104, 'Bob Johnson', 'IT', 70000),
(105, 'Alice Brown', 'HR', 55000),
(106, 'David Lee', 'Finance', 80000),
(107, 'Sarah Kim', 'Operations', 65000),
(108, 'Mike Jones', 'IT', 75000),
(109, 'Karen Chen', 'Sales', 60000),
(110, 'Tom Davis', 'Production', 85000);

-- d. Create Worker table as same as Employee with the records
CREATE TABLE Worker AS SELECT * FROM Employee ;

-- e. Display records of worker
select * from Worker



-- 2)
-- a. Create a schema Example
create schema Example
use Example

-- b. Move the Worker table from Sample DB to Example DB as JOB table
CREATE TABLE Example.JOB LIKE Sample.Worker;

INSERT INTO Example.JOB SELECT * FROM Sample.Worker;

-- c. Insert DOJ column as Date datatype into JOB table as 3 rd field

ALTER TABLE Example.JOB ADD DOJ DATE AFTER Emp_name ;

-- d. Update salary as 50000 for Production department employees
UPDATE Example.JOB SET salary = 50000 WHERE Department = 'Production';

-- e. Insert Bonus column with 3000 as default value
ALTER TABLE Example.JOB ADD Bonus INT DEFAULT 3000;

-- f. Update the bonus as 10% of salary for IT department
UPDATE Example.JOB SET Bonus = 0.1*salary WHERE Department = 'IT';

-- g. Modify the name of bonus column to Incentive
ALTER TABLE Example.JOB CHANGE Bonus Incentive INT DEFAULT 3000 AFTER Salary;


-- h. Delete the records who earns less than 10000 salary
DELETE FROM Example.JOB WHERE salary < 10000;



--3)
-- a. Create Database
CREATE DATABASE DB_OLD_NAME;

-- b. Create schema
CREATE SCHEMA DB1_OLD_NAME;

-- c. Rename database and Schema
ALTER DATABASE DB_OLD RENAME TO DB_NEW_NAME;

ALTER SCHEMA DB1_OLD_NAME RENAME TO DB1_NEW_NAME;

-- d. Delate database and schema
DROP DATABASE DB_NEW_NAME;

DROP SCHEMA DB1_NEW_NAME;

-- e. Create table in 4 ways
-- 1) 
CREATE TABLE NEW_TABLE (
  id INT PRIMARY KEY,
  name VARCHAR(50),
);
-- 2)
CREATE TABLE MY_TABLE AS
SELECT *
FROM NEW_TABLE;
--3.)
CREATE TABLE NEW_TABLE LIKE MY_TABLE;
--4.)
INSERT INTO NEW_TABLE SELECT * FROM MY_TABLE

-- f. Use alter table with ADD, MODIFY and CHANGE keyword
ALTER TABLE TABLE_NAME ADD NEW_COLUMN_NAME DATATYPE [FIRST|AFTER COLUMN_NAME];
ALTER TABLE TABLE_NAME MODIFY EXISTING_COLUMN_NAME DATATYPE [FIRST|AFTER COLUMN_NAME];
ALTER TABLE TABLE_NAME CHANGE EXISTING_COLUMN_NAME NEW_COLUMN_NAME DATATYPE [FIRST|AFTER COLUMN_NAME];




-- 4.)
-- a. List out records of the employees whose salary above 20000
SELECT * FROM Employee WHERE Salary > 20000;
-- b. List out records of the employees whose salary between 20000 and 30000
SELECT * FROM Employee WHERE Salary between  20000 and 30000;
-- c. List out records of the employees whose salary not between 20000 and 30000
SELECT * FROM Employee WHERE Salary NOT between  20000 and 30000;
-- d. List out records of the employees whose salary above 20000 and department is IT
SELECT * FROM Employee WHERE Salary > 20000 AND Department = 'IT';
-- e. List out records of the employees whose salary = 10000, 20000 , 30000 using IN operator and using OR operator
SELECT * FROM Employee WHERE salary IN (10000, 20000, 30000);
SELECT * FROM Employee WHERE Salary = 10000 | 20000 | 30000;
-- f. List out records of the employees whose names starts with S
SELECT * FROM Employee WHERE Emp_name LIKE 'S%';
-- g. List out records of the employees whose names ends with ‘in’
SELECT * FROM Employee WHERE Emp_name LIKE '%in';
