-- 30/05/2022

create procedure SP_Insert_Dept(@did int, @dname varchar(20))
as begin
insert into dept values(@did,@dname)
return
end

-- to alter the existing SP
alter procedure SP_Insert_Dept(@did int, @dname varchar(20))
as begin
insert into dept values(@did,@dname)
return
end


create procedure SP_Update_Dept(@did int, @dname varchar(20))
as begin
update dept set dname=@dname where did=@did
return
end

create procedure SP_SelectAll_Dept
as begin
select * from dept
return
end

exec SP_SelectAll_Dept

exec SP_Insert_Dept
@did=8,
@dname='HR'
