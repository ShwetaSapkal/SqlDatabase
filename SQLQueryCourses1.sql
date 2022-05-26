Create table Courses(
id int primary key,
name varchar(20) not null
 )

alter table Courses add  ctype varchar(20)

--alter table Course1 drop column ctype

sp_rename 'courses.ctype', 'coursetype'

alter table Courses alter column name varchar(30)

alter table Courses add constraint un_Courses unique(id,details)

--alter table courses drop constraint pk_course
--alter table Courses add constraint pk_Courses primary key(mobile)

 select * from Courses