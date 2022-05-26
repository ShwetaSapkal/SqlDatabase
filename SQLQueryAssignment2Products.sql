Create table Products(
ProdId int,
ProdName varchar(20),
Price1 int,
constraint pk_products primary key(ProdId)
)

select * from Products

insert into Products values(11,'watch',200)
insert into Products values(12,'shoes',300)
insert into Products values(13,'pen',20)
insert into Products values(14,'ring',500)
insert into Products values(15,'pencil',20)
insert into Products values(16,'cookies',10)
insert into Products values(17,'Geitost',100)
insert into Products values(18,'Pavlova',900)

-- 1] Use the MIN function to select the record with the smallest value of the Price column.
select min(Price1) from Products

-- 2] Use an SQL function to select the record with the highest value of the Price column.
select max(Price1) from Products

-- 3] Use the correct function to return the number of records that have the Price value set to 20
select count(*) from Products where Price1=20

-- 4] Use an SQL function to calculate the average price of all products.
select avg(Price1) from Products

-- 5] Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(Price1) from Products


-- 6] Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
select * from Products where Price1 Between 10 and 20

-- 7] Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
select * from Products where Price1 Not Between 10 and 20

-- 8] Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
select * from Products where ProdName between 'Geitost' and 'Pavlova'
