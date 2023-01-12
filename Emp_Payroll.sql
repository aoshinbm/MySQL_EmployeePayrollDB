create database payroll_service;
show databases;
use payroll_service;

create table EmployeePayroll (
emp_id int Primary Key AUTO_INCREMENT,
name varchar(30),
salary int,
start_date date );
desc EmployeePayroll;

insert into EmployeePayroll
values 
(1,"Regina",23000,"2019-8-14"),
(2,"Pinku",17000,"2004-1-1");

insert into EmployeePayroll
(name,salary,start_date)
values
("Romaa",30000,"2014-8-12"),
("Pinku",17000,"2008-10-21"),
("Zeeshan",77000,"2003-1-2");

select * from EmployeePayroll;

select salary,name,start_date from EmployeePayroll
where name="Zain";
select name,salary,start_date from EmployeePayroll
where start_date between CAST("2018-1-1" as DATE) and DATE(NOW());
select * from EmployeePayroll
where start_date between CAST("2018-1-1" as DATE) and DATE(NOW());
    
alter table EmployeePayroll
add gender varchar(150) not null;
desc EmployeePayroll;


UPDATE EmployeePayroll
SET gender = "female"
WHERE emp_id = 1;
UPDATE EmployeePayroll
SET gender = "female"
WHERE name="Romaa";
UPDATE EmployeePayroll
SET gender = "male"
WHERE salary=23450;
UPDATE EmployeePayroll
SET gender = "male"
WHERE emp_id = 2;
UPDATE EmployeePayroll
SET gender = "female"
WHERE name="Pinku";

select * from EmployeePayroll;

select sum(salary) from EmployeePayroll
where gender="female" group by gender;
select sum(salary) from EmployeePayroll;

select min(salary) from EmployeePayroll
where gender="male" group by gender;
select min(salary) from EmployeePayroll;

select max(salary) from EmployeePayroll
where gender="male" group by gender;
select max(salary) from EmployeePayroll
where gender="female" group by gender;

select count(name) from EmployeePayroll
where gender="female" group by gender;
select count(name) from EmployeePayroll
where gender="male" group by gender;
select count(*) from EmployeePayroll;

alter table EmployeePayroll
add department_name varchar(150) not null;
alter table EmployeePayroll
add address varchar(500) default "TBD";alter table EmployeePayroll
add phonenumber int;
desc EmployeePayroll;

insert into EmployeePayroll
values (7,"Ramesh",67000,"2014-1-1","male",778954321,"Hr","");
select * from EmployeePayroll;

alter table EmployeePayroll
add basic_pay decimal not null;
alter table EmployeePayroll
add deductions decimal not null;
alter table EmployeePayroll
add taxable_pay decimal not null;
alter table EmployeePayroll
add income_tax decimal not null;
alter table EmployeePayroll
add net_pay decimal not null;

insert into EmployeePayroll
(emp_id,name,department_name,gender,basic_pay,deductions,taxable_pay,income_tax,net_pay,start_date,
salary,phonenumber,address)
values
(8,"Terissa","Sales","female",300000,0,0,0,0,"2019-11-13",35000,0,""),
(9,"Terissa","Marketing","female",300000,10000,25000,5000,20000,"2018-1-3",30000,0,"");
select * from EmployeePayroll;

create table Department (
department_id int Primary Key AUTO_INCREMENT,
department_name varchar(30),
startdate_dept date );
desc Department;

create table salary (
basic_pay decimal primary key,
deductions decimal not null,
taxable_pay decimal not null,
income_tax decimal not null,
net_pay decimal not null);
desc salary;

SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE EmployeePayroll
ADD FOREIGN KEY (basic_pay) REFERENCES salary(basic_pay);

alter table employeepayroll
add foreign key (department_name)
references department(department_name);

desc employeepayroll;