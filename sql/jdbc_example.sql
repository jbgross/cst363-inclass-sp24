drop database if exists jdbctest;
create database jdbctest;
use jdbctest;
drop table if exists person;
create table person (
	personid int primary key AUTO_INCREMENT,
    name varchar(32) not null,
    age int null
);

insert into person (name, age) value ("Hector", 20);
insert into person (name, age) value ("Eliza", null);