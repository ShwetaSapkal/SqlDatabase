create table Person(
personId int,
personName varchar(20),
)

alter table Person add city varchar(50)

alter table Person drop column city

sp_rename 'person.personname','name'

alter table Person alter column personName varchar(40)

--oracle
--alter table Person modify column personName varchar(40)

select * from Person