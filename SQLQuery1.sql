create database Firstdatabase
use Firstdatabase
create table Sha1(
Emp_ID int,
Emp_Name varchar(20),
Emp_Salary int
)
select*from Sha1

insert into Sha1 values(101,'Harshan',25000),
(102,'Darshan',25000),
(103,'Varshan',25000),
(104,'Varma',25000),
(105,'Lohith',50000),
(106,'Alfin',25000)
update Sha1 set Emp_Salary=68000 where Emp_ID=102
alter table Sha1  add Emp_Designation varchar(20)
update Sha1 set Emp_Designation='Developer' where Emp_ID=101
alter table Sha1  drop column Emp_Designation 