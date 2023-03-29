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

create table book (
Book_ID int primary key,
Book_Name varchar(20),
Author varchar(20)
)

insert into Book values (1,'Wings Of Fire','APJ.Abdul Kalam'),(2,'The Alchemist','Paulo Coelho'),(3,'It Ends With Us','Coleen Hoover'),(4,'half-girlfriend','Chetan Baghat')
insert into Book values(5,'No_Book','No_Author')
select * from book
drop table book

--creating Table library
create table Library (
Customer_ID int primary key ,
Customer_Name varchar(20),
Book_ID int foreign key references book(Book_ID) )

drop table Library

insert into Library values (1,'Sharon',2), (2,'Harshan',1),(3,'Hari',3),(4,'Hemanth',1) 
select * from Library

alter table Library DROP CONSTRAINT   [FK__Library__Book_ID__2C538F61]
alter table Library drop column Book_ID

alter table Library add  Book_ID int default 5 CONSTRAINT  [FK__Library__Book_ID__lib_book] FOREIGN KEY (Book_ID) REFERENCES Book (Book_ID)ON UPDATE set default

      delete  from Book  WHERE Book_ID=3
	  
	  update Library set Book_ID=3
	  where book_ID=1
	  
	  insert into   Library (Customer_ID,Customer_Name) values (5,'Karthi')
	  select * from Library
	  select * from book

	  truncate table Library 