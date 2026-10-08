create database unidb;

use unidb;

create table department (
    deptid int primary key,
    deptname varchar(50)
);

create table instructor (
    instid int primary key,
    [name] varchar(50),
    specialization varchar(50),
    deptid int,

    foreign key (deptid)
    references department(deptid)
);

create table students (
    studentid int primary key,
    name varchar(50),
    age int,
    deptid int,

    foreign key (deptid)
    references department(deptid)
);

create table course (
    courseid int primary key,
    coursename varchar(50),
    deptid int,
    instid int,

    foreign key (deptid)
    references department(deptid),

    foreign key (instid)
    references instructor(instid)
);

create table enrollment (
    studentid int,
    courseid int,
    grade char(2),

    primary key (studentid, courseid),

    foreign key (studentid)
    references students(studentid),

    foreign key (courseid)
    references course(courseid)
);

insert into department values
(1, 'Computer Science'),
(2, 'Business'),
(3, 'Engineering');

insert into instructor values
(101, 'Ahmed Ali', 'Database', 1),
(102, 'Sara Mohamed', 'Marketing', 2),
(103, 'Khaled Samy', 'Networks', 1);

insert into students values
(201, 'Youssef', 20, 1),
(202, 'Omar', 21, 2),
(203, 'Mariam', 19, 1),
(204, 'Nada', 22, 3);

insert into course values
(301, 'SQL Basics', 1, 101),
(302, 'Marketing 101', 2, 102),
(303, 'Computer Networks', 1, 103);

insert into enrollment values
(201, 301, 'A'),
(203, 301, 'B'),
(202, 302, 'A'),
(201, 303, 'B'),
(204, 303, 'C');

select * from department;
select * from instructor;
select * from students;
select * from course;
select * from enrollment;

select students.name as studentname,
       students.age,
       department.deptname
from students
inner join department
on students.deptid = department.deptid;

select course.coursename,
       instructor.name as instructorname
from course
inner join instructor
on course.instid = instructor.instid;

select * 
from students
where age > 20;

select coursename
from course
where deptid = 1;

select students.name,
       enrollment.grade
from enrollment
inner join students
on enrollment.studentid = students.studentid
where grade = 'A';
