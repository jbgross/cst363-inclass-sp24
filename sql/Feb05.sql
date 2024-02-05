create database if not exists foo;
use foo;
drop table if exists quux;
create table quux (
	id int,
    name varchar(32) -- not null

);

insert into quux (name, id) values ('Calendar', 3);
insert into quux (name, id) values ('Calendars', 5);
insert into quux (name, id) values ('Caldara', 6);
insert into quux (name, id) values ('Caldarina', 7);
-- insert into quux (id) values (8);
insert into quux (name, id) values ('', 9);
-- insert into quux values ('hello', 10);
insert into quux (name, id) values ('dar', 4);
insert into quux 
(name, id) 
values 
('blah', 11),
('blah', 11),
('blorp', 12)
;
select * from quux where name = 'Calendar';
select * from quux where name like '%dar%';
select * from quux where name like '%dar_';
select * from quux where name like '%dar_%';

select * from quux where name like '%';
-- CRUD

select * from quux;
select * from quux where name is null;
select * from quux where name is not null;
UPDATE 
	quux
SET
	id = id + 1;

UPDATE 
	quux
SET
	id = id + 1,
    name = null
WHERE
	id > 10;

DELETE FROM
quux
WHERE
name is null;

-- DELETE FROM
-- uux
-- WHERE id > 10;