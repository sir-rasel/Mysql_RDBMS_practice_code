-- database create and use
show databases;
create database company_database;
use company_database;
 
-- create table 
create table lives(
    personName varchar(30) primary key not null,
    city varchar(30),
    street varchar(30)
);
 
create table location(
    companyName varchar(50) primary key not null,
    city varchar(30)
);
 
create table works(
    salary double,
    personName varchar(30) not null,
    companyName varchar(50) not null,
    foreign key(personName) references lives(personName) on delete cascade on update cascade,
    foreign key(companyName) references location(companyName) on delete cascade on update cascade
);
 
create table manages(
    personName varchar(30),
    managerName varchar(50) primary key not null,
    foreign key(personName) references lives(personName) on delete cascade on update cascade
);
show tables;
 
-- Insert data
Insert into lives (personName,street,city)
values
('karim','277/A','Narayangonj'),
('Saiful Islam Rasel','27/A','Narayangonj'),
('Jahirul Islam Roni','28/B','Dhanmondi'),
('Jahidul Islam Opu','29/C','Bakshibazar'),
('Jahirul Islam Chowdhury','12/A','Shonirakhra'),
('MD. Atikullah','20/F','Lalmatia');
 
Insert into location (companyName,city)
values
('SIR SOFT','Narayangonj'),
('IST','Dhanmondi'),
('Chankharpul IT','Bakshibazar'),
('Dimension IT','Shukrabad'),
('Divine IT','Uttora');
 
Insert into works(personName,companyName,salary)
values
('Saiful Islam Rasel','SIR SOFT',50000),
('Jahirul Islam Roni','Dimension IT',20000),
('MD. Atikullah','IST',30000),
('Jahidul Islam Opu','Chankharpul IT',15000);
 
Insert into manages(personName,managerName)
values
('Jahirul Islam Roni','Saiful Islam Rasel'),
('Saiful Islam Rasel','Rasel'),
('Jahidul Islam Opu','Selim Patoary'),
('MD. Atikullah','M.A. Mazid');
 
-- starting query
select lives.personName,lives.city,managerName
from lives inner join works on lives.personName=works.personName
inner join manages on lives.personName=manages.personName
where works.companyName='SIR SOFT';

 select personName from works
 where companyName!='Dimension IT';