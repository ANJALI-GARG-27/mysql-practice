-- Active: 1771577937723@@localhost@3306@mysql
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

--foreign key concept
create table posts (
     id int PRIMARY KEY , 
     content VARCHAR(50), 
     user_id int ,
     Foreign Key (user_id) REFERENCES instauser(id) );
insert into posts VALUES(101,"Hello World!",3),
(102,"Good morning guys!",2);

--truncate and delete
/* truncate table instauser; cannot truncate because its primary key is referenced by foreign key of posts table*/
TRUNCATE TABLE posts;
/* TRUNCATE TABLE instauser; still cannot truncate because posts table exists */
DROP TABLE posts;
TRUNCATE TABLE instauser; /* now it can be emptied*/
drop Table instauser;

DROP DATABASE IF EXISTS Instagram;
--Transaction queries 

CREATE DATABASE prime;
use prime;
CREATE table accounts(
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    balance DECIMAL(10,2)
);
insert INTO accounts(name,balance) VALUES("Dan",500.00),("Bob",300.00),("Alina",400.00);
SELECT * FROM accounts;

START TRANSACTION;
UPDATE accounts SET balance=balance-50 WHERE id=1;
UPDATE accounts SET balance=balance+50 WHERE id=2;
COMMIT;
ROLLBACK; --only undo uncommitted transactions

START TRANSACTION;
UPDATE accounts SET balance=balance+1000 WHERE id=1;
SAVEPOINT after_wallet_topup;
UPDATE accounts SET balance=balance+10 WHERE id=1;
ROLLBACK TO after_wallet_topup;
COMMIT;

--JOINS
CREATE TABLE customers(
    customer_id int PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);
CREATE Table orders(
    order_id int PRIMARY KEY,
    customer_id int,
    amount INT
);
INSERT INTO customers VALUES 
(1,"Alice","Mumbai"),
(2,"Jack","Delhi"),
(3,"Charlie","Bangalore"),
(4,"David","Mumbai");
INSERT INTO orders VALUES
(101,1,500),
(102,1,900),
(103,2,300),
(104,5,700);
--inner join
SELECT * from customers c 
INNER JOIN orders o 
ON c.customer_id=o.customer_id;
--left join or left outer join
SELECT * FROM customers c 
LEFT JOIN orders o 
ON c.customer_id=o.customer_id;
--right join or right outer join 
SELECT * FROM customers c 
RIGHT JOIN orders o 
ON c.customer_id=o.customer_id;

--outer join or full join
SELECT * FROM customers c 
LEFT JOIN orders o 
ON c.customer_id=o.customer_id
UNION
SELECT * FROM customers c 
RIGHT JOIN orders o 
ON c.customer_id=o.customer_id;
