use MarchDB;

--parent table

create table skill(
ID int identity(200,1) primary key not null,
name varchar(50)
)

--child table
create table Trainee(
ID int identity(100,1) primary key not null,
name varchar(50),
skillID int not null,
constraint FK_Skill foreign key(skillID) references skill(ID) 
)

insert into skill values('C#'),('C++'),('Java'),('Python'),('AI'),('Data Science')

insert into trainee values('VJ',203),('kay',203),('hj',204)

select * from skill

select * from trainee order by id desc

--delete a record in skill

delete from skill where ID=202

insert into trainee values('asd',202)

-- delete reffred record from child and then parent

delete from Trainee where skillID=202

update skill set name='Java' where ID=202
 
select * from trainee order by name

select * from Trainee order by name offset 2 row
fetch next 2 rows only;

select * from trainee order by name

select count(name), skillID from Trainee group by skillID having skillID>=202

select count(name), skillID from Trainee where name LIKE 'ka%' group by skillID having skillID>=202