drop database if exists foo;
create database foo;

use foo;

create table bar(
	id int,
    name varchar(64),
    decimalNumber decimal (8,2),
    doubleNumber double
);

