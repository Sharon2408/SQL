use NF

  --1.) Write a Stored Procedure in SQL using conditional statements to search for a record from the students table (created in SQL Task 8) based on studentname column.

     create procedure student_name (@name varchar(20))
     as
     begin  select * from dbo.Stu where studentname=@name
     end
   --executing the procedure
      exec student_name @name='John' 


    --2.) Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.
           Create procedure Student 
            as
            begin 
            SELECT *,
            CASE 
            WHEN securedmarks >= 460 and securedmarks <= 500 THEN 'Excellent'
            WHEN securedmarks  >= 400 and securedmarks < 460 THEN 'Very Good'
            ELSE 'Very poor'
           END AS Remarks
           FROM Stu
           end
		   --Executing The Procedure
          exec Student 

--3.)Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)

--a.)Table Variable
declare @Newtable Table (
student_id int,
studentname varchar(20),
semester varchar(20),
securedmarks int,
totalmarks int
)

insert into @Newtable 
select * from Stu
select * from @Newtable

-- b.)Temporary Table

--Single hash (#) is used to Access it Locally
--Double hash (##) is used to Access it Globally
create table ##Tmptable
(
Student_id int ,
Student_Name varchar(20)
)

insert into ##Tmptable values (101,'Sharon'),(102,'John'),(103,'Hari')

select * from ##Tmptable

--c.) Temporary Stored Procedure

--Single hash (#) is used to Access it Locally
--Double hash (##) is used to Access it Globally

create procedure ##Temp_procedure
as 
begin
print 'This is the Example of Temporary Stored Procedure'
end

exec ##Temp_procedure

