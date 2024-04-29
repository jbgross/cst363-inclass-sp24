use drug;
select * from doctor;
select * from patient;
insert into patient
(ssn, last_name, first_name, street, city, state, zip, birthdate, doctor_id)
values
("1234", "Smith", "Ms.", "123 Main St.", "Marina", "CA", 93933, "1901-01-01", 2);