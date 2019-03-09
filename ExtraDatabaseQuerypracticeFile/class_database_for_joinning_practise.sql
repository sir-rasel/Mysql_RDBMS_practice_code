
-- create and use database
show databases;
create database class;
use class;

-- create table
create table student(
    studentID int primary key not null,
    phoneNumber varchar(15),
    studentName varchar(30)
);

create table course(
    courseID int primary key not null,
    studentID int,
    courseName varchar(30),
    departmentName varchar(10)
);

-- Insert data into table
Insert into student (studentID,phoneNumber,studentName)
values 
(17044,'01670184116','Towhid Ripon'),
(17045,'01840167116','Saiful Islam Rasel'),
(17034,'01955064622','Jahidul Islam Rasel'),
(17047,'01706209692','Jahirul Islam Roni');
select * from student;

Insert into course (courseID,studentID,courseName,departmentName)
values
(1104,17046,'Electrical Circuit','Diploma'),
(1105,17056,'Social Science','Civil'),
(1101,17045,'Database management system','CSE'),
(1102,17034,'Electrical engineering','ECE'),
(1103,17047,'Basic Accounting','BBA');
select * from course;

-- start query
select studentName,courseName from student
inner join course on student.studentID = course.studentID;

select studentName,phoneNumber,courseName from student
left outer join course on student.studentID = course.studentID;

select studentName,courseName,departmentName from student
right outer join course on student.studentID = course.studentID;

select studentName,phoneNumber,courseName from student
left outer join course on student.studentID = course.studentID
union
select studentName,courseName,departmentName from student
right outer join course on student.studentID = course.studentID;
