--Creating a database
CREATE DATABASE ORG

--using the database org
USE ORG

--creatibg table worker
CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

--inserting values to table worker
insert into  worker values (006, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00' , 'Account'),
(007, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');
insert into  worker values (009, 'Geeta', 'Sharma', 80000, '2014-04-13 09:00:00', 'Admin'),(010, 'Peeta', 'Varma', 80000, '2014-04-17 09:00:00', 'Admin')  
insert into  worker values (011, 'seeta', 'Varma', 80000, '2014-04-17 09:00:00', 'Admin'),
insert into  worker values (012, 'qeeta', 'Varma', 95000, '2014-04-17 09:00:00', 'Admin')
-- creating table Bonus
CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE,
AFFECTED_FROM DATETIME
);

--inserting values to table Bonus
insert into bonus values (006,5000,'2015-07-12','2015-07-12' ), 
insert into bonus values (007,9000,'2015-07-12','2015-07-12' ),(008,9000,'2015-07-12','2015-07-12' ),
insert into bonus values (009,9000,'2015-07-19','2015-07-19' ),(010,9000,'2015-07-16','2015-07-16' )
 insert into bonus values (011,10000,'2015-07-29','2015-07-29' ),(012,13000,'2015-07-18','2015-07-18' )
 --viewing table bonus
 select*from bonus

 --Q-1. Write an SQL query to fetch “FIRST_NAME” fromWorker tableusing the alias name as <WORKER_NAME>. 

 select FIRST_NAME as WORKER_NAME from worker

 --Q-2. Write an SQL query to fetch “FIRST_NAME” fromWorker tableinupper case. 
 select   UPPER(FIRST_NAME) as FIRST_NAME from Worker   


 -- Q-3. Write an SQL query to fetch unique values of DEPARTMENTfromWorker table. 

 select Distinct DEPARTMENT from Worker

 --Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table. 
  
  select SUBSTRING(FIRST_NAME,1,3) as FIRST_NAME from Worker 
  
  --Q-5. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

   select Distinct  len(DEPARTMENT)  as DEPARTMENT_LENGTH from Worker

  -- Q-6. Write an SQL query to print the FIRST_NAME and LAST_NAMEfrom Worker table into a single column COMPLETE_NAME. Aspacechar should separate them. 

SELECT CONCAT( FIRST_NAME,' ',LAST_NAME) as COMPLETE_NAME  from worker

-- Q-7. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table. 

select * from Worker where FIRST_NAME = 'Vipul' or FIRST_NAME ='Satish'

-- Q-8. Write an SQL query to print details of Workers with DEPARTMENTname as “Admin”. 
 
 select * from Worker where DEPARTMENT = 'Admin'

-- Q-9. Write an SQL query to print details of the Workers whoseFIRST_NAME ends with ‘a’. 
 
  select * from Worker where FIRST_NAME like '%a'

 -- Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
    
	select * from Worker where FIRST_NAME like '%a%'
 



