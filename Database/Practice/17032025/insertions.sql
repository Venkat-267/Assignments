USE MarchDB;

INSERT INTO employee (name,mobilenumber,email,dob,license,passport)
values('Venkta',3456789,'fghj','2003-09-18','vbh','khbjhbj');

select * from dbo.employee;

select e.Id as employee_ID, e.Name as Employee_name, e.mobilenumber as Employee_Number from employee e;

-- license and passport need to be unique

--altering records
update employee set name='Jy',mobilenumber=456780987 where id= 5;

--remove record
delete from employee where id=5;