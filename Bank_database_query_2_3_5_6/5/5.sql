-- This is starting command for check database and use database 
show databases;
create database bank_information;
use bank_information;

-- Create our table
create table branch(
    branchName varchar(30) primary key not  null,
    branchCity varchar(30),
    assets double
);

create table customer(
    customerName varchar(30) primary key not null,
    customerstreet varchar(30),
    customerCity varchar(30)
);

create table loan(
    loanNumber int primary key not null,
    branchName varchar(30),
    amount double,
    foreign key (branchName) references branch(branchName) on update cascade
);

create table borrower(
    customerName varchar(30),
    loanNumber int,
    foreign key (customerName) references customer(customerName) on update cascade,
    foreign key (loanNumber) references loan(loanNumber) on update cascade
);

create table account(
    accountNumber int primary key not  null,
    balance double,
    branchName varchar(30),
    foreign key (branchName) references branch(branchName) on update cascade
);

create table depositor(
    customerName varchar(30),
    accountNumber int,
    foreign key (customerName) references customer(customerName) on update cascade,
    foreign key (accountNumber) references account(accountNumber) on update cascade
);

-- Insert data or values in our tables
Insert into branch (branchName,branchCity,assets) 
values 
('Narayangonj','23/7 Chasara,Narayangonj',300000),
('Munshigonj','25/7 Bikrompur,Munshigonj',3000000),
('Mirpur','2B/3 Sheorapara,Mirpur',200000),
('Dhanmondi','32/A Shukrabad,Dhanmondi',100000),
('Mohakhali','2/A Posta,Mohakhali',350000),
('Mohammadpur','4/C Lalmatia,Mohammadpur',30000000);
select * from branch;

Insert into customer (customerName,customerStreet,customerCity)
values
('Saiful Islam Rasel','Sastapur,Fatullah','Narayangonj'),
('Jahidul Islam Apu','Bakshi-bazar,Lalbag','Dhaka'),
('Jahirul Islam Roni','Modhu-bazar,Dhanmondi','Dhaka'),
('Atikur Rahman','Town-hall,Mohammadpur','Dhaka'),
('Sazzad Hossain','Gabtoli','Dhaka'),
('Rakib Hossain','Basabo','Dhaka');
select * from customer;

Insert into loan (loanNumber,branchName,amount)
values
(101,'Narayangonj',1000),
(102,'Munshigonj',500),
(104,'Mirpur',2000),
(103,'Dhanmondi',3000),
(105,'Mohakhali',10000);
select * from loan;

Insert into borrower (loanNumber,customerName)
values
(101,'Saiful Islam Rasel'),
(102,'Jahirul Islam Roni'),
(104,'Atikur Rahman'),
(103,'Sazzad Hossain');
select * from borrower;

Insert into account (accountNumber,balance,branchName) 
values 
(17045,10000,'Narayangonj'),
(17047,5000,'Mohakhali'),
(17034,3000,'Mohakhali'),
(17081,4000,'Mohakhali'),
(17087,8000,'Dhanmondi');
select * from account;

Insert into depositor (accountNumber,customerName)
values 
(17045,'Saiful Islam Rasel'),
(17034,'Jahidul Islam Apu'),
(17047,'Jahirul Islam Roni'),
(17087,'Atikur Rahman'),
(17081,'Sazzad Hossain');
select * from depositor;

-- Start Query
Select * from borrower;

select depositor.customerName from depositor
inner join account on account.accountNumber=depositor.accountNumber
where account.branchName='Dhanmondi'
order by depositor.customerName;
        or,
select customerName from depositor
where accountNumber in(select accountNumber from account where branchName='Dhanmondi')
order by customerName;