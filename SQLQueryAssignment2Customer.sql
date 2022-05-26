Create table Customer(
CustId int,
CustName varchar(30),
Country varchar(30),
PostalCode int,
City varchar(30),
Price int,
constraint pk_customer primary key(CustId)

)

select * from Customer
--alter table Customer drop column Price

insert into Customer values(1,'Shweta','Germany',12209,'London')
insert into Customer values(2,'Sneha','USA',12018,'America')
insert into Customer values(3,'Chaitali','London',121110,'London')
insert into Customer values(4,'Shubham','Berlin',09876,'Lulea')
insert into Customer values(5,'Dhanu','Mexico',05021,'Mexico.D.F')
insert into Customer values(6,'Swapnil','China',1111,'Shanghai')
insert into Customer values(7,'Pooja','France',121110,'Fiji')
insert into Customer values(8,'Shailesh','Norway',76895,'Finland')
insert into Customer values(9,'Shivani','Mosquee',12209,'Arab')
insert into Customer values(10,'Meghna','Japan',121110,'Berlin')
insert into Customer values(11,'Neha','NewYork',89000,'London')
insert into Customer values(12,'Pritesh','Austrelia',99999,'Africa')



-- 1]Write a statement that will select the City column from the Customers table
select City from Customer

-- 2]Select all the different values from the Country column in the Customers table.
select distinct Country from Customer

-- 3]Select all records where the City column has the value "London"
select * from Customer where City='London'

-- 4]Use the NOT keyword to select all records where City is NOT "Berlin".
select * from Customer where City not='Berlin'

-- 5]Select all records where the CustomerID column has the value 23.
select * from Customer where CustId=23

-- 6]Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from Customer where City='Berlin' and PostalCode=121110

-- 7]Select all records where the City column has the value 'Berlin' or 'London'.
select * from Customer where City='Berlin' or City='London'

-- 8]Select all records from the Customers table, sort the result alphabetically by the column City.
select  * from Customer 
order by Country ASC


--9] Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select  * from Customer
order by City Desc

--10] Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select  * from Customer
order by Country,City


--11] Select all records from the Customers where the PostalCode column is empty.
select * from Customer where PostalCode is null

--12] Select all records from the Customers where the PostalCode column is NOT empty.
select * from Customer where PostalCode is not null

--13] Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
Update  Customer set City='Oslo' where Country='Norway'

--14] Delete all the records from the Customers table where the Country value is 'Norway'.
delete from Customer where Country='Norway'




-- 15] Select all records where the value of the City column starts with the letter "a".
select * from Customer where City like'a%'

-- 16] Select all records where the value of the City column ends with the letter "a".
select * from Customer where City like'%a'

-- 17] Select all records where the value of the City column contains the letter "a".
select * from Customer where City like'%a%'

-- 18] Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from Customer where City like'a%b'

-- 19] Select all records where the value of the City column does NOT start with the letter "a".
select * from Customer where City not like'a%'

-- 20] Select all records where the second letter of the City is an "a".
select * from Customer where City like'_a%'

-- 21] Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from Customer where City like'[acs]%' 

-- 22] Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from Customer where City like'[a-f]%'

-- 23] Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select * from Customer where City like'[!acf]%'

-- 24] Use the IN operator to select all the records where the Country is either "Norway" or "France".
select * from Customer where Country In('Norway','France')

-- 25] Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from Customer where Country Not In('Norway','France')


-- 26] When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.

select PostalCode as Pno from Customer

-- 27] When displaying the Customers table, refer to the table as Consumers instead of Customers.
select * from Customer as Consumers

-- 28] List the number of customers in each country.


-- 29]List the number of customers in each country, ordered by the country with the most customers first.





