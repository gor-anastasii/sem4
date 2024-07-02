----- 1

create table TR_AUDIT
(
  ID int identity,
  STMT varchar(20)
  check (STMT in ('INS', 'DEL', 'UPD')),
  TRNAME varchar(50),
  CC varchar(300)
)

drop table TR_AUDIT;

select ID, STMT, TRNAME, CC from TR_AUDIT;
select * from TEACHER

insert into TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT) values('itdoijt', 'uhiudh duhi dk', 'ж', 'ИСиТ')

create trigger TR_TEACHER_INS on teacher after insert
as
begin
  declare @a1 varchar(20), @a2 varchar(20), @a3 varchar(20), @a4 varchar(20), @in varchar(300);
  set @a1 = (select [teacher] from inserted);
  set @a2 = (select [teacher_name] from inserted);
  set @a3 = (select [gender] from inserted);
  set @a4 = (select [pulpit] from inserted);
  set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' '+ @a4 ;
  insert into TR_AUDIT(STMT, TRNAME, CC) values ('INS', 'TR_TEACHER_INS', @in);
end;

select * from TR_AUDIT

drop trigger TR_TEACHER_INS

----- 2

create trigger TR_TEACHER_DEL on TEACHER after DELETE
as declare @a1 varchar(3),@a2 varchar(20), @a3 varchar(1),@a4 varchar(10), @in varchar(300);
set @a1 = (select [TEACHER] from deleted);
set @a2 = rtrim((select [TEACHER_NAME] from deleted));
set @a3 = rtrim((select [GENDER] from deleted));
set @a4 = rtrim((select [PULPIT] from deleted));
set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' '+ @a4 ;
insert into TR_AUDIT(STMT,TRNAME,CC) values ('DEL','TR_TEACHER_DEL',@in);
return;
delete  from TEACHER where TEACHER like 'itdoijt'
select * from TR_AUDIT

----- 3
create trigger TR_TEACHER_UPD on TEACHER after UPDATE
as declare @a1 varchar(3),@a2 varchar(20), @a3 varchar(1),@a4 varchar(10), @in varchar(300);
set @a1 = (select [TEACHER] from inserted);
set @a2 = rtrim((select [TEACHER_NAME] from inserted));
set @a3 = rtrim((select [GENDER] from inserted));
set @a4 = rtrim((select [PULPIT] from inserted));
set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' '+ @a4 ;
set @a1 = (select [TEACHER] from deleted);
set @a2 = rtrim((select [TEACHER_NAME] from deleted));
set @a3 = rtrim((select [GENDER] from deleted));
set @a4 = rtrim((select [PULPIT] from deleted));
set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' '+ @a4 ;
insert into TR_AUDIT(STMT, TRNAME, CC) values ('UPD','TR_TEACHER_UPD',@in);
return;
update TEACHER set TEACHER_NAME = 'dfghjklllkj fghjk kjh' where TEACHER like 'МРЗ'
delete  from TEACHER where TEACHER like'itdoijt'
select * from TR_AUDIT

----- 4

create trigger TR_Teacher on Teacher after INSERT, DELETE, UPDATE 
as 
begin
  declare @a1 varchar(3), @a2 varchar(20), @a3 varchar(1), @a4 varchar(10), @in varchar(300);
  declare @ins int = (select count(*) from inserted);
  declare @del int = (select count(*) from deleted);
  if @ins > 0 and @del = 0  
  begin 
    print 'Событие: INSERT';
    set @a1 = (select [TEACHER] from inserted);
    set @a2 = rtrim((select [TEACHER_NAME] from inserted));
    set @a3 = rtrim((select [GENDER] from inserted));
    set @a4 = rtrim((select [PULPIT] from inserted));
    set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
    insert into TR_AUDIT(STMT, TRNAME, CC) values ('INS', 'TR_TEACHER_INS', @in);
  end 
  else if @ins = 0 and @del > 0  
  begin 
    print 'Событие: DELETE';
    set @a1 = (select [TEACHER] from deleted);
    set @a2 = rtrim((select [TEACHER_NAME] from deleted));
    set @a3 = rtrim((select [GENDER] from deleted));
    set @a4 = rtrim((select [PULPIT] from deleted));
    set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
    insert into TR_AUDIT(STMT, TRNAME, CC) values ('DEL', 'TR_TEACHER_DEL', @in);
  end 
  else if @ins > 0 and @del > 0  
  begin 
    print 'Событие: UPDATE';
    set @a1 = (select [TEACHER] from inserted);
    set @a2 = rtrim((select [TEACHER_NAME] from inserted));
    set @a3 = rtrim((select [GENDER] from inserted));
    set @a4 = rtrim((select [PULPIT] from inserted));
    set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
    set @a1 = (select [TEACHER] from deleted);
    set @a2 = rtrim((select [TEACHER_NAME] from deleted));
    set @a3 = rtrim((select [GENDER] from deleted));
    set @a4 = rtrim((select [PULPIT] from deleted));
    set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
    insert into TR_AUDIT(STMT, TRNAME, CC) values ('UPD', 'TR_TEACHER_UPD', @in);
  end  
end;

insert into TEACHER values('FGH', 'dfghj fghjk fghjk', 'ж', 'ИСиТ');
update TEACHER set TEACHER.GENDER = 'м' where TEACHER like 'FGH';
delete from TEACHER where TEACHER like 'МРЗ';

select * from TR_AUDIT;

----- 5

insert into TEACHER values('ghj', 'new new new', 'р', 'ИСиТ');
update TEACHER set TEACHER.GENDER = 'р' where TEACHER like 'ДТК'
select * from TEACHER where TEACHER like 'МРЗ'
select * from TR_AUDIT

----- 6

create trigger TR_TEACHER_UPDA on TEACHER after UPDATE  
       as print 'AUD_AFTER_UPDATE_A';
 return;  
go 
create trigger TR_TEACHER_UPDB on TEACHER after UPDATE  
       as print 'AUD_AFTER_UPDATE_B';
return;  
go  
create trigger TR_TEACHER_UPDC on TEACHER after UPDATE  
       as print 'AUD_AFTER_UPDATE_C';
 return;  
go

select t.name, e.type_desc 
         from sys.triggers  t join  sys.trigger_events e  
                  on t.object_id = e.object_id  
                            where OBJECT_NAME(t.parent_id) = 'TEACHER' and 
                                                 e.type_desc = 'UPDATE';  
exec  SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_UPD', 
                          @order = 'First', @stmttype = 'UPDATE';

exec  SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_UPDA', 
                          @order = 'Last', @stmttype = 'UPDATE';

update TEACHER set TEACHER.GENDER = 'ж' where TEACHER like 'ДТК';

----- 7

create trigger TR_PROGRESS 
    on PROGRESS after INSERT,DELETE,UPDATE
    as declare @c int = (select sum(NOTE) from PROGRESS);
if (@c >9)
begin 
raiserror('общее количество 9',10,1);
rollback;
end;
return;
update PROGRESS set NOTE = 10 where PROGRESS.IDSTUDENT = 1007

select * from PROGRESS

----- 8

go 
create trigger TR_FAC_IO 
      on FACULTY instead of DELETE
      as raiserror('удаление запрещено',10,1);
return;
delete from FACULTY where FACULTY_NAME = 'ИСиТ';
select * from FACULTY

drop trigger TR_TEACHER;

----- 9

drop trigger DDL_UNIVER;
create trigger DDL_UNIVER on database
for DDL_DATABASE_LEVEL_EVENTS
as
begin
  declare @t varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
  declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
  declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
  
  if @t1 = 'TEACHER' 
  begin
    print 'Тип события: ' + @t;
    print 'Имя объекта: ' + @t1;
    print 'Тип объекта: ' + @t2;
    raiserror(N'Операции с таблицей Товары запрещены', 16, 1);
    rollback;
  end;
end;

select * from TEACHER;

alter table TEACHER drop column TEACHER_NAME;