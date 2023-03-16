use Firstdatabase

CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
select * from Trainees
insert into Trainees values (1,'Alfin','Antony',40000,'2023-03-15','Human Resource'),
(2,'Lohith','Kumar',60000,'2021-02-17','Developer'),
(3,'mahendra','Varma',80000,'2022-03-15','Developer'),
(4,'Karuppusamy','S',49000,'2023-01-18','Human Resource'),
(5,'Aditya','H',43000,'2021-04-15','Designer'),
(6,'Srimanu','Sabarishwaran',56000,'2017-08-13','Human Resource'),
(7,'Praveen','Mathew',86000,'2012-07-11','Designer'),
(8,'Mani','Khan',76000,'2014-08-14','Designer'),
(9,'Sharma','S',40000,'2015-09-17','Developer'),
(10,'siddharth','L',57000,'2016-04-25','Human Resource'),
(11,'Anas','I',90000,'2020-05-15','Designer'),
(12,'Hari','Karthik',40000,'2020-05-29','Developer'),
(13,'Harshan','Aruchami',64000,'2023-02-16','Human Resource'),
(14,'Hemanth','L',23000,'2022-11-13','Human Resource'),
(15,'Vikram','H',10000,'2003-08-12','Developer'),
(16,'Vignesh','V',32000,'2011-06-16','Human Resource'),
(17,'Thyagaraj','Sami',12000,'2012-02-20','Designer'),
(18,'tharun','Kumar',10000,'2013-06-22','Human Resource'),
(19,'Lokesh','Kanagaraj',20000,'2023-08-23','Developer'),
(20,'Sharon','David',30000,'2021-01-21','Human Resource')

select * from Trainees where FIRST_NAME like '[J-T]%'
select * from Trainees where FIRST_NAME like 'j,k,l,m,n,o,p,q,r,s,t%' 

SELECT * FROM Trainees WHERE SALARY BETWEEN 20000 AND 50000;

select * from Trainees where FIRST_NAME like '%i'

SELECT DISTINCT SALARY FROM Trainees;

SELECT * FROM Trainees WHERE DEPARTMENT IN ('Developer', 'Designer');

SELECT * FROM Trainees WHERE Trainee_ID < 5;

SELECT * FROM Trainees ORDER BY FIRST_NAME
OFFSET 5 ROWS FETCH  NEXT 10 ROWS ONLY



SELECT * FROM Trainees ORDER BY DEPARTMENT DESC

select * from Trainees where  LAST_NAME LIKE '__a%'

SELECT  TOP 5  with ties * FROM Trainees ORDER BY SALARY