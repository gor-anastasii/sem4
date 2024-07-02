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
		print '���������� ����� � ������� X: ' + cast( @c as varchar(2));
		if @flag = 'c'  commit; 
	    else   rollback; 
      SET IMPLICIT_TRANSACTIONS  OFF
	
	if  exists (select * from  SYS.OBJECTS    
	            where OBJECT_ID= object_id(N'DBO.X') )
	print '������� X ����';  
      else print '������� X ���'

-------------------------

use UNIVER;

select * from AUDITORIUM_TYPE;
select * from AUDITORIUM;

begin try
	begin tran;
		delete from AUDITORIUM_TYPE where AUDITORIUM_TYPE='��';
		insert AUDITORIUM_TYPE values('��', '����������');
		insert AUDITORIUM_TYPE values('NEW2', 'NEWNEWNEW2');
	commit tran;
end try
begin catch
	print '������ '+ case
						when error_number() = 2627 and patindex('%AUDITORIUM_TYPE_PK%', error_message())>0
						then ' ������������ ������ '
						else ' ����������� ������ '+ cast (error_number() as varchar(5))+ error_message()
					end;
	if @@TRANCOUNT > 0 rollback tran;
end catch


delete from AUDITORIUM_TYPE where AUDITORIUM_TYPE = 'NEW2'

--------------------------------------

declare @point varchar(32);
begin try
	begin tran;
	--delete from AUDITORIUM_TYPE where AUDITORIUM_TYPE='��';
	set @point = 'p1'; save tran @point;
	insert AUDITORIUM_TYPE values('��', '����������');
	set @point = 'p2'; save tran @point;
	insert AUDITORIUM_TYPE values('NEW2', 'NEWNEWNEW2');
	commit tran;
end try
begin catch
	print '������ '+ case
						when error_number() = 2627 and patindex('%AUDITORIUM_TYPE_PK%', error_message())>0
						then ' ������������ ������ '
						else ' ����������� ������ '+ cast (error_number() as varchar(5))+ error_message()
					end;
	if @@TRANCOUNT > 0 
		begin
			print '����������� ����� ' + @point ;
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
	select @@SPID, 'insert AUDITORIUM' '���������', * from AUDITORIUM_TYPE 
	                                                                where AUDITORIUM_TYPE = 'NEW';
	select @@SPID, 'update AUDITORIUM'  '���������',  AUDITORIUM_CAPACITY, 
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
	select  'update AUDITORIUM'  '���������', count(*)
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
end '���������', AUDITORIUM_NAME from AUDITORIUM  where AUDITORIUM_CAPACITY = 60;
	commit; 

--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
          insert AUDITORIUM values ('207-1', '��-�', 60,  '207-1');

          commit; 
	-------------------------- t2 --------------------



---------------------------------------------------------------------

select * from AUDITORIUM;

    -- A ---
    set transaction isolation level SERIALIZABLE 
	begin transaction 
	--delete AUDITORIUM where AUDITORIUM_NAME = '207-1';  
    insert AUDITORIUM values ('207-1', '��-�', 60,  '207-1');
    --update AUDITORIUM set AUDITORIUM_NAME = '333' where AUDITORIUM_CAPACITY = 60;
    select AUDITORIUM_NAME from AUDITORIUM  where AUDITORIUM_CAPACITY = 60;
	-------------------------- t1 -----------------
	select  AUDITORIUM_NAME from AUDITORIUM  where AUDITORIUM_CAPACITY = 60;
	-------------------------- t2 ------------------ 
	commit; 	

	--- B ---	
	begin transaction 	  
	--delete AUDITORIUM where AUDITORIUM_NAME = '207-1';  
    insert AUDITORIUM values ('207-1', '��-�', 60,  '207-1');
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

select * from �������������;

begin try
	begin tran;
		insert ������������� values(20, 'New', 'NewNew', 'NEW', 11111, 10);
	commit tran;
end try
begin catch
	print '������ '+ case
						when error_number() = 2627 and patindex('%PK__�������������%', error_message())>0
						then ' ������������ ������������� '
						else ' ����������� ������ '+ cast (error_number() as varchar(5))+ error_message()
					end;
	if @@TRANCOUNT > 0 rollback tran;
end catch


delete from ������������� where ������� = 'New'

---------------------------------------------

select * from �������������;

declare @point2 varchar(32);
begin try
	begin tran;
		set @point2 = 'p1'; save tran @point2;
		set @point2 = 'p2'; save tran @point2;
		insert ������������� values(20, 'New', 'NewNew', 'NEW', 11111, 10);
	commit tran;
end try
begin catch
	print '������ '+ case
						when error_number() = 2627 and patindex('%PK__�������������%', error_message())>0
						then ' ������������ ������������� '
						else ' ����������� ������ '+ cast (error_number() as varchar(5))+ error_message()
					end;
	if @@TRANCOUNT > 0 
		begin
			print '����������� ����� ' + @point2 ;
			rollback tran @point2;
			--commit tran;
		end;
end catch

delete from ������������� where ������� = 'New'

---------------------------------------------

-- A ---
	set transaction isolation level READ UNCOMMITTED 
	begin transaction 
	-------------------------- t1 ------------------
	select @@SPID, 'insert �������������' '���������', * from ������������� 
	                                                    where ������� = '���������';
	select @@SPID, 'update �����'  '���������',  �����.�������, 
                      �����.����������_����� from  �����  where ���_������������� = 19;
	commit; 
	-------------------------- t2 -----------------
	--- B --	
	begin transaction 
	select @@SPID
	insert ������������� values (19, '���������'); 
	update ����� set ���_�������������  =  19
                           where ���_������������� = 4; 
	-------------------------- t1 --------------------
	-------------------------- t2 --------------------
	rollback;


	delete ������������� where ������� = '���������'
	update ����� set ���_�������������  =  4
                           where ���_������������� = 19; 

-----------------------------------------------------

-- A ---
    set transaction isolation level READ COMMITTED 
	begin transaction 
	select count(*) from ����� where ���_������������� = 1;
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  'update �����'  '���������', count(*)
	                           from ����� where ���_������������� = 1;
	commit; 

	--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
          update ����� set ���_������������� = 4
                                       where ���_������������� = 1;
          commit; 
	-------------------------- t2 --------------------	

	 update ����� set ���_������������� = 1
                                       where ���_������������� = 4

-------------------------------------------------------

select * from �����;

-- A ---
    set transaction isolation level  REPEATABLE READ 
	begin transaction 
	select ������� from ����� where ���_������������� = 1;
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  case
          when ������� = '�����' then 'insert  �����'  else ' ' 
		end '���������', ������� from ����� where ���_������������� = 1;
	commit; 

	--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
		  insert ����� values (15,  '�����',  '��', 32, 32, 1, 2);
          commit; 
	-------------------------- t2 --------------------

---------------------------------------------------------

	-- A ---
          set transaction isolation level SERIALIZABLE 
	begin transaction 
		delete ����� where ������� = '�����';  
        insert ����� values (16,  '�����',  '��', 32, 32, 1, 2);
        update ����� set ������� = '�����' where ���_������������� = 1;
        select ������� from �����  where ���_������������� = 1;
	-------------------------- t1 -----------------
	select ������� from �����  where ���_������������� = 1;
	-------------------------- t2 ------------------ 
	commit; 	

	--- B ---	
	begin transaction 	  
		delete ����� where ������� = '�����';  
        insert ����� values (16,  '�����',  '��', 32, 32, 1, 2);
        update ����� set ������� = '�����' where ���_������������� = 1;
          -------------------------- t1 --------------------
          commit; 
          select ������� from �����  where ���_������������� = 1;
      -------------------------- t2 --------------------

----------------------------

begin tran 
 insert ������������� values(18, '���-��');
 begin tran 
	update ����� set ����������_�����=666 where ���_������������� = 4;
	commit;
	if @@trancount > 0 rollback;
select 
	(select count(*) from ����� where ������� = '�����') '��������',
	(select count(*) from ������������� where ������� = '���-��') '�������';

select * from �������������;
select * from �����;