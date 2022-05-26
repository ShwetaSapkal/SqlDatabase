--mysql
create table Person(
personId int,
personName varchar(20) not null, -- at the time of table creation
--unique(personID)
)

create table course
(
id int primary key, -- instead of PK we say it as=> not null unique
name varchar(20) not null
)

alter table person alter column name varchar(40) not null
								  --label
alter table person add constraint un_person unique(personId,Contact)

alter table person drop constraint un_person



select * from Person