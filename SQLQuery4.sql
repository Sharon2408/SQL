-- creating database
create database NF1
--using the current databasse
use NF1
-- creating schema
create schema NF1 

--creating a table Department

create table NF1.department1 
(
DEP_ID INT  primary key,
DEP_NAME VARCHAR(20) not null unique
)

--CREATING SYNONYM
CREATE SYNONYM dep1 For NF1.department1 

--Inserting values to table department1
INSERT INTO  dep1  values (100,'Developerr'),(101,'UI/UX')

--viewing table
 select * from dep1
-- creating table ADDRESS
 create table NF1.address
 (
 ADDRESS_ID int  primary key,
 CITY varchar(20) not null,
 STATE varchar(20)not null,
 PINCODE int not null
 )
 --INSERTING value to ADRESS
 insert into NF1.address values(1,'Manchester United','England',641008)
  insert into NF1.address values (3,'Real MAdrid','Spain',642009)

  create synonym add2 for NF1.address
  --viewing the table
  select * from add2

  --Creating table Employee
  create table Employee
  (
  E_id int  Primary key ,
  E_NAME varchar(20) unique not null,
  E_DESIG varchar(20) references NF1.department1 (DEP_NAME),
  E_DEP_ID int references NF1.department1 (DEP_ID),
  E_MOBILE1 bigint unique not null,
  E_MOBILE2 bigint unique,
  E_STREET varchar(20),
  E_ADDRESS_ID int references NF1.address (ADDRESS_ID) ) 

  --viewing table Employee
  select * from Employee

  --inserting values to table Employee

  insert into Employee values (1,'JOHN','Developerr',100,9597303632,7639040891,'Wellington',3),(2,'James','UI/UX',100,9597303630,7639040871,'Damascus',3)
  insert into Employee values (3,'Jammy','UI/UX',100,9597303330,7639045871,'Eden',1), (4,'Jane
  ','UI/UX',100,9597303630,7639040871,'Damascus',2)



  --viewing all three tables
  select * from Employee
   select * from add2
    select * from dep1


	alter table Employee DROP CONSTRAINT FK__Employee__E_ADDR 

	alter table Employee add CONSTRAINT FK__Employee__E_ADDR FOREIGN KEY (E_ADDRESS_ID) REFERENCES NF1.ADDRESS (ADDRESS_ID) ON DELETE set null ON UPDATE set null
	----------------------------------------------------------------------------------------------------------------------

	

	SELECT * FROM add2


	 delete  from add2  WHERE  ADDRESS_ID=3
	  update add2 set address_id=3 where ADDRESS_ID=5


