/*Create a table for employees (EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL | PHONE_NUMBER | HIRE_DATE | JOB_ID | SALARY) 
with 20 records (Include 20 trainees in our training session)*/

create table Task11( 
EMPLOYEE_ID int, 
FIRST_NAME varchar(20),
LAST_NAME varchar(20), 
EMAIL varchar(30) , 
PHONE_NUMBER bigint, 
HIRE_DATE date ,
JOB_ID varchar(10), 
SALARY int)

insert into Task11 values (101,'Arjun','venkitraman','arjun@gmail.com',7356377567,'2023-01-24','D01',5000),
(102,'Arun','Joseph','arunjoseph@gmail.com', 7356395667,'2023-02-24','D02',2500),
(103,'Dhana','Prakash','dhana@gmail.com',7356373467,'2023-03-24','D03',3000),
(104,'Divya','Prakash','divyaprak@gmail.com',7353473467,'2023-03-20','D04',4000),
(105,'Hemanth','Paramahamsa','hema@gmail.com',7356343467,'2023-02-18','D05',4200),
(106,'Hari','Karthik','hari@gmail.com',7353473467,'2023-04-04','D06',6000),
(107,'Harshan','Aruchami','harsha@gmail.com',7350373467,'2023-01-23','D07',5500),
(108,'Harishmitha','H','harishmitha@gmail.com',7356773467,'2023-07-14','D08',3000),
(109,'Karthik','K','karthi@gmail.com',7356378967,'2023-05-04','D09',3300),
(110,'Priya','Darshan','priyadarshan@gmail.com',7356373467,'2023-03-24','D10',6000),
(111,'Harita','Rajan','harita@gmail.com',7356375467,'2023-01-23','D11',3800),
(112,'Ranita','Rajan','Ranita@gmail.com',7336373467,'2023-04-24','D12',3000),
(113,'Selva','Ganapathy','selva@gmail.com',7356343467,'2023-02-14','D13',6000),
(114,'Siva','Barath','siva@gmail.com',7156373467,'2023-04-24','D14',3000),
(115,'Sharon','David','sharon@gmail.com',7355373467,'2023-01-20','D15',3030),
(116,'Vikram','V','vikram@gmail.com',736373467,'2023-05-24','D16',4000),
(117,'Vasanth','Kumar','vasanth@gmail.com',735373467,'2020-01-02','D17',6000),
(118,'Vignesh','Vicky','vicky@gmail.com',7356373467,'2023-02-24','D18',2500),
(119,'Srikanth','S','srikanth@gmail.com',7346373467,'2021-02-04','D19',4800),
(120,'Yamini','Priya','yamini@gmail.com',7336373467,'2020-01-14','D20',3200)

select * from Task11 order by FIRST_NAME

/*1.)Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. 
Return first name, last name.*/

select FIRST_NAME,LAST_NAME from Task11 where SALARY > (select  SALARY from Task11 where EMPLOYEE_ID=116)


/*2. Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. 
Return first name, last name, job ID.*/

select FIRST_NAME,LAST_NAME,JOB_ID from Task11 where HIRE_DATE in (select HIRE_DATE from Task11 where EMPLOYEE_ID=111)

/*3. Write a SQL query to find those employees who earn more than the average salary. 
Return employee ID, first name, last name.*/

select t.EMPLOYEE_ID , t.FIRST_NAME, t.LAST_NAME from  
(select avg(SALARY) as Average_Salary from Task11)  as t1 , task11 as t
where t.SALARY > t1.Average_Salary

/*4. Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". 
Return first name, last name, employee ID and salary.*/

select FIRST_NAME, LAST_NAME, EMPLOYEE_ID , SALARY from Task11 
where FIRST_NAME in (select FIRST_NAME from Task11 where FIRST_NAME='Yamini')

/*5. Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. 
Return all the fields.*/

select * from Task11 as e, (select min(SALARY) as minsal from Task11 ) as t where SALARY between t.minsal and 2500