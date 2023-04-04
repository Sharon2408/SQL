--Using the database firstdata
use Firstdatabase

--Viewing the already created student table
select * from Student

-- 1. Auto-commit and Auto-rollback transactions.

--Working of Auto Commit
Begin Tran
UPDATE student 
SET    department = 'Iot'
WHERE  Student_ID = 4

--To show the number of transactions
SELECT @@TRANCOUNT AS Transactions_Processed

--Working of Auto RollBack
Begin Tran
update Student
set Score = 'marks'
where Student_ID = 5

SELECT @@TRANCOUNT AS Transactions_Processed

--Viewing the already created student table
select * from Student

-- 2.  Implicit transactions
--Turn-On implicit transactions
SET IMPLICIT_TRANSACTIONS ON 


UPDATE 
    Student 
SET 
    Student_Name='Andrew Tate'
WHERE 
   Student_ID = 3 

SELECT 
    IIF(@@OPTIONS & 2 = 2, 
    'Implicit Transaction Mode ON', 
    'Implicit Transaction Mode OFF'
    ) AS 'Transaction Mode' 
SELECT 
    @@TRANCOUNT AS Transactions_Processed 

COMMIT TRAN 

SELECT 
    @@TRANCOUNT AS Transactions_Processed

--Turning-Off implicit transactions
SET IMPLICIT_TRANSACTIONS OFF

--Viewing the already created student table
select * from Student

--3. Explicit transactions
   -- a. Only Commit - insert statement
BEGIN TRAN
insert into Student values ('Dhoni','Bsc-IT',465)
SELECT @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
SELECT @@TRANCOUNT AS OpenTransactions

--b. Only Rollback - update statement
begin tran
update
Student set Student_Name='Virat' 
where Student_ID=5

SELECT @@TRANCOUNT AS Transactions_Completed
select * from Student where Student_ID=5

ROLLBACK TRAN 

select * from Student where Student_ID=5
SELECT @@TRANCOUNT AS Transactions_Completed 

--c. Savepoint - commit update and insert statements, rollback delete statement

BEGIN TRANSACTION 
insert into Student values ('Raina','Bsc-IT',445)
update Student set Score=0 where Student_ID=1

--creating a savepoint
SAVE TRANSACTION savepoint_demo

DELETE Student WHERE Student_ID=9

SELECT * FROM Student 

--Reverting
ROLLBACK TRANSACTION savepoint_demo

COMMIT

SELECT * FROM Student