use NF

create table Task12 (
S_ID int, 
S_NAME varchar(20),
S_DEP varchar(20),
YEAR_OF_COMPLETION int
)

insert into Task12 values (101,'Arjun','BCA',2020),
(102,'Arun','BCA',2020),
(103,'Dhana','BCA',2020),
(104,'Divya','BCA',2020),
(105,'Hemanth','BCA',2020),
(106,'Hari','BScIT',2021),
(107,'Harshan','BScIT',2021),
(108,'Harishmitha','BScIT',2021),
(109,'Karthik','BScIT',2021),
(110,'Priya','BScIT',2021),
(111,'Harita','BScCT',2022),
(112,'Ranita','BScCT',2022),
(113,'Selva','BScCT',2022),
(114,'Siva','BScCT',2022),
(115,'Sharon','BScCT',2022),
(116,'Vikram','BCom',2023),
(117,'Vasanth','BCom',2023),
(118,'Vignesh','BCom',2023),
(119,'Srikanth','BCom',2023),
(120,'Yamini','BCom',2023)

select * from Task12

--1.) Simplify the table to show the number of students in each department and categorize them based on yearofcompletion.

select YEAR_OF_COMPLETION,BCA,BScIT,BScCT,BCom from 
(SELECT S_DEP,YEAR_OF_COMPLETION,S_ID from Task12) AS t1
pivot
(
count(S_ID) for S_DEP in (BCA,BScIT,BScCT,BCom) 
) as t2


-- UNPIVOT
select S_DEP ,  YEAR_OF_COMPLETION,S_ID  from (
select YEAR_OF_COMPLETION,BCA,BScIT,BScCT,BCom from 
(SELECT S_DEP,YEAR_OF_COMPLETION,S_ID from Task12) AS t1
pivot
(
count(S_ID) for S_DEP in (BCA,BScIT,BScCT,BCom) 
) as t2
)as p
unpivot
(
S_ID for S_DEP in(BCA,BScIT,BScCT,BCom)) as unpivot_tab


select * from Task12

drop table Task12

--2.) Create a database for Library Management. 
--Analyse the required columns, perform a normalization and link the tables using primary and foreign key (using on update set default)



