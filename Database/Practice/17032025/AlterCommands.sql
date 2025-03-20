-- create table

USE MarchDB;

create table employee(
Id INT IDENTITY PRIMARY KEY,
Name VARCHAR(65) NOT NULL,
mobilenumber bigint,
email varchar(max),
dob date,
license varchar(50),
passport varchar(50),

);

-- alter table
-- add columns

alter table employee add email_id varchar(50);

alter table employee alter column name varchar(80) not null;

-- delete and alter a column
alter table employee drop column email_id;

alter table employee alter column Id int not null;

alter table employee add constraint PK_ID Primary Key(Id);

alter table employee drop constraint PK;

-- drop a table

drop table Student;