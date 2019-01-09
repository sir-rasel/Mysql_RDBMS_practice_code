-- This is starting command for check database and use database 
show databases;
create database bank_information;
use bank_information;

-- Create our table
create table account(
    accountNumber int primary key not  null,
    balance double
);

create table branch(
    branchName varchar(30) primary key not  null,
    address varchar(30)
);

create table customer(
    customerName varchar(30) primary key not null,
    CustomerAddress varchar(30)
);

create table loan(
    loanNumber int primary key not null,
    amount double
);

-- Create relational Table
create table account_branch(
    accountNumber int,
    branchName varchar(30),
    foreign key (accountNumber) references account(accountNumber),
    foreign key (branchName) references branch(branchName)
);

create table loan_branch(
    loanNumber int,
    branchName varchar(30),
    foreign key (loanNumber) references loan(loanNumber),
    foreign key (branchName) references branch(branchName)
);

create table depositor(
    accountNumber int,
    customerName varchar(30),
    foreign key (accountNumber) references account(accountNumber),
    foreign key (customerName) references customer(customerName)
);

create table borrower(
    loanNumber int,
    customerName varchar(30),
    foreign key (loanNumber) references loan(loanNumber),
    foreign key (customerName) references customer(customerName)
);
show tables;

-- Insert data or values in our tables
Insert into account (accountNumber,balance) 
values 
(17045,10000),
(17047,5000),
(17034,3000),
(17081,4000),
(17087,8000);
select * from account;

Insert into branch (branchName,address) 
values 
('Narayangonj','23/7 Chasara,Narayangonj'),
('Munshigonj','25/7 Bikrompur,Munshigonj'),
('Mirpur','2B/3 Sheorapara,Mirpur'),
('Dhanmondi','32/A Shukrabad,Dhanmondi'),
('Lalbag','2/A Posta,Lalbag'),
('Mohammadpur','4/C Lalmatia,Mohammadpur');
select * from branch;

Insert into loan (loanNumber,amount)
values
(101,1000),
(102,500),
(104,2000),
(103,3000),
(105,10000);
select * from loan;

Insert into customer (CustomerName,CustomerAddress)
values
('Saiful Islam Rasel','Sastapur,Fatullah,Narayangonj'),
('Jahidul Islam Apu','Bakshi-bazar,Lalbag,Dhaka'),
('Jahirul Islam Roni','Modhu-bazar,Dhanmondi,Dhaka'),
('Atikur Rahman','Town-hall,Mohammadpur,Dhaka'),
('Sazzad Hossain','Gabtoli,Dhaka'),
('Rakib Hossain','Basabo,Dhaka');
select * from customer;

Insert into account_branch (accountNumber,branchName)
values
(17045,'Narayangonj'),
(17047,'Dhanmondi'),
(17081,'Mirpur'),
(17087,'Mohammadpur');
select * from account_branch;

Insert into loan_branch (loanNumber,branchName)
values
(101,'Dhanmondi'),
(102,'Narayangonj'),
(105,'Mohammadpur');
select * from loan_branch;

Insert into depositor (accountNumber,customerName)
values 
(17045,'Saiful Islam Rasel'),
(17047,'Jahirul Islam Roni'),
(17087,'Atikur Rahman'),
(17081,'Sazzad Hossain');
select * from depositor;

Insert into borrower (loanNumber,customerName)
values
(101,'Saiful Islam Rasel'),
(102,'Jahirul Islam Roni'),
(104,'Atikur Rahman'),
(103,'Sazzad Hossain');
select * from borrower;

-- Start Query

Select customerName from customer
where customerName not in 
(select customerName from borrower);

delete from borrower where
loanNumber in (select loanNumber from loan where amount between 500 and 2000);