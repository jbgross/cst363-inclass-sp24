DROP DATABASE sandwich;
create database if not exists sandwich;
use sandwich;

drop table if exists sandwich_type;
CREATE TABLE sandwich_type
(
    sandwich_type_id int auto_increment primary key,
    name varchar(32) not null,
    price decimal (6,2) check (price > 0),
    calories int
);

INSERT INTO sandwich_type
(name, price, calories)
VALUES
("Veggie", 8, 320),
("Reuben", 10, 600),
("Premium Deluxe", 12, 500);

DROP TABLE IF EXISTS person;
CREATE TABLE person
(
    person_id int auto_increment primary key,
    name varchar(32) not null,
    phone varchar(32)
);

INSERT INTO person
(name)
VALUES
("Raul"),
("Dakota"),
("Kate");

DROP TABLE IF EXISTS sandwich_order;
CREATE TABLE sandwich_order
(
    person_id int not null,
    sandwich_type_id int not null,
    CONSTRAINT FOREIGN KEY fk_sandwich_order_person (person_id) REFERENCES person (person_id),
    CONSTRAINT FOREIGN KEY fk_sandwich_order_sandwich_type (sandwich_type_id)
        REFERENCES sandwich_type (sandwich_type_id)
);

INSERT INTO sandwich_order
(person_id, sandwich_type_id)
VALUES
(1, 2),
(2, 2),
(3, 3);


SELECT
    *
FROM
    person p
JOIN
    sandwich_order so USING (person_id)
;

SELECT
    *
FROM
    person p,
    sandwich_order so
WHERE
    p.person_id = so.person_id
;

SELECT
    *
FROM
    person p
JOIN
    sandwich_order so ON (p.person_id = so.person_id)
;

SELECT
    *
FROM
    person p
JOIN
    sandwich_order so ON (p.person_id = so.person_id)
JOIN
    sandwich_type st ON (so.sandwich_type_id = st.sandwich_type_id)
;

SELECT
    p.name, st.name
FROM
    person p
JOIN
    sandwich_order so ON (p.person_id = so.person_id)
JOIN
    sandwich_type st ON (so.sandwich_type_id = st.sandwich_type_id)
;

SELECT
	st.name,
    count(*)
FROM
	sandwich_order so
RIGHT JOIN
	sandwich_type st 
		ON (so.sandwich_type_id = st.sandwich_type_id)
GROUP BY
	so.sandwich_type_id
;