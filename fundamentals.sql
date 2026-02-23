CREATE DATABASE dance_club;
drop DATABASE dance_club;
CREATE DATABASE Instagram;
use Instagram;
show databases;
CREATE Table User(
    id int PRIMARY KEY,
    age int ,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    followers int default 0,
    following int,
    constraint age_check check (age>=13)
)

insert into user (id, age, name, email, followers, following) 
VALUES (1,15,"Bob","bob123@gmail.com",200,250),
(2,14,"Aliza","aliza@yahoo.in",500,360),
(3,16,"Casey","casey2@gmail.com",200,300),
(4,14,"Daniel","dan45@gmail.com",140,178),
(5,17,"Frank","franky@yahoo.in",220,490)

--Using select, where clause and various operators in it 
select * from user;
select id ,age,name from user where age>15;

select id , name, followers from user 
where followers between 300 and 600;

select id,name from user WHERE name like "%a";

select name , age from user where age in (14,16);

select * from user where (following>200 AND followers>200);

select DISTINCT age from user ;

--order by clause
select * from user order by followers ASC;

select id,name,following from user
where age>14
order by following desc;

--group by clause , aggregate functions 
select count(id) from user ;
select age , count(id) from user
group by age;

insert into user values(6,16,"Anjali","anjali27@gmail.com",290,410);

select age, max(followers) from user 
group by age;

select age, avg(following) as Avg_following from user group by age;
