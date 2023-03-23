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