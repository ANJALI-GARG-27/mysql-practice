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

--having clause 
select age, count(id) from user 
group by age
having max(followers)<400

select age,min(followers) from user 
group by age 
having max(followers)>300;

--limit clause
select * from user 
where followers<500
limit 3;

--update 
UPDATE user 
set followers=600 where age=16;
select * from user;
update user 
set name="Cathey", email="cathey@yahoo.in" where id=3;

update user set followers=500 where name like "%i";

--delete existing rows
DELETE FROM `user` where following <200;

--alter the schema
alter Table `user` 
add COLUMN city VARCHAR(10) DEFAULT "Delhi";

alter table `user` 
drop column age;

alter table `user`
rename to instauser;

select * from instauser;

alter TABLE instauser 
change COLUMN followers subs int default 0;

alter table instauser
MODIFY subs int DEFAULT 5;

insert into instauser(id,name,email,following,city) 
VALUES (7,"Barbie","barbs5@gmail.com",490,"Bombay");
select * from instauser where id=7;