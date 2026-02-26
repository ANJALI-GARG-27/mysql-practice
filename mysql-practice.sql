-- Active: 1771577937723@@localhost@3306@college
CREATE DATABASE IF NOT EXISTS college;
use college;
-- create teacher table
create table Teachers( ID int PRIMARY KEY, Name varchar(50) UNIQUE, Subject varchar(50) ,Salary int );
-- insert data into the table 
INSERT INTO teachers(ID,`Name`,`Subject`,`Salary`) VALUES
(23,"Ajay","Maths",50000),
(47,"Bharat","English",60000),
(18,"Chetan","Chemistry",45000),
(9,"Divya","Physics",75000);
-- show all entries 
SELECT * FROM teachers;
/* select teachers whose salary is more than 55k */
SELECT * FROM teachers where `Salary`>55000; 
/*Rename the salary column of teacher table to ctc*/
ALTER TABLE teachers CHANGE COLUMN Salary ctc int ;
/* Update salary of all teachers by giving them an increment of 25% */
UPDATE teachers SET ctc=1.25 * ctc;
/* Add a new column for teachers called city . The default city should be "Gurgaon". */
ALTER TABLE teachers ADD COLUMN city varchar(20) DEFAULT "Gurgaon";
/* Delete the salary column for teacher table */
ALTER TABLE teachers DROP COLUMN ctc;

/*create a table to store student info (roll no ,name,city,marks)*/
CREATE TABLE student(Rollno int PRIMARY KEY, name VARCHAR(30),city VARCHAR(20),marks INT);
INSERT INTO student VALUES
(110,"Adam","Delhi",76),
(108,"Bob","Mumbai",65),
(124,"Casey","Pune",94),
(112,"Duke","Pune",80);
