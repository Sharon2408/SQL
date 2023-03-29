use NF1

create table country (
id int primary key,
country_name char(128),
country_name_eng char(128),
country_code char(8)
)

create table city(
id int primary key,
city_name char(128),
lat decimal(9,6),
long decimal(9,6),
country_id int foreign key references country(id)
)

create table employee1 (
id int primary key,
first_name varchar(255),
last_name varchar(255)
)

create table customer (
id int primary key,
customer_name varchar(255),
city_id int foreign key references city(id),
customer_address varchar(255),
next_call_date date not null,
ts_inserted datetime
)

create table call (
id int primary key,
employee_id int foreign key references employee1(id),
customer_id int foreign key references customer(id),
start_time datetime,
end_time datetime not null,
call_outcome_id int not null foreign key references call_outcome(id))

create table call_outcome (
id int primary key,
outcome_text char(128)
)

