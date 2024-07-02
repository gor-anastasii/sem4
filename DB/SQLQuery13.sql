----- 1
go
create procedure psubject_t
as begin
declare @kk int = (select count(*) from subject_t);
select * from subject_t;
return @kk
end;

declare @k int = 0;
exec @k = psubject_t;
print 'всего '+ cast(@k as varchar(3));

----- 2

ALTER procedure psubject_t @p nvarchar(20), @c int output 
AS
begin
declare @k int = (select count(*) from  SUBJECT_T);
print N'ЭТО: @p = ' + @p + ', @c = ' + cast(@c as varchar(3));
select * from SUBJECT_T where PULPIT = @p;
set @c = @@ROWCOUNT;
return @k;
end;
GO
declare @k int = 0, @r int = 0;
exec @k = PSUBJECT_T @p= N'ИСиТ', @c = @r output;
print N' количество специальностей = ' + cast(@k as varchar(3));
print N'специальности на исите' + '= ' + cast(@r as varchar(30));

----- 3

CREATE TABLE #SUBJECT (
    SUBJECT nchar(10),
    SUBJECT_NAME nvarchar(100),
    PULPIT nchar(20)
);

ALTER PROCEDURE PSUBJECT_T
    @p NVARCHAR(20)
AS
BEGIN
	declare @q int = (select count(*) from #SUBJECT);
    SELECT * FROM #SUBJECT WHERE PULPIT = @p;
END;

INSERT INTO #SUBJECT EXEC PSUBJECT_T @p = N'ИСиТ';
SELECT * FROM #SUBJECT;

----- 4 

CREATE procedure PAUDITORIUM_INSERT
        @a nchar(20), @n nchar(10), @c int = 0, @t nvarchar(50)
        as declare @forr int = 1;
    begin try
    insert into AUDITORIUM(AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME)
    values (@a, @n, @c, @t)
    return @forr;
    end try
    begin catch
    print N'номер ошибки: ' + cast(error_number() as varchar(6));
    print N'сообщение: ' + error_message()
    print N'уровень: ' + cast(error_severity() as varchar(6));
    print N'метка: ' + cast(error_state() as varchar(8));
    print N'номер строки: ' + cast(error_line() as varchar(8));
    if ERROR_PROCEDURE() is not null
    print N'имя процедуры:' + error_procedure();
    return -1;
    end catch;

EXEC PAUDITORIUM_INSERT @a= '113-4', @n = N'ЛК-К', @c = 20, @t = '113-4';
EXEC PAUDITORIUM_INSERT @a= '207-2a', @n = N'ЛК', @c = 3, @t = '207-2à';
EXEC PAUDITORIUM_INSERT @a= '229-4', @n = N'ЛБ-К', @c = 30, @t = '229-4';

DROP PROCEDURE IF EXISTS PAUDITORIUM_INSERT;
	
----- 5

drop procedure if exists SUBJECT_REPORT;

create procedure SUBJECT_REPORT
@p char(10)
as
begin
	if not exists (select 1 from SUBJECT_T where PULPIT = lower(@p))
		begin
		raiserror('Ошибка в параметрах: Неверный код кафедры.', 16, 1);
		return;
		end
	declare @subjectList varchar(max);
	select @subjectList = coalesce(@subjectList + ', ', '') + rtrim(SUBJECT_T)
	from SUBJECT_T
	where PULPIT = lower(@p);
	print @subjectList;
	select count(*) as NumberOfSubjects
	from SUBJECT_T
	where PULPIT = lower(@p);
end;

exec SUBJECT_REPORT @p = 'исит';

----- 6

create procedure PAUDITORIUM_INSERTX @a nchar(20), @n nchar(10), @c int = 0, @t nvarchar(50), @tn nvarchar(50)
as
declare 
@rc2 int = 1;
begin try
set transaction isolation level SERIALIZABLE
begin tran
insert into AUDITORIUM_TYPE( AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
VALUES (@n, @tn)
exec @rc2 = PAUDITORIUM_INSERT @a, @n, @c, @t;
commit tran;
return @rc2;
end try
  begin catch 
    print 'номер ошибки  : ' + cast(error_number() as varchar(6));
    print 'сообщение     : ' + error_message();
    print 'уровень       : ' + cast(error_severity()  as varchar(6));
    print 'метка         : ' + cast(error_state()   as varchar(8));
    print 'номер строки  : ' + cast(error_line()  as varchar(8));
    if error_procedure() is not  null   
                     print 'имя процедуры : ' + error_procedure();
     if @@trancount > 0 rollback tran ; 
     return -1;    
end catch;

declare @rc int;
exec @rc = PAUDITORIUM_INSERTX @a = '104-4', @n = N'лк-к', @c = 30, @t = '104-4', @tn = N'лк';
print N'код ошибки: ' + CAST(@rc as varchar(3));

-----
use MyBase

----- 1

go
create procedure pteacher
as begin
declare @kk int = (select count(*) from Преподаватели);
select * from Преподаватели;
return @kk
end;

declare @k int = 0;
exec @k = pteacher;
print 'всего '+ cast(@k as varchar(3));


----- 2

ALTER procedure pteacher @p nvarchar(20), @c int output 
AS
begin
declare @k int = (select count(*) from  Преподаватели);
print N'ЭТО: @p = ' + @p + ', @c = ' + cast(@c as varchar(3));
select * from Преподаватели where Стаж > @p;
set @c = @@ROWCOUNT;
return @k;
end;
GO
declare @k int = 0, @r int = 0;
exec @k = pteacher @p = 2 , @c = @r output;
print N' количество преподавателей = ' + cast(@k as varchar(3));
print N' количество преподавателей со стажем' + '= ' + cast(@r as varchar(30));

----- 3

CREATE TABLE #TEACHER (
    Lastname nchar(10),
    Phone nchar(10),
);

ALTER PROCEDURE pteacher
    @p NVARCHAR(20)
AS
BEGIN
	declare @q int = (select count(*) from #TEACHER);
    SELECT * FROM #TEACHER WHERE Phone LIKE @p;
END;

INSERT INTO #TEACHER EXEC pteacher @p = '%23%';
SELECT * FROM #TEACHER;

----- 4 

CREATE procedure pteacher_insert
        @a int, @n nvarchar(20), @c nvarchar(20), @t int
        as declare @forr int = 1;
    begin try
    insert into Преподаватели(Преподаватели.Код_преподавателя, Преподаватели.Фамилия, Преподаватели.Имя, Преподаватели.Стаж)
    values (@a, @n, @c, @t)
    return @forr;
    end try
    begin catch
    print N'номер ошибки: ' + cast(error_number() as varchar(6));
    print N'сообщение: ' + error_message()
    print N'уровень: ' + cast(error_severity() as varchar(6));
    print N'метка: ' + cast(error_state() as varchar(8));
    print N'номер строки: ' + cast(error_line() as varchar(8));
    if ERROR_PROCEDURE() is not null
    print N'имя процедуры:' + error_procedure();
    return -1;
    end catch;

EXEC pteacher_insert @a=13, @n='test', @c='testname', @t=4;
EXEC pteacher_insert @a=1, @n='test', @c='testname', @t=4;

DROP PROCEDURE IF EXISTS pteacher_insert;

----- 5

drop procedure if exists pteacher_info;

create procedure pteacher_info
@p int
as
begin
	if not exists (select 1 from Курсы where Код_преподавателя = @p)
		begin
		raiserror('Ошибка в параметрах: Неверный код преподавателя.', 16, 1);
		return;
		end
	declare @infoList varchar(max);
	select @infoList = coalesce(@infoList + ', ', '') + rtrim(Курсы.Предмет)
	from Курсы
	where Код_преподавателя = @p;
	print @infoList;
	select count(*) as NumberOfSubjects
	from Курсы
	where Код_преподавателя = @p;
end;

exec pteacher_info @p = 1;

----- 6

create procedure pteacher_insertx @a int, @n nvarchar(20), @c nvarchar(20), @t int, @tn int, @p nvarchar(20)
as
declare 
@rc2 int = 1;
begin try
set transaction isolation level SERIALIZABLE
begin tran
exec @rc2 = pteacher_insert @a, @n, @c, @t;
insert into Курсы( Код_предмета, Предмет, Код_преподавателя)
VALUES (@tn, @p, @a);
commit tran;
return @rc2;
end try
  begin catch 
    print 'номер ошибки  : ' + cast(error_number() as varchar(6));
    print 'сообщение     : ' + error_message();
    print 'уровень       : ' + cast(error_severity()  as varchar(6));
    print 'метка         : ' + cast(error_state()   as varchar(8));
    print 'номер строки  : ' + cast(error_line()  as varchar(8));
    if error_procedure() is not  null   
                     print 'имя процедуры : ' + error_procedure();
     if @@trancount > 0 rollback tran ; 
     return -1;    
end catch;

declare @rc int;
exec @rc = pteacher_insertx @a=18, @n='test', @c='testname', @t=4, @tn=14, @p='testsubject';
print N'код ошибки: ' + CAST(@rc as varchar(3));