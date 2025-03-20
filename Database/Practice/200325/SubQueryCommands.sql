use MarchDB;

create table product(
pid int identity(200,1) primary key,
pname varchar(50),
pprize bigint
)

insert into product values('pen',30),('notebook',10),('laptop',70000),('toy',300)
insert into product values('Eraser',10)
create table orders(
oid int identity(200,1) primary key,
orderdate date,
pid int foreign key references product(pid)
)

select * from product

insert into orders values(GETDATE(),201),(GETDATE(),202),(GETDATE(),200),(GETDATE(),203)
insert into orders values(GETDATE(),(210))
-- Subquery in Insertion
insert into orders values(GETDATE(),(select pid from product where pname='toy'))
select * from orders

insert into orders (orderdate) values(GETDATE())

-- Subquery in update
update orders set pid=(select pid from product where pname='toy') where pid is null;


-- Subquery in Delete
delete from product where pid not in (select pid from orders)

-- Subquery in Select
select pname, pprize from product where pprize>=(select avg(pprize) from product)

select pname, pprize from product group by pname,pprize

select count(pid),pprize, pname from product group by pname,pprize

select pprize, pname from product  where pprize IN (select avg(pprize) from product group by pname)

select avg(pprize),pname from product group by pname
select pprize, pname from product where pprize <=Any (select avg(pprize) from product group by pname)

-- Subquery in from
select pname,pprize from (select * from product) as tables

-- Corelated sub queries
select p.pid,p.pname,(select COUNT(pid)from orders where pid =p.pid ) as Total_Order from product p

select p.pid,p.pname,(select COUNT(pid)from orders where pid =p.pid group by pid ) as Total_Order from product p

-- using join
select p.pid,p.pname, count(o.pid) as totalOrder from product p
INNER JOIN orders o
on p.pid=o.pid
group by p.pname, p.pid