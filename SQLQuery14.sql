--a. Create a table Hobbies (HobbyID(pk), HobbyName(uk)) 
create table hobbies(
Hobby_ID int primary key,
Hobby_Name varchar(20) unique
)

--1. insert records into the table using a stored procedure.

CREATE PROCEDURE Inserthobby
   
    @Hobby_id int,
    @Hobby_Name VARCHAR(50) 
    AS

BEGIN 
    
	INSERT INTO hobbies (Hobby_ID, Hobby_Name)
    
	VALUES (@Hobby_id,@Hobby_Name )

begin try
INSERT INTO hobbies (Hobby_ID, Hobby_Name)
    
	VALUES (@Hobby_id,@Hobby_Name )
print 'Cannot enter Duplicate values'
end try

begin catch
print ERROR_NUMBER()
    print ERROR_MESSAGE()
    print ERROR_SEVERITY()
    print ERROR_STATE()
  end catch
END
--To view the inserted records

    select * from hobbies

--2. insert duplicate records into the table and show the working of exception handling using Try/catch blocks.

     Exec Inserthobby  101,'badminton'
	 Exec Inserthobby  102,'badminton'
	 Exec Inserthobby  101,'cricket'

--3. Store the error details in an errorbackup table.

   CREATE TABLE Hobbie_Errors
         (ErrorID        INT IDENTITY(1, 1),
          UserName       VARCHAR(100),
          ErrorNumber    INT,
          ErrorState     INT,
          ErrorSeverity  INT,
          ErrorLine      INT,
          ErrorProcedure VARCHAR(MAX),
          ErrorMessage   VARCHAR(MAX),
          ErrorDateTime  DATETIME)
 --creating procedure

Alter PROCEDURE Inserthobby
    @Hobby_id int,
    @Hobby_Name VARCHAR(50) 
    AS
BEGIN
    INSERT INTO hobbies (Hobby_ID, Hobby_Name)
    VALUES (@Hobby_id,@Hobby_Name )
begin try
INSERT INTO hobbies (Hobby_ID, Hobby_Name)
    VALUES (@Hobby_id,@Hobby_Name )
print 'Cannot enter Duplicate values'
end try

begin catch

insert into Hobbie_Errors values
 
  (SUSER_SNAME(),
   ERROR_NUMBER(),
   ERROR_STATE(),
   ERROR_SEVERITY(),
   ERROR_LINE(),
   ERROR_PROCEDURE(),
   ERROR_MESSAGE(),
   GETDATE());
  
  end catch

END

EXEC Inserthobby 101, 'Badminton'
EXEC Inserthobby 102,'cricket'

--To view the error Table Hobbie_Errors
    
	select * from Hobbie_Errors



--b. Create a procedure to accept 2 numbers, if the numbers are equal then calculate the product else use RAISERROR to show the working of exception handling.
     
--creating procedure

CREATE PROCEDURE equal
@num1 INT, 
@num2 INT
AS
BEGIN
    
DECLARE @result INT
SET @result = 1
IF(@num1 <> @num2)
    BEGIN
         RAISERROR('THE GIVEN NUMBERS ARE NOT EQUAL', 16, 7) 
    END
    ELSE
    BEGIN
        SET @result = @num1 * @num2
        PRINT 'THE RESULT IS : '+ CAST(@result AS VARCHAR)
    END

END

exec equal 1,2
exec equal 4,4


--c. Create a table Friends(id(identity), name (uk)) and insert records into the table using a stored procedure.
 -- insert the names which start only with A,D,H,K,P,R,S,T,V,Y ELSE using THROW give the error details.
 
 create table Friends (
 id int identity(1,1),
 name varchar(20)
 )
 --creating procedure

alter procedure friends_insert(@name varchar(20))
as 
begin

IF(@name not like '[ADHKPRSTVY]%')
    BEGIN
         THROW 50008,'Error! PLEASE INSERT THE NAMES WHICH START ONLY WITH "A,D,H,K,P,R,S,T,V,Y" ',8
    END
    
	ELSE
    BEGIN
        insert into Friends values (@name)
		select * from Friends
    END
end

--executing procedure
exec friends_insert 'Arun'

exec friends_insert 'Ramesh'

exec friends_insert 'Ben'

exec friends_insert 'Yamini'

--viewing table Friends

select * from Friends  
