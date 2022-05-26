create table EmpTable(
EmpId int,
FirstName varchar(20),
LastName varchar(20),
Salary int,
City varchar(30),
DeptName varchar(20)
constraint pk_emptable primary key(EmpId)
)

select * from EmpTable

insert into EmpTable values(1,'Shweta','Sapkal',30000,'Pune','Accountant')
insert into EmpTable values(2,'Pooja','Arsole',35000,'Nanded','Finance')
insert into EmpTable values(3,'Chaitali','Tarate',40000,'Ahmednagar','Developer')
insert into EmpTable values(4,'Shubham','Sapkal',25000,'Pune','Agri')
insert into EmpTable values(5,'Rutuja','Patil',30000,'Latur','Investigation')
insert into EmpTable values(6,'Swapnil','Sapkal',51000,'Mumbai','HR')
insert into EmpTable values(7,'Raj','Patil',31000,'Delhi','Developer')
insert into EmpTable values(8,'Aarti','Chavan',24000,'Pune','Sales')
insert into EmpTable values(9,'Trisha','Shah',20000,'Solapur','Sales')
insert into EmpTable values(10,'Tanvi','Todkar',33000,'Mumbai','HR')


alter table EmpTable add  DeptId int not null

alter table EmpTable drop column DeptId 

-- 1] display all employess from table
select * from EmpTable 

-- 2]
select * from EmpTable where DeptName='Sales'

--3]
select * from EmpTable where Salary>35000

--4]
select * from EmpTable where City='Pune' or City='Mumbai'

--5]
select * from EmpTable where Salary between 25000 and 30000

--6]
select * from EmpTable where FirstName like'T%'

--7]
select * from EmpTable where FirstName like'%a'

--8]

select distinct DeptName from EmpTable

--9]
select * from EmpTable where DeptName not in('HR','Sales')






-- [1] Write a query to display first_name and last_name using alias ‘First Name’ & ‘Last Name’ from employee table


--[2] Write a query to get unique department ID from employee table


-- [3] Write a query to get all employee details from employee table display in descending order
select * from EmpTable
order by EmpId desc

-- [4] Write a query to display employee details with salary, calculate the PF as 12 % of basic salary & display as separate column

select Salary,Salary=Salary*0.12 from EmpTable

--[5] Write a query to get total salaries payable to all employees from employee table
select sum(Salary) as SumSalary from EmpTable

--[6] Write a query to get max and min salary of employee
select max(Salary) as maxSalary from EmpTable

select min(Salary) as minSalary from EmpTable




-- [7] Write a query to get number of employees are working in company
select count(*) from EmpTable

-- [8] Write a query to get the number of unique designation in the company
select distinct DeptName from EmpTable

-- [9] Write a query to display emp_name as ‘Name’ in upper case
select FirstName as Name from EmpTable

-- [10] Write a query to get first 10 records from the employee table
select  * from EmpTable where EmpId<=10







