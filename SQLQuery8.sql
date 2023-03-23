use firstdatabase
--Creating Table Student
create table Student
(
Student_ID int primary key identity(1,1),
Student_Name varchar(20),
Department varchar(20),
Score int 
)

--Viewing table student
select * from Student

-- inserting values to table student
insert into Student values('Hemanth','Bsc-It',500)
insert into Student values('Harshan','Bsc-It',490),('Sharon','Bsc-It',480),('Karthi','Bsc-Ct',495),('Siva Barath','BCA',450),('Hari','BCA',460),('Vasanth','BCA',490),('Vikram','BCA',478),('Rinita','Bsc-ct',460)
insert into Student values('Harita','Bsc-It',480),('Yamini','Bsc-Ct',478),('Harishmitha','BCA',496),('Srikanth','BCA',454),('Priyadharshan','Bsc-Ct',465),('Selva','BCA',492),('Dhanaprakash','Bsc-it',479),('Arun','BCA',461),('venkit','BCA',478),('Vignesh','BCA',455)
insert into Student values('DivyaPrakash','Bsc-It',498),('Rohit','Bsc-It',480),('Dhawan','Bsc-Ct',500),('Virat','BCA',550),('Pant','BCA',465),('Ashwin','BCA',490)

--1. Create a non-clustered index for department
 
      create index stud_details on Student (Department asc)
	  exec sp_helpindex Student

--2.  Create a filtered index for department='BCA'
     create index stud_dep_BCA on Student (Department asc) where Department='BCA'
	   exec sp_helpindex Student

--3.   Create a view for students in BCA department.

        create view Student_view as select Student_Name from Student where Department = 'BCA'
		select * from Student_view

--4. Apply Rank() for all the students based on score.
     
	  SELECT Student_name,Department,Score,
RANK () OVER (ORDER BY Score desc) AS Rank_Holders   
FROM Student

--5. Apply Dense_Rank() for students in each department based on score.
     
	 SELECT Student_Name,Department,Score,
DENSE_RANK() OVER (partition by Department ORDER BY Score desc) AS Rank_Holders   
FROM Student; 

--b. Create 2 tables Manager(id(pk), name) and Employee(eid(pk),ename,mid(fk), department).

       Create Table Manager(
	   M_id int primary key ,
	   M_name varchar(20) );

	   Create Table Emp(
	   E_id int primary key,E_name varchar(20),
	   M_id int foreign key references Manager(M_id) default 3,
	   Department varchar(20));

-- Inserting value to the table Manager and Emp
 insert into Manager values (1,'Durairaj'),
 (2,'Escobar'),
 (3,'Bond'),
 (4,'Rolex')
 
 insert into Emp values (1,'Hari',1,'Science'),
 (2,'Karthick',2,'History'),
 (3,'Santhosh',3,'Geography'),
 (4,'Hemanth',4,'Economics'),
 (5,'Prakash',3,'Geography'),
 (6,'Vasanth',1,'Science')

 --Viewing table Manager an Emp
 
 


	  -- 1. Create a complex view by retrieving the records from Manager and Employee table.
                
				create view Mng as 
                SELECT  m.M_name, e.E_id,e.E_name,e.M_id,e.Department
                FROM Manager AS m
                FULL JOIN
                Emp AS e
                ON m.M_id = e.M_id

-- Viewing the view
                select * from Mng


      --2. Show the working of 'on delete cascade on update set default' for the above tables

	  	alter table Emp DROP CONSTRAINT   [FK__Emp__M_id ]

alter table Emp add CONSTRAINT  [FK__Emp__M_id ] FOREIGN KEY (M_id) REFERENCES Manager (M_id) ON DELETE cascade ON UPDATE set default

         delete  from Manager  WHERE  M_id=4
	  
	  update Manager set M_id=4
	  where M_id=2

	  select * from Manager
	    select * from Emp
	   set identity_insert Manager on
	    