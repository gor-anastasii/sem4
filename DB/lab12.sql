use UNIVER;

set nocount on
	if  exists (select * from  SYS.OBJECTS
	            where OBJECT_ID= object_id(N'DBO.X') )	            
	drop table X;           
	declare @c int, @flag char = 'c';
	SET IMPLICIT_TRANSACTIONS  ON
	CREATE table X(K int ); 
		INSERT X values (1),(2),(3);
		set @c = (select count(*) from X);
		print 'количество строк в таблице X: ' + cast( @c as varchar(2));
		if @flag = 'c'  commit; 
	    else   rollback; 
      SET IMPLICIT_TRANSACTIONS  OFF
	
	if  exists (select * from  SYS.OBJECTS    
	            where OBJECT_ID= object_id(N'DBO.X') )
	print 'таблица X есть';  
      else print 'таблицы X нет'

-------------------------

use UNIVER;

select * from AUDITORIUM_TYPE;
select * from AUDITORIUM;

begin try
	begin tran;
		delete from AUDITORIUM_TYPE where AUDITORIUM_TYPE='ЛК';
		insert AUDITORIUM_TYPE values('ЛК', 'Лекционная');
		insert AUDITORIUM_TYPE values('NEW2', 'NEWNEWNEW2');
	commit tran;
end try
begin catch
	print 'ошибка '+ case
						when error_number() = 2627 and patindex('%AUDITORIUM_TYPE_PK%', error_message())>0
						then ' дублирование товара '
						else ' неизвестная ошибка '+ cast (error_number() as varchar(5))+ error_message()
					end;
	if @@TRANCOUNT > 0 rollback tran;
end catch


delete from AUDITORIUM_TYPE where AUDITORIUM_TYPE = 'NEW2'

--------------------------------------

declare @point varchar(32);
begin try
	begin tran;
	--delete from AUDITORIUM_TYPE where AUDITORIUM_TYPE='ЛК';
	set @point = 'p1'; save tran @point;
	insert AUDITORIUM_TYPE values('ЛК', 'Лекционная');
	set @point = 'p2'; save tran @point;
	insert AUDITORIUM_TYPE values('NEW2', 'NEWNEWNEW2');
	commit tran;
end try
begin catch
	print 'ошибка '+ case
						when error_number() = 2627 and patindex('%AUDITORIUM_TYPE_PK%', error_message())>0
						then ' дублирование товара '
						else ' неизвестная ошибка '+ cast (error_number() as varchar(5))+ error_message()
					end;
	if @@TRANCOUNT > 0 
		begin
			print 'контрольная точка ' + @point ;
			rollback tran @point;
			--commit tran;
		end;
end catch;


delete from AUDITORIUM_TYPE where AUDITORIUM_TYPE = 'NEW2'

---------------------------------------------

select * from AUDITORIUM_TYPE;
select * from AUDITORIUM;

-- A ---
	set transaction isolation level READ UNCOMMITTED 
	begin transaction 
	-------------------------- t1 ------------------
	select @@SPID, 'insert AUDITORIUM' 'результат', * from AUDITORIUM_TYPE 
	                                                                where AUDITORIUM_TYPE = 'NEW';
	select @@SPID, 'update AUDITORIUM'  'результат',  AUDITORIUM_CAPACITY, 
                      AUDITORIUM_TYPE from AUDITORIUM   where AUDITORIUM_CAPACITY = 50;
	commit; 
	-------------------------- t2 -----------------
--- B --	
	begin transaction 
	select @@SPID
	insert AUDITORIUM_TYPE values ('NEW', 'NEWNEWNEW'); 
	update AUDITORIUM set AUDITORIUM_CAPACITY  =  28 
                           where AUDITORIUM_CAPACITY = 50
	-------------------------- t1 --------------------
	-------------------------- t2 --------------------
	rollback;


	delete AUDITORIUM_TYPE where AUDITORIUM_TYPE='NEW'
	update AUDITORIUM set AUDITORIUM_CAPACITY  =  50 
                           where AUDITORIUM_CAPACITY = 28

------------------------------------------------------------

-- A ---
    set transaction isolation level READ COMMITTED 
	begin transaction 
	select count(*) from AUDITORIUM 
	where AUDITORIUM_CAPACITY = 60;
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  'update AUDITORIUM'  'результат', count(*)
	                           from AUDITORIUM  where AUDITORIUM_CAPACITY = 60;
	commit; 

--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
          update AUDITORIUM set AUDITORIUM_CAPACITY = 60 
                                       where AUDITORIUM_CAPACITY = 50
          commit; 
	-------------------------- t2 --------------------	

	update AUDITORIUM set AUDITORIUM_CAPACITY = 50 
	where AUDITORIUM_CAPACITY = 60;

----------------------------------------------------------------

select * from AUDITORIUM;

-- A ---
set transaction isolation level  REPEATABLE READ 
	begin transaction 
	select AUDITORIUM_NAME from AUDITORIUM where AUDITORIUM_CAPACITY = 60;
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  case
          when AUDITORIUM_NAME = '207-1' then 'insert  AUDITORIUM'  else ' ' 
end 'результат', AUDITORIUM_NAME from AUDITORIUM  where AUDITORIUM_CAPACITY = 60;
	commit; 

--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
          insert AUDITORIUM values ('207-1', 'ЛК-К', 60,  '207-1');

          commit; 
	-------------------------- t2 --------------------



---------------------------------------------------------------------

select * from AUDITORIUM;

    -- A ---
    set transaction isolation level SERIALIZABLE 
	begin transaction 
	--delete AUDITORIUM where AUDITORIUM_NAME = '207-1';  
    insert AUDITORIUM values ('207-1', 'ЛК-К', 60,  '207-1');
    --update AUDITORIUM set AUDITORIUM_NAME = '333' where AUDITORIUM_CAPACITY = 60;
    select AUDITORIUM_NAME from AUDITORIUM  where AUDITORIUM_CAPACITY = 60;
	-------------------------- t1 -----------------
	select  AUDITORIUM_NAME from AUDITORIUM  where AUDITORIUM_CAPACITY = 60;
	-------------------------- t2 ------------------ 
	commit; 	

	--- B ---	
	begin transaction 	  
	--delete AUDITORIUM where AUDITORIUM_NAME = '207-1';  
    insert AUDITORIUM values ('207-1', 'ЛК-К', 60,  '207-1');
    --update AUDITORIUM set AUDITORIUM_NAME = '333' where AUDITORIUM_CAPACITY = 60;
    select AUDITORIUM_NAME from AUDITORIUM  where AUDITORIUM_CAPACITY = 60;
    -------------------------- t1 --------------------
    commit; 
    select  AUDITORIUM_NAME from AUDITORIUM  where  AUDITORIUM_CAPACITY = 60;
    -------------------------- t2 --------------------
	delete AUDITORIUM where AUDITORIUM_NAME = '333';

	

--------------------------------------------

select * from AUDITORIUM;
select * from AUDITORIUM_TYPE;

begin tran
 insert AUDITORIUM_TYPE values ('NEW', 'NEWNEWNEW');
 begin tran
	update AUDITORIUM set AUDITORIUM_CAPACITY = 77 where AUDITORIUM_NAME = '206-1';
	commit;
	if @@TRANCOUNT > 0 rollback;
select 
	(select count(*) from AUDITORIUM where AUDITORIUM_NAME = '206-1' and AUDITORIUM_CAPACITY=77) 'AUDITORIUM',
	(select count(*) from AUDITORIUM_TYPE where AUDITORIUM_TYPE='NEW') 'AUDITORIUM_TYPE';



------------------------------------------------

use MyBase;

select * from Преподаватели;

begin try
	begin tran;
		insert Преподаватели values(20, 'New', 'NewNew', 'NEW', 11111, 10);
	commit tran;
end try
begin catch
	print 'ошибка '+ case
						when error_number() = 2627 and patindex('%PK__Преподаватели%', error_message())>0
						then ' дублирование преподавателя '
						else ' неизвестная ошибка '+ cast (error_number() as varchar(5))+ error_message()
					end;
	if @@TRANCOUNT > 0 rollback tran;
end catch


delete from Преподаватели where Фамилия = 'New'

---------------------------------------------

select * from Преподаватели;

declare @point2 varchar(32);
begin try
	begin tran;
		set @point2 = 'p1'; save tran @point2;
		set @point2 = 'p2'; save tran @point2;
		insert Преподаватели values(20, 'New', 'NewNew', 'NEW', 11111, 10);
	commit tran;
end try
begin catch
	print 'ошибка '+ case
						when error_number() = 2627 and patindex('%PK__Преподаватели%', error_message())>0
						then ' дублирование преподавателя '
						else ' неизвестная ошибка '+ cast (error_number() as varchar(5))+ error_message()
					end;
	if @@TRANCOUNT > 0 
		begin
			print 'контрольная точка ' + @point2 ;
			rollback tran @point2;
			--commit tran;
		end;
end catch

delete from Преподаватели where Фамилия = 'New'

---------------------------------------------

-- A ---
	set transaction isolation level READ UNCOMMITTED 
	begin transaction 
	-------------------------- t1 ------------------
	select @@SPID, 'insert Преподаватели' 'результат', * from Преподаватели 
	                                                    where Фамилия = 'Ивановввв';
	select @@SPID, 'update Курсы'  'результат',  Курсы.Предмет, 
                      Курсы.Количество_часов from  Курсы  where Код_преподавателя = 19;
	commit; 
	-------------------------- t2 -----------------
	--- B --	
	begin transaction 
	select @@SPID
	insert Преподаватели values (19, 'Ивановввв'); 
	update Курсы set Код_преподавателя  =  19
                           where Код_преподавателя = 4; 
	-------------------------- t1 --------------------
	-------------------------- t2 --------------------
	rollback;


	delete Преподаватели where Фамилия = 'Ивановввв'
	update Курсы set Код_преподавателя  =  4
                           where Код_преподавателя = 19; 

-----------------------------------------------------

-- A ---
    set transaction isolation level READ COMMITTED 
	begin transaction 
	select count(*) from Курсы where Код_преподавателя = 1;
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  'update Курсы'  'результат', count(*)
	                           from Курсы where Код_преподавателя = 1;
	commit; 

	--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
          update Курсы set Код_преподавателя = 4
                                       where Код_преподавателя = 1;
          commit; 
	-------------------------- t2 --------------------	

	 update Курсы set Код_преподавателя = 1
                                       where Код_преподавателя = 4

-------------------------------------------------------

select * from Курсы;

-- A ---
    set transaction isolation level  REPEATABLE READ 
	begin transaction 
	select Предмет from Курсы where Код_преподавателя = 1;
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  case
          when Предмет = 'Матан' then 'insert  Курсы'  else ' ' 
		end 'результат', Предмет from Курсы where Код_преподавателя = 1;
	commit; 

	--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
		  insert Курсы values (15,  'Матан',  'лк', 32, 32, 1, 2);
          commit; 
	-------------------------- t2 --------------------

---------------------------------------------------------

	-- A ---
          set transaction isolation level SERIALIZABLE 
	begin transaction 
		delete Курсы where Предмет = 'Матан';  
        insert Курсы values (16,  'Матан',  'лк', 32, 32, 1, 2);
        update Курсы set Предмет = 'Матан' where Код_преподавателя = 1;
        select Предмет from Курсы  where Код_преподавателя = 1;
	-------------------------- t1 -----------------
	select Предмет from Курсы  where Код_преподавателя = 1;
	-------------------------- t2 ------------------ 
	commit; 	

	--- B ---	
	begin transaction 	  
		delete Курсы where Предмет = 'Матан';  
        insert Курсы values (16,  'Матан',  'лк', 32, 32, 1, 2);
        update Курсы set Предмет = 'Матан' where Код_преподавателя = 1;
          -------------------------- t1 --------------------
          commit; 
          select Предмет from Курсы  where Код_преподавателя = 1;
      -------------------------- t2 --------------------

----------------------------

begin tran 
 insert Преподаватели values(18, 'Кто-то');
 begin tran 
	update Курсы set Количество_часов=666 where Код_преподавателя = 4;
	commit;
	if @@trancount > 0 rollback;
select 
	(select count(*) from Курсы where Предмет = 'Матан') 'Название',
	(select count(*) from Преподаватели where Фамилия = 'Кто-то') 'Фамилия';

select * from Преподаватели;
select * from Курсы;