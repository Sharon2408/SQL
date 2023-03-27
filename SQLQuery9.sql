use NF
Create  table Stu( student_id int, studentname varchar(20), semester varchar(10), securedmarks int, totalmarks int)
insert into Stu values ( 1,'John','Sem 1',450,500),(2,'Sharon','Sem 2',447,500),(3,'Hari','Sem 2',454,500),(4,'Hemanth','Sem 3',443,500),(5,'Harshan','Sem 3',480,500),(6,'Shyam','Sem 3',407,500),(7,'Arjun','Sem 3',457,500)
 
 select * from Stu
 -- 1.) Create User-define Scalar function to calculate percentage of all students
 create function Percentage(@mark decimal, @total decimal)
 returns decimal
 as
 Begin
 declare @percent decimal 
 set @percent = (@mark/@total)*100
 return @percent
 end

 select *, dbo.Percentage(securedmarks,totalmarks) as Result From Stu

 -- 2.) Create user-defined function to generate a table that contains result of Sem 3 students.

 create function Sem_3(@Sem varchar(20))
 Returns table
 as 
 return(select * from dbo.Stu where semester=@Sem)
 
 select * from Sem_3('Sem 3')

 -- 3.)  Write SQL stored procedure to retrieve all students details. (No parameters)

 create procedure Val 
 as
 begin 
 select * from dbo.Stu
 end
 exec Val

 -- 4.) Write SQL store procedure to display Sem 1 students details. (One parameter)

 create procedure Disp(@Sem varchar(10))
 as
 begin
 select * from dbo.Stu where semester=@Sem
 end
 exec Disp @Sem= 'Sem 1' 

 -- 5.) Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)


 Alter procedure Details(@det int output )
 as
 begin 
 select @det=count(student_id) from Stu
 end 
 declare @stud_det int
 exec Details @stud_det output
 print 'Student Details ' + convert(varchar(30),@stud_det)