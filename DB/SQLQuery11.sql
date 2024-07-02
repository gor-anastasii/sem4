----- 1
use UNIVER

Declare DistIc Cursor for select SUBJECT_T.SUBJECT_NAME from SUBJECT_T where PULPIT = 'ИСиТ';

Declare @di nvarchar(50), @collection nvarchar(500) = '';
OPEN DistIc;
Fetch DistIc into @di;
print 'дисциплины Исит:';
while @@FETCH_STATUS = 0
	begin
		set @collection = rtrim(@di) + ',' + @collection;
		Fetch DistIc into @di;
	end
print @collection;
CLOSE DistIc;
deallocate DistIc;

----- 2

Declare Dists Cursor Local for Select SUBJECT_T, Subject_Name from SUBJECT_T where PULPIT = 'ИСиТ';

Declare @dist nvarchar(20), @name nvarchar(50);
OPEN Dists;
fetch Dists into @dist, @name;
print '1.' + @dist + ' ' + @name;
go
Declare @dist nvarchar(20), @name nvarchar(50);
fetch Dists into @dist, @name;
print '2.' + @dist + ' ' + @name;
go

-----

Declare Dists Cursor Global for Select SUBJECT_T, Subject_Name from SUBJECT_T where PULPIT = 'ИСиТ';

Declare @dist nvarchar(20), @name nvarchar(50);
OPEN Dists;
fetch Dists into @dist, @name;
print '1.' + @dist + ' ' + @name;
go
Declare @dist nvarchar(20), @name nvarchar(50);
fetch Dists into @dist, @name;
print '2.' + @dist + ' ' + @name;
CLOSE Dists;
deallocate Dists;
go

----- 3

Declare @dis nvarchar(20), @namedist nvarchar(50);
Declare Dist_ Cursor Local static for Select SUBJECT_T, Subject_Name from SUBJECT_T where PULPIT = 'ИСиТ';

open Dist_;
print 'кол-во строк: '+ cast(@@cursor_rows as nvarchar(5));
update SUBJECT_T set SUBJECT_Name = 'пример' where SUBJECT_T = 'ЭТ';
Delete SUBJECT_T where SUBJECT_T = 'ЭП';
Insert SUBJECT_T(SUBJECT_T, subject_name, pulpit) values('ЭХ', 'Новая дисциплина', 'ИСиТ');

fetch Dist_ into @dis, @namedist;
while(@@FETCH_STATUS = 0)
	begin
		print @dis + ' ' + @namedist
		fetch Dist_ into @dis, @namedist;
	end;
close Dist_;
deallocate Dist_;

select * from SUBJECT_T;

update SUBJECT_T set SUBJECT_NAME = 'Экономические технологии' where SUBJECT_T = 'ЭТ';
insert SUBJECT_T(subject_T, subject_name, pulpit) values('ЭП', 'Экономическая политика', 'ЭТиМ');
delete SUBJECT_T where SUBJECT_T = 'ЭХ';

-----

Declare @dist nvarchar(20), @namedis nvarchar(50);

Declare Dist_ Cursor for Select SUBJECT_T, Subject_Name from SUBJECT_T where PULPIT = 'ИСиТ';

open Dist_;
print 'кол-во строк: '+ cast(@@cursor_rows as nvarchar(5));
update SUBJECT_T set SUBJECT_Name = 'пример' where SUBJECT_T = 'ЭТ';
Delete SUBJECT_T where SUBJECT_T = 'ЭП';
Insert SUBJECT_T(SUBJECT_T, subject_name, pulpit) values('ЭХ', 'Новая дисциплина', 'ИСиТ');

fetch Dist_ into @dist, @namedis;
while(@@FETCH_STATUS = 0)
	begin
		print @dist + ' ' + @namedis
		fetch Dist_ into @dist, @namedis;
	end;

go

close Dist_;
deallocate Dist_;

select * from SUBJECT_T;

update SUBJECT_T set SUBJECT_NAME = 'Экономические технологии' where SUBJECT_T = 'ЭТ';
insert SUBJECT_T(SUBJECT_T, subject_name, pulpit) values('ЭП', 'Экономическая политика', 'ЭТиМ');
delete SUBJECT_T where SUBJECT_T = 'ЭХ';

----- 4

Declare @di nvarchar(28), @diname nvarchar(30);
Declare Dist Cursor Local static scroll for Select SUBJECT_T, Subject_Name from SUBJECT_T where Pulpit = 'ИСиТ';

open Dist;
print 'кол-во строк: '+ cast(@@cursor_rows as nvarchar(5));
fetch Dist into @di, @diname;
print 'следующая строка ' + @di + ' ' + @diname;
fetch last from Dist into @di, @diname;
print 'последняя строка ' + @di + ' ' + @diname;
fetch next from Dist into @di, @diname;
print 'следующая после текущей строка ' + @di + ' ' + @diname;
fetch prior from Dist into @di, @diname;
print 'предыдущая строка ' + @di + ' ' + @diname;
fetch absolute 3 from Dist into @di, @diname;
print '3 с начала строка ' + @di + ' ' + @diname;
fetch absolute -3 from Dist into @di, @diname;
print '3 с конца строка ' + @di + ' ' + @diname;
fetch relative 3 from Dist into @di, @diname;
print 'третья после текущей строка ' + @di + ' ' + @diname;
fetch relative -3 from Dist into @di, @diname;
print 'третья перед текущей строка ' + @di + ' ' + @diname;
close Dist;
deallocate Dist;

----- 5

Declare @disti nvarchar(10), @distiname nvarchar(20);
Declare Dist Cursor local dynamic for select SUBJECT_T, subject_name from SUBJECT_T where PULPIT='ИСиТ' for update;

Open Dist;
fetch Dist into @disti, @distiname;
delete SUBJECT_T where Current of Dist;
fetch Dist into @disti, @distiname;
update SUBJECT_T set SUBJECT_NAME = 'новое имя' where current of Dist;
Close Dist;
deallocate Dist;

select * from SUBJECT_T;

insert SUBJECT_T(SUBJECT_T, SUBJECT_NAME, PULPIT)
								values('БД', 'Базы данных', 'ИСиТ');
update SUBJECT_T set SUBJECT_NAME = 'Дискретная математика' where SUBJECT_T = 'ДМ'

select * from SUBJECT_T;

----- 6

DECLARE @StudentID int, @Grade int
DECLARE Cur CURSOR local scroll
			for select P.IDSTUDENT, P.NOTE
				FROM PROGRESS P
					JOIN STUDENT S ON P.IDSTUDENT = S.IDSTUDENT
					JOIN GROUPS G ON S.IDGROUP = G.IDGROUP
				where P.NOTE < 4;

OPEN Cur

FETCH NEXT FROM Cur INTO @StudentID, @Grade
WHILE @@FETCH_STATUS = 0
BEGIN
	DELETE Progress FROM PROGRESS
		WHERE IDSTUDENT = @StudentID
    FETCH NEXT FROM Cur INTO @StudentID, @Grade
END
CLOSE Cur
DEALLOCATE Cur

select IDSTUDENT,NOTE from PROGRESS

insert into PROGRESS (SUBJECT_T,IDSTUDENT,PDATE, NOTE)
values  ('ОАИП', 1000,  '01.10.2013',3),
        ('ООП', 1001,  '01.12.2013',2),
		('ОАИП',   1002,  '06.5.2013',2),
        ('ПСП',   1003,  '01.1.2013',2),
        ('ПСП',   1004,  '01.1.2013',2)

-----

declare @idstud int, @notestud int
declare EditNote cursor local dynamic 
						for select IDSTUDENT, NOTE from PROGRESS where IDSTUDENT = 1000 for update;
open EditNote
fetch EditNote into @idstud, @notestud
update PROGRESS set NOTE=NOTE+1 where current of EditNote
close EditNote
deallocate EditNote;

select IDSTUDENT, NOTE from progress where IDSTUDENT = 1000;
update progress set note = 3 where IDSTUDENT = 1000;


--------------------------------------

USE MyBase;

Declare DistIc Cursor for select Преподаватели.Фамилия from Преподаватели;

Declare @d nvarchar(50), @collection nvarchar(500) = '';
OPEN DistIc;
Fetch DistIc into @d;
print 'Все имена:';
while @@FETCH_STATUS = 0
	begin
		set @collection = rtrim(@d) + ',' + @collection;
		Fetch DistIc into @d;
	end
print @collection;
CLOSE DistIc;
deallocate DistIc;

----- 

Declare Dists Cursor Local for Select Преподаватели.Фамилия, Преподаватели.Имя from Преподаватели;

Declare @dist nvarchar(20), @name nvarchar(50);
OPEN Dists;
fetch Dists into @dist, @name;
print '1.' + @dist + ' ' + @name;
go
Declare @dist nvarchar(20), @name nvarchar(50);
fetch Dists into @dist, @name;
print '2.' + @dist + ' ' + @name;
go

-----

Declare Dists Cursor Global for Select Преподаватели.Фамилия, Преподаватели.Имя from Преподаватели;

Declare @dist nvarchar(20), @name nvarchar(50);
OPEN Dists;
fetch Dists into @dist, @name;
print '1.' + @dist + ' ' + @name;
go
Declare @dist nvarchar(20), @name nvarchar(50);
fetch Dists into @dist, @name;
print '2.' + @dist + ' ' + @name;
CLOSE Dists;
deallocate Dists;
go

-----

Declare @dis nvarchar(20), @namedist nvarchar(50);
Declare Dist_ Cursor Local static for Select Преподаватели.Фамилия, Преподаватели.Имя from Преподаватели;

open Dist_;
print 'кол-во строк: '+ cast(@@cursor_rows as nvarchar(5));
update Преподаватели set Фамилия = 'пример' where Имя = 'Екатерина';
Delete Преподаватели where Фамилия = 'Вовна';
Insert Преподаватели(Код_преподавателя, Фамилия, Имя) values(10, 'Иванова', 'Алина');

fetch Dist_ into @dis, @namedist;
while(@@FETCH_STATUS = 0)
	begin
		print @dis + ' ' + @namedist
		fetch Dist_ into @dis, @namedist;
	end;
close Dist_;
deallocate Dist_;

select * from Преподаватели;

-----

Declare @diss nvarchar(20), @namedistt nvarchar(50);
Declare Dist_ Cursor for Select Преподаватели.Фамилия, Преподаватели.Имя from Преподаватели;

open Dist_;
print 'кол-во строк: '+ cast(@@cursor_rows as nvarchar(5));
update Преподаватели set Фамилия = 'Канашук' where Имя = 'Екатерина';
Delete Преподаватели where Фамилия = 'Иванова';
Insert Преподаватели(Код_преподавателя, Фамилия, Имя) values(11, 'Ивановвва', 'Алина');


fetch Dist_ into @diss, @namedistt;
while(@@FETCH_STATUS = 0)
	begin
		print @diss + ' ' + @namedistt
		fetch Dist_ into @diss, @namedistt;
	end;
close Dist_;
deallocate Dist_;

select * from Преподаватели;

-----

Declare @di nvarchar(28), @diname nvarchar(30);
Declare Dist Cursor Local static scroll for Select Преподаватели.Фамилия, Преподаватели.Имя from Преподаватели;

open Dist;
print 'кол-во строк: '+ cast(@@cursor_rows as nvarchar(5));
fetch Dist into @di, @diname;
print 'следующая строка ' + @di + ' ' + @diname;
fetch last from Dist into @di, @diname;
print 'последняя строка ' + @di + ' ' + @diname;
fetch next from Dist into @di, @diname;
print 'следующая после текущей строка ' + @di + ' ' + @diname;
fetch prior from Dist into @di, @diname;
print 'предыдущая строка ' + @di + ' ' + @diname;
fetch absolute 3 from Dist into @di, @diname;
print '3 с начала строка ' + @di + ' ' + @diname;
fetch absolute -3 from Dist into @di, @diname;
print '3 с конца строка ' + @di + ' ' + @diname;
fetch relative 3 from Dist into @di, @diname;
print 'третья после текущей строка ' + @di + ' ' + @diname;
fetch relative -3 from Dist into @di, @diname;
print 'третья перед текущей строка ' + @di + ' ' + @diname;
close Dist;
deallocate Dist;

-----

Declare @disti nvarchar(10), @distiname nvarchar(20);
Declare Dist Cursor local dynamic for select Преподаватели.Фамилия, Преподаватели.Имя from Преподаватели where Имя = 'Алина' for update;

Open Dist;
fetch Dist into @disti, @distiname;
delete Преподаватели where Current of Dist;
fetch Dist into @disti, @distiname;
update Преподаватели set Имя = 'новое имя' where current of Dist;
Close Dist;
deallocate Dist;

select * from Преподаватели;

update Преподаватели set Фамилия = 'Новая фамилия' where Имя = 'Алина'

-----

DECLARE @p nvarchar(20), @g nvarchar(20)
DECLARE Cur CURSOR local scroll
			for select Преподаватели.Фамилия, Курсы.Оплата
				FROM Преподаватели
					JOIN Курсы ON Преподаватели.Код_преподавателя = Курсы.Код_преподавателя
				where Курсы.Оплата < 900;

OPEN Cur

FETCH NEXT FROM Cur INTO @p, @g
WHILE @@FETCH_STATUS = 0
BEGIN
	begin
		print @p + ' ' + @g
		fetch Cur into @p, @g;
	end;
END
CLOSE Cur
DEALLOCATE Cur

-----

declare @idstud nvarchar(20), @notestud int
declare EditNote cursor local dynamic 
						for select Преподаватели.Фамилия, Курсы.Оплата
						FROM Преподаватели
						JOIN Курсы ON Преподаватели.Код_преподавателя = Курсы.Код_преподавателя
						where Курсы.Оплата < 900 for update;
open EditNote
fetch EditNote into @idstud, @notestud
update Курсы set Оплата = Оплата + 100 where current of EditNote
close EditNote
deallocate EditNote;

select Преподаватели.Фамилия, Курсы.Оплата
						FROM Преподаватели
						JOIN Курсы ON Преподаватели.Код_преподавателя = Курсы.Код_преподавателя
						where Курсы.Оплата < 900

