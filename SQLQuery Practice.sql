use Firstdatabase

select * from Student

CREATE TRIGGER DML 
ON student
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF DATEPART(HH,GETDATE()) = 9
  BEGIN
    PRINT 'INVALID TIME'
    ROLLBACK TRANSACTION
  END 
END

insert into Student(Student_Name,Department,Score) values('SHA','IT',540)

drop trigger Restrict_DML

alter table student add Modified_Date DATETIME 

create trigger dbo.modate
on dbo.student
for update
as
begin
update dbo.Student set Modified_Date=GETDATE()
from dbo.Student inner join deleted d on dbo.Student.Student_ID = d.Student_ID


 CREATE TRIGGER dbo.set_modified_date on dbo.Student FOR UPDATE AS
 BEGIN
     UPDATE dbo.Student
     SET Modified_Date = GETDATE()
     FROM dbo.Student INNER JOIN deleted d ON dbo.Student.Student_ID = d.Student_ID
 END

 ALTER TABLE dbo.student ENABLE TRIGGER [set_modified_date]

CREATE TRIGGER AfterStud
ON student
AFTER INSERT
AS
PRINT 'After Trigger'
RAISERROR('Error',16,1);
ROLLBACK TRAN;

drop trigger AfterStud

ALTER T
update Student set Student_Name='SHAron' where Student_ID=21

ENABLE trigger SOMETHING_HAPPENED ON DATABASE

INSERT INTO 

SELECT INTO NEW TABLE FROM OLD TABLE

DECLARE 
    @id UNIQUEIDENTIFIER;
SET @id = NEWID();
UPDATE Student SET Student_ID=NEWID()
SELECT 
    @id AS GUID ;

	SET IDENTITY_INSERT STUDENT ON 

	Select SCOPE_IDENTITY()

DBCC CHECKIDENT('dbo.student', RESEED, 0)

Select IDENT_CURRENT('dbo.student')Select SCOPE_IDENTITY()

DBCC CHECKIDENT('dbo.student', RESEED, 0)

Select IDENT_CURRENT('dbo.student')

SELECT DATENAME(dw, GETDATE())     AS 'Day of the Week';  


 CREATE FUNCTION FN_CalculateAge (@DOB DATE)
RETURNS INT
AS
BEGIN
  DECLARE @AGE INT
  SET @AGE = DATEDIFF(YEAR, @DOB, GETDATE())
  RETURN @AGE
END

SELECT dbo.FN_CalculateAge ('08/04/2002')AS AGE