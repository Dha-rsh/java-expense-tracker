create database expense_tracker;
use expense_tracker;

create table users(
 id int Auto_increment primary key,
 name varchar(100),
 email varchar(100) unique,
 password varchar(100)
 
);
select * from  users;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM expenses;
DELETE FROM users;
SET SQL_SAFE_UPDATES = 1; -- Optional: turn it back on after


create table expenses(
id int auto_increment primary key,
user_id int,
foreign key (user_id) references users(id),
amount decimal(10,2),
category varchar(50), 
description text,
date date
);
select * from expenses where id=6;
select * from expenses;
DELETE FROM expenses ;
ALTER TABLE expenses AUTO_INCREMENT = 1;
alter table users auto_increment=1;


