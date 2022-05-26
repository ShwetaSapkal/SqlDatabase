-- 26/05/2022
--mysql
--create table course(
--id int,
--name varchar(20),
--primary key(id)
--)

--  (1) course
create table courses2(
Id int,
Name varchar(20),
constraint pk_course primary key(Id) -- create constraint by usnig label
)

alter table courses2 drop constraint pk_course

alter table courses2 add constraint pk_course primary key(Id)

select * from courses2

--(2) Person
select * from person
sp_help person
alter table person alter column personId int not null 
alter table person add constraint pk_person primary key(personId)

--(3) Order

create table Orders(
orderId int,
orderNo int,
personId int,
constraint pk_order primary key(orderId),
constraint pk_order_person foreign key(personId) references person(personId)
)

sp_help Orders

alter table Orders add constraint pk_order_person1 foreign key(personId) references person(personId)

-- To drop a constraint
alter table Orders drop constraint pk_order_person 

--mysql ( To drop a constraint )
--alter table Orders drop constraint foreign key pk_order_person1


--check
select * from person

create table person(
personId int,
name varchar(40),
age int,
constraint chk_age check(age>=18) -- while creating table
)

alter table person add age int not null

alter table person add constraint chk_age check(age>=18) -- in existing table

alter table person drop constraint chk_age -- to delete constraint

-- mysql  ( to delete constraint )
-- alter table person drop check chk_age 

-- default

create table person(
personId int,
name varchar(40),
age int,
country varchar(20) default 'India'  --- while creating table
constraint chk_age check(age>=18) 
)

-- if table is alredy existed & want to add column with default value 
alter table person add country varchar(20) default 'India' 

-- if column is alredy exist
alter table person add constraint default_con default 'India' for country

-- mysql
-- alter table person alter country set default 'India'

-- oracle
-- alter table person modify country default 'India'

-- Index-(we can apply index on non-PK column and on PK )

-- non-PK
create index index_person on person(name,country);

-- for pk
create unique index index_person2 on person(personId);

select * from person

drop index person.index_person2

-- mysql
--alter table person drop index index_person2


-- Identity

create table person(
personId int primary key identity(1,1)
)

alter table person add personId int identity(1,1)

-- mysql
--create table person(
--personId int primary key identity autoincrement
--)


--DDL
truncate table person

drop table person 

-- DML

select * from person

insert into person values(1,'Shweta',20,'India')
insert into person values(2,'Supriya',19,'India')
insert into person values(3,'Sneha',21,'India')
insert into person values(4,'Shubham',21,'India')
insert into person values(5,'Sharayu',47,'India')
insert into person values(6,'Chaitali',20,'India')
insert into person values(7,'Pooja',21,'India')
insert into person values(8,'Shivani',19,'India')
insert into person values(9,'Sampada',23,'India')
insert into person values(10,'Meghna',22,'India')


update person set age=25 where personId=2
update person set country='USA' where personId=3
update person set country='USA' where personId=4
update person set country='UK' where personId=5
update person set country='UK' where personId=6

delete from person where personId=7


-- DQL

select * from person

select name,age from person

select name,age from person where personId=1

select * from person where personId=5

-- takes unique values
select distinct country from person 

-- O/P - India
--		 USA

select distinct name from person

select * from person where personId<=3

-- <> not operator in Database 
select * from person where personId<>3

select * from person where personId<5

select * from person where personId>7

select * from person where personId>=6

select * from person where personId=5

-- to display data between the range between and operator
select * from person where age between 23 and 27

-- in operator select the mltiple possile values
select * from person where personId in(1,2,3)
select * from person where personId not in(1,2,3)

select * from person where country in('USA','India')
select * from person where country in('USA')
select * from person where country not in('USA','UK')
select * from person where country not in('USA','UK','Austrelia')


-- and / or / not operator 
select * from person where country='USA' or country='India'
select * from person where country='USA' or age=22
select * from person where country='India' or age<=20

select * from person where country='India' and age=19
select * from person where country='India' and age<=22
select * from person where not country='India' 


-- like operator in sql

-- 1] name starts with m
select * from person where name like'm%' 
select * from person where name like's%'

select * from person where name not like'm%' 

-- 2] name starts with m
select * from person where name like'%a' -- name ends with a

-- name starts with any letter ends with any letter but having i letter
select * from person where name like'%i%'

-- Full match letter start with M having next 2 more letters
select * from person where name like'M_____'
select * from person where name like'____a'

select * from person where name like'[sm]%'
select * from person where name like'%[sm]'
select * from person where name like'%[sm]%'

select * from person where name like'%[m-s]%'


-- null values in null
insert into person values(11,'Namita',24,null)
insert into person values(12,'Meera',25,null)

select * from person
-- is null
select * from person where country is null

-- is not null
select * from person where country is not null

-- alias
select name as PersonName from person where country is null



-- Order By Clause in Sql -Sort the data
select * from person
order by name

select * from person
order by name desc


select * from person
order by country desc

select * from person
order by country 

select * from person
order by age



-- Aggregate Function
-- 1] count, 2] sum, 3] avg ,

create table tblEmp(
id int primary key identity(1,1),
name varchar(20),
salary numeric(10,2),
city varchar(20),
deptname varchar(15)
)

insert into tblEmp values('Shweta',30000,'Pune','Accountant')
insert into tblEmp values('Pooja',35000,'Nanded','HR')
insert into tblEmp values('Chaitali',40000,'Ahmednagar','Developer')
insert into tblEmp values('Shubham',25000,'Pune','BA')
insert into tblEmp values('Rutuja',30000,'Latur','Investigation')
insert into tblEmp values('Swapnil',51000,'Mumbai','HR')
insert into tblEmp values('Raj',31000,'Delhi','Developer')
insert into tblEmp values('Aarti',24000,'Pune','Sales')
insert into tblEmp values('Trisha',20000,'Solapur','Sales')
insert into tblEmp values('Tanvi',33000,'Mumbai','BA')

select * from tblEmp

-- unique department
select count(distinct deptname) from tblEmp

select count(*) from tblEmp

select sum(salary) as SumSalary from tblEmp

select avg(salary) as AvgSalary from tblEmp

select max(salary) as maxSalary from tblEmp

select min(salary) as minSalary from tblEmp


-- group by clause
-- group by groups rows that have a same values into the summary
-- e.g find no of person in each country
-- group the similar col data -country,count
-- Rule :- group by stmt can be sed wtih aggregate function
--rule:-the column that we will put in the group by clause that can be 
-- used with select stmt

select * from person

select country from person
group by country


select country ,count(personId) from person
group by country

select country ,count(personId) as PersonCount from person
group by country


select * from tblEmp

select deptname,count(id) as empcount from tblEmp
group by deptname

select city,count(id) as empcount from tblEmp
group by city


