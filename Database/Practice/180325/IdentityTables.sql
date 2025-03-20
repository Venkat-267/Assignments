create table trainee(
id int identity(100,1) primary key not null,
name varchar(50),
skill varchar(50)
);

insert into trainee
values('venkat','C,SQL');

select * from trainee

create table trainee2(
id int identity(100,1) not null,
name varchar(50),
skillid int not null,
TraineeSkill varchar(50) not null,
constraint PK_TSID primary key(id,skillid,TraineeSkill)
);