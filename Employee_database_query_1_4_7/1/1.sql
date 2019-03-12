-- create database and use it
show databases;
create database employee;
use employee;


-- create table on database
create table employee(
    employeeName varchar(30) primary key not null,
    street varchar(30),
    city varchar(30)
);

create table company(
    companyName varchar(30) primary key not null,
    city varchar(30)
);

create table manages(
    employeeName varchar(30),
    managerName varchar(30) primary key not null,
    foreign key (employeeName) references employee(employeeName) on update cascade on delete cascade
);

create table works(
    employeeName varchar(30),
    companyName varchar(30),
    salary double not null,
    foreign key (employeeName) references employee(employeeName) on delete cascade on update cascade,
    foreign key (companyName) references company(companyName) on update cascade on delete cascade
);

-- insert data into table
insert into employee(employeeName,street,city)
values
('Saiful Islam Rasel','21/A','Narayangonj'),
('Jahidul Islam Apu','21/C','Dhaka'),
('Jahirul Islam Roni','22/A','Dhaka'),
('Atikur Rahman','24/A','Dhaka'),
('Sazzad Hossain','26/A','Dhaka'),
('Rakib Hossain','32/A','Dhaka');
select * from employee;

insert into company(companyName,city)
values
('SIR SOFT','Narayangonj'),
('Lalbag IT','Dhaka'),
('Dimension IT','Dhaka'),
('IST','Dhaka'),
('Pathao','Dhaka'),
('LOL','Dhaka');
select * from company;

insert into manages(employeeName,managerName)
values
('Saiful Islam Rasel','SIR'),
('Jahidul Islam Apu','SIR'),
('Jahirul Islam Roni','Sazzad'),
('Atikur Rahman','MA Majid'),
('Sazzad Hossain','Opu'),
('Rakib Hossain','Jitu');
select * from manages;

insert into works(employeeName,companyName,salary)
values
('Saiful Islam Rasel','SIR SOFT',200000),
('Jahidul Islam Apu','SIR SOFT',20000),
('Jahirul Islam Roni','Dimension IT',15000),
('Atikur Rahman','IST',40000),
('Sazzad Hossain','Pathao',150000),
('Rakib Hossain','LOL',15000);
select * from works;

-- query

-- find name,city,salaries of employee
select works.employeeName,employee.city,works.salary
from employee inner join works on works.employeeName=employee.employeeName
where works.companyName='SIR SOFT';

-- total salaries of each company
select sum(salary) as totalSalary,companyName from works
group by companyName;