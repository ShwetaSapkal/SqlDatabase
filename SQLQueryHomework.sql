create table Salesman(
sid int primary key,
sname varchar(20),
city varchar(20),
commision int
)

create table Customer1(
cid int primary key,
cname varchar(20),
city varchar(20),
grade varchar(10),
sid int,
constraint fk_salesman_customer1 foreign key(sid) references Salesman(sid)
)

create table Order1(
oid int primary key,
purchase_amt int,
or_date date,
cid int,
sid int,
constraint fk_cust_ord foreign key(cid) references Customer1(cid),
constraint fk_cust_salesman foreign key(sid) references Salesman(sid)
)

select * from Salesman
select * from Customer1
select * from Order1


insert into Salesman values(1,'John','Pune',500)
insert into Salesman values(2,'Henry','Mumbai',300)
insert into Salesman values(3,'Donna','Nashik',400)
insert into Salesman values(4,'Henry','Pune',400)
insert into Salesman values(5,'Max','Delhi',700)



insert into Customer1 values(11,'Aarti','Karvenagar','A',1)
insert into Customer1 values(12,'Shweta','Germany','A+',1)
insert into Customer1 values(13,'Chaitali','Africa','A',2)
insert into Customer1 values(14,'Supriya','Austrelia','B',3)
insert into Customer1 values(15,'Namita','London','C',3)

insert into Order1 values(21,5000,'2022-05-28',11,1)
insert into Order1 values(22,7000,'2022-01-08',12,2)
insert into Order1 values(23,6000,'2021-10-10',13,3)
insert into Order1 values(24,2500,'2020-06-15',14,4)
insert into Order1 values(25,3400,'2021-09-17',15,5)


--No. of city in ascending order
select city ,count(cid) as CityCount from  Customer1
group by city

select * from  Salesman where city in('Pune','Mumbai')

 select s.sname,s.city,s.commision
	from Salesman s
	inner join Customer1 c on c.cid=c.cid
	where c.cname='Shweta' order by city

select city,count(cid)  as citycount from Customer1
	group by city having count(cid)<4