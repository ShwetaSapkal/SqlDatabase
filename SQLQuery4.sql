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

--drop table person 

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


-- 27/05/2022

select * from person
select * from Orders

alter table Orders add productname varchar(20)

alter table Orders add price int

insert into Orders values(1,1001,1,'keyboard',999)
insert into Orders values(2,1002,1,'mouse',799)
insert into Orders values(3,1003,5,'laptop',23999)
insert into Orders values(4,1004,5,'moible',26999)
insert into Orders values(5,1005,5,'led screen',11999)
insert into Orders values(6,1006,9,'t-shirt',999)
insert into Orders values(7,1007,9,'mouse',999)


-- 1] Inner Join
select p.name, p.country, o.orderNo, o.productname, o.price
from person p
inner join Orders o on o.personId=p.personId;


-- 2] Left Join
select p.name, p.country, o.orderNo, o.productname, o.price,o.orderId
from person p
left join Orders o on o.personId=p.personId;


-- 3] Right Join
select p.name, p.country, o.orderNo, o.productname, o.price,o.orderId
from person p
right join Orders o on o.personId=p.personId;


-- 4] Full Join
select p.name, p.country, o.orderNo, o.productname, o.price,o.orderId
from person p
full join Orders o on o.personId=p.personId;


-- 5] Self Join

create table Manager(
id int primary key,
name varchar(20)
)

select * from tblEmp

alter table tblEmp add managerid int

update tblEmp set managerid=1 where id in(2,3,4,5)
update tblEmp set managerid=6 where id in(7,8,9,10)
update tblEmp set managerid=11 where id in(12)

select e1.name as empNane , e2.name as managerName
from tblEmp e1,tblEmp e2
where e1.managerid=e2.id



--
create table tblStudy(
studId varchar(5),
courseId varchar(5),
year int
)

select * from tblStudy

insert into tblStudy values('s1','c1',2016)
insert into tblStudy values('s2','c2',2017)
insert into tblStudy values('s1','c2',2017)


-- find the student id who enroll for different courese with their year

update tblStudy set courseId='c2' where studId='s1' and year=2017

select sa.studId , sa.courseId , sa.year
from tblStudy sa , tblStudy sb
where sa.studId=sb.studId and sa.courseId<>sb.courseId and sa.year<>sb.year


select s1.studId ,s1.courseId , s1.year
from tblStudy s1, tblStudy s2
where s1.studId=s2.studId and s1.courseId<>s2.courseId


-- 6] Cross Join

create table



-- example emp & dept
alter table tblEmp drop column deptname
alter table tblEmp add did int

select * from tblEmp

create table dept(
did int primary key,
dname varchar(10)
)

select * from dept

alter table tblEmp 
add constraint fk_dept_tblEmp foreign key(did) references dept(did)

insert into dept values(1,'HR')
insert into dept values(2,'Testing ')
insert into dept values(3,'HR')
insert into dept values(4,'Developer')
insert into dept values(5,'Finance')
insert into dept values(6,'Sales')

update tblEmp set did=1 where id in(2,3,4,5)

update tblEmp set did=5 where id in(7,8,9,10)

update tblEmp set did=3 where id in(1,6)


-- 1]inner join
select e.name,e.salary,d.did,d.dname
from tblEmp e
inner join dept d on d.did=e.did


select e.name,e.salary,d.did,d.dname
from tblEmp e 
inner join dept d on e.did=d.did
where d.dname='HR'


select e.id,e.name,e.salary,d.did,d.dname
from tblEmp e inner join dept d on e.did=d.did
where d.dname='HR' order by(salary)

select e.id,e.name,e.salary,d.did,d.dname
from tblEmp e inner join dept d on e.did=d.did
where d.dname='HR' order by(salary) desc


select e.id,e.name,e.salary,d.did,d.dname
from tblEmp e inner join dept d on e.did=d.did
 where d.dname='Hr' order by name


 -- Union and Union all

 select city from customer where city='Pune'
 union
 select city from supplier where city='Pune'


 select city from customer where city='Pune'
 union all
 select city from supplier where city='Pune'


 -- having clause in sql
 -- apply condition with aggregate function
 -- where clause will be not with aggregate function

 select country,count(personid)from person
 group by country
 having count(personid)>2

 select country,count(personid) from person
 group by country
 having country in('india','usa')
 order by count(personid)


 select dname,count(did) as empcount from dept
 group by dname
 having dname in('HR','Sales')
 order by count(did)


 -- SQL Build in functions
 -- Substring, concat, len, upper,lower ,trim, ltrim,rtrim,round,replace, reverse

 select * from tblEmp

 update tblEmp set salary=34998.99 where id=1

 select SUBSTRING(name,0,3) as tempname from tblEmp where id=7

 select CONCAT(name,'',city) as info from tblEmp

 select name,LEN(name) as length from tblEmp

 select UPPER(name) as name from tblEmp

 select Lower(name) as name from tblEmp

 select Round(345.889,2) as roundValue

  select Round(345.889,0) as roundValue

 select ROUND(salary,1)  as salary from tblEmp where id=1

 select ROUND(salary,0)  as salary from tblEmp where id=1

 select CAST(salary as varchar(20)) from tblEmp -- typecast

 select REVERSE(name) as reverename from tblEmp
 
 select RANK() over (order by salary)as salaryrank from tblEmp

 select replace(name,'A','J') as info from tblEmp where id=1
 select replace(name,'Shweta','Kangna') as info from tblEmp where id=1


 select salary,RANK() over (order by salary desc)as salaryrank from tblEmp







