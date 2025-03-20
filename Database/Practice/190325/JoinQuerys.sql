Use MarchDB;

select * from skill;
select * from Trainee;

-- Inner Join Query
select * from skill s
INNER JOIN Trainee t
on s.ID=t.skillID;

-- alter table trainee alter column skillID int null;
-- insert into Trainee (name) values('rt')

-- insert into skill values('React'),('Cloud')

--  left join
select * from skill s
left join Trainee t
on s.id=t.skillID
where t.skillID is not null

-- right join
select s.name as CourseName, t.name as TraineeName from skill s
right join Trainee t on s.id=t.skillID
where t.skillID is null

-- Full outer Join
select s.name as CourseName, t.name as TraineeName from skill s
FULL JOIN Trainee T
on s.id=t.skillID
where t.skillID is not null

-- Count of courses
select s.name as CourseName, count(t.skillID) as EnrolledCount from skill s
INNER JOIN Trainee t
on s.id=t.skillID
group by s.name;


-- INNER JOIN on 3 Tables
create table Trainer(
id int IDENTITY(100,1) PRIMARY KEY,
name varchar(50),
)

insert into Trainer values('as'),('dd'),('df'),('gh');

alter table skill add Trainer_ID int null constraint FK_Trainer Foreign Key references Trainer(id);

select* from Trainer;

select * from skill;
select * from Trainee;

-- update skill set Trainer_ID=103 where id in (204,206)

select tr.name as TrainerName, s.name as CourseName, t.name as Trainee
from Trainer tr
INNER JOIN skill s on tr.id=s.Trainer_ID
INNER JOIN trainee t on t.skillID=s.id;