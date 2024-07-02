----- 1
alter function COUNT_STUDENTSSS (@faculty varchar(20)) returns int
as begin 
	declare @rc int = 0;
	set @rc = (select count(IDSTUDENT) from STUDENT join GROUPS on STUDENT.IDGROUP=GROUPS.IDGROUP
	join FACULTY on GROUPS.FACULTY=FACULTY.FACULTY
	where FACULTY.FACULTY=@faculty);
	return @rc;
end

declare @f int = dbo.COUNT_STUDENTSSS('ХТиТ');
print 'на этом факультете столько человек ' + cast (@f as varchar(4));

alter function COUNT_STUDENTSSS (@faculty varchar(20) = null, @prof varchar(20) = null)
returns int
as begin 
	declare  @rc int = 0;
	if @prof is null
	set @rc =  (select count(IDSTUDENT) from STUDENT S 
				join GROUPS G on S.IDGROUP = G.IDGROUP
				join FACULTY F on G.FACULTY = F.FACULTY 
				  where F.FACULTY = @faculty);
	  else 
	set @rc =(select count(IDSTUDENT) from STUDENT S 
				join GROUPS G on S.IDGROUP = G.IDGROUP
				where G.PROFESSION = @prof);
	return @rc;
end;

declare @fp int = dbo.COUNT_STUDENTSSS(default,'1-36 01 08')
print 'на этой специальности столько человек' + cast(@fp as varchar(4));
select F.FACULTY, dbo.COUNT_STUDENTSSS(F.FACULTY, default) from FACULTY F

----- 2

create function FSUBJECTS(@p varchar(20)) returns varchar(300) 
as begin 
	declare @q varchar(20);
	declare @w varchar(300)='дисциплины';
	declare fsubjects cursor local
	for select SUBJECT_T from SUBJECT_T where PULPIT = @p;
	open fsubjects
	fetch fsubjects into @q;
	while @@FETCH_STATUS = 0
	begin 
	set @w=@w+','+RTRIM(@q);
	fetch fsubjects into @q;
	end;
	return @w;
end;

select P.PULPIT, dbo.FSUBJECTS(PULPIT) from PULPIT P

drop function FSUBJECTS

----- 3

alter function FFACPUL (@ff varchar(20), @pp varchar(20))
returns table
as return 
select FACULTY.FACULTY , PULPIT.PULPIT from FACULTY 
  left outer join PULPIT on PULPIT.FACULTY = FACULTY.FACULTY
    where FACULTY.FACULTY = isnull(@ff,FACULTY.FACULTY)
    and PULPIT.PULPIT = isnull(@pp, PULPIT.PULPIT);

select * from dbo.FFACPUL(NULL,NULL);
select * from dbo.FFACPUL('ИДиП',NULL);
select * from dbo.FFACPUL(NULL,'ЛМиЛЗ');
select * from dbo.FFACPUL('ТТЛП','ЛМиЛЗ');

----- 4

drop function  FCTEACHER;
create function FCTEACHER(@p varchar(20)) returns int
as begin 
  declare @rc int  = (select count(*) from TEACHER 
      where PULPIT = ISNULL(@p,PULPIT));
      return @rc;
  end;

select PULPIT,dbo.FCTEACHER(PULPIT) [количество преподавателей] from PULPIT
select dbo.FCTEACHER(NULL) [всего преподавателей] 

----- 6

create function FACULTY_REPORT(@c int) returns @fr table
( [Факультет] varchar(50), [Количество кафедр] int, [Количество групп]  int, 
  [Количество студентов] int, [Количество специальностей] int )
as begin 
	declare cc CURSOR static for 
	select FACULTY from FACULTY 
    where dbo.COUNT_STUDENTS(FACULTY, default) > @c; 
	declare @f varchar(30);
	open cc;  
    fetch cc into @f;
	while @@fetch_status = 0
	begin
		insert @fr values( @f,  (select count(PULPIT) from PULPIT where FACULTY = @f),
	    (select count(IDGROUP) from GROUPS where FACULTY = @f),   dbo.COUNT_STUDENTS(@f, default),
	    (select count(PROFESSION) from PROFESSION where FACULTY = @f)   ); 
	    fetch cc into @f;  
	end;   
    return; 
end;

create function C_PULPITS(@f varchar(20)) returns int
as begin declare @rc int = 0;
set @rc = (select count(PULPIT) from PULPIT where PULPIT.FACULTY = @f);
return @rc; 
end;

create function C_GROUPS(@f varchar(20)) returns int
as begin declare @rc int = 0;
set @rc = (select count(GROUPS.FACULTY) from GROUPS where GROUPS.FACULTY = @f);
return @rc; 
end;

create function C_PROF(@f varchar(20)) returns int
as begin declare @rc int = 0;
set @rc = (select count(PROFESSION) from PROFESSION where FACULTY = @f );
return @rc; 
end;

drop function FACULTY_REPORT;
create function FACULTY_REPORT(@c int) returns @fr table
( [Факультет] varchar(50), [Количество кафедр] int, [Количество групп]  int, 
  [Количество студентов] int, [Количество специальностей] int )
  as begin                  
  declare cc CURSOR static for 
  select FACULTY from FACULTY 
  where dbo.COUNT_STUDENTSSS(FACULTY, default) > @c; 
  declare @f varchar(30);
  open cc;  
  fetch cc into @f;
  while @@fetch_status = 0
  begin
      insert @fr values( @f, dbo.C_PULPITS(@f),
      dbo.C_GROUPS(@f),   dbo.COUNT_STUDENTSSS(@f, default),
      dbo.C_PROF(@f)); 
      fetch cc into @f;  
  end;   
  return; 
end;
  
select * from FACULTY_REPORT(15)