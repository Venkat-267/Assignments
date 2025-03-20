create table shape(
id int identity,
name varchar(10)
)

create table color(
id int identity,
name varchar(20)
)

insert into shape values('square'),('circle'),('triangle'),('rectangle')

insert into color values('red'),('green'),('blue'),('black')
-- Cross Join

select s.name,c.name from shape s
cross join color c

select * from Trainee

alter table trainee add trainerid int

update Trainee set trainerid= 101 where skillID=202

select * from Trainee

--self join
select tr.name as trainer, tn.name as Trainee from trainee tr
join Trainee tn on tr.id=tn.trainerid