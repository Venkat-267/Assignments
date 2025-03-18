-- To create database write DDl query
-- Syntax: create database UserDefined_Database_Name
create database test;

select name from master.sys.databases;
select * from master.sys.master_files;

call store procedure to get the list of databases

exec sp_databases;   

-- Alter database with name

alter database test modify name=MarchDB;

-- drop db from physical path

drop database TestDB;

-- test database exist

drop database if exists TestDB1;