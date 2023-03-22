use Firstdatabase

--CREATING TABLES salesman,customer,orders1

-- Creating table Salesman
create table salesman
(
salesman_id int primary key, name varchar(15), city varchar(15) , commission numeric(4,2))

-- Creating table customer 
create table customer (
customer_id int primary key,   
cust_name varchar(15), city varchar(10),  grade int,  
salesman_id int foreign key references salesman(salesman_id)  )

--Creating table orders1 
create table orders1 (
ord_no int,
purch_amt numeric(8,2),
ord_date date,
customer_id int foreign key references customer(customer_id),
salesman_id int foreign key references salesman(salesman_id))

--INSERTING VALUES

--inserting values into table salesman
insert into salesman values (5001 , 'James Hoog' , 'New York' , 0.15) ,
(5002 , 'Nail Knite' , 'Paris' , 0.13),
(5005 , 'Pit Alex' , 'London' , 0.11),
(5006 , 'Mc Lyon' , 'Paris' , 0.14),
(5007 , 'Paul Adam' , 'Rome ', 0.13),
(5003 , 'Lauson Hen',  'San Jose' , 0.12)

-- inserting values to table customer
insert into customer values 
(3002 , 'Nick Rimando' , 'New York' , 100,  5001),
(3007 , 'Brad Davis' , 'New York'  ,200,  5001),
(3005 , 'Graham Zusi' , 'California' , 200 , 5002),
(3008 , 'Julian Green' , 'London' , 300  ,5002),
(3004 , 'Fabian Johnson' , 'Paris' , 300 , 5006),
(3009 , 'Geoff Cameron' , 'Berlin' , 100  ,5003),
(3003 , 'Jozy Altidor' , 'Moscow' , 200  ,5007)
insert into customer(customer_id,cust_name,city,salesman_id) values (3001 , 'Brad Guzan'  ,'London' ,  5005)

--Inserting values into table orders1
insert into orders1 values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05' ,3002 ,5001),
(70004 ,110.5 ,'2012-08-17' ,3009 ,5003),
(70007 ,948.5, '2012-09-10' ,3005, 5002),
(70005 ,2400.6, '2012-07-27', 3007 ,5001),
(70008 ,5760 ,'2012-09-10', 3002 ,5001),
(70010 ,1983.43 ,'2012-10-10', 3004 ,5006),
(70003 ,2480.4 ,'2012-10-10' ,3009, 5003),
(70012 ,250.45 ,'2012-06-27', 3008 ,5002),
(70011 ,75.29 ,'2012-08-17' ,3003, 5007),
(70013 ,3045.6, '2012-04-25', 3002, 5001)

--VIEWING TABLE

--viewing table salesman
select * from salesman
--viewing table customers
select * from customer
--viewing table orders1
select * from orders1


/*1.) From the above tables write a SQL query to find the salesperson andcustomer who reside in the same city. 
Return Salesman, cust_name andcity.*/

SELECT s.name,c.cust_Name, c.city
FROM salesman AS s
   INNER JOIN
   customer AS c
   ON s.city = c.city



/*2.) From the above tables write a SQL query to find salespeople whoreceived commissions of more than 12 percent from the company.
Return Customer Name, customer city, Salesman, commission.*/

SELECT c.cust_Name,c.city, s.name, s.commission
FROM customer AS c
   INNER JOIN
   salesman AS s
   ON s.salesman_id = c.salesman_id where commission > 0.12

/*3.) From the above tables write a SQL query to find the details of an order.
Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman,commission.*/

SELECT o.ord_no,o.ord_date,o.purch_amt,c.cust_Name,c.grade,s.name,s.commission
from orders1 as o 
inner join
customer as c
on o.customer_id=c.customer_id
inner join
salesman as s
on  c.salesman_id=s.salesman_id

/*4.) From the above tables write a SQL query to find those orders where the order amount exists between 500 and 2000.
Return ord_no, purch_amt,cust_name, city. */

SELECT o.ord_no,o.purch_amt,c.cust_Name,c.city
FROM orders1 as o
inner join 
customer as c
on o.customer_id=c.customer_id where purch_amt between 500 and 2000

/*5.) From the above tables write a SQL query to display the customer name,customer city, grade, salesman, salesman city. 
The results should besorted by ascending customer_id. */

SELECT c.cust_name,c.city, c.grade, s.name, s.city
from customer as c
inner join
salesman as s
on s.salesman_id=c.salesman_id order by customer_id