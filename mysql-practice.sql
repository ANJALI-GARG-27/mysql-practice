CREATE DATABASE IF NOT EXISTS college;
use college;
create table Students( id int PRIMARY KEY, name varchar(30) UNIQUE, email varchar(50) ,marks int );
