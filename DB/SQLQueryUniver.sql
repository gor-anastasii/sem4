USE Master
CREATE database UNIVER;

use UNIVER
create table AUDITORIUM_TYPE 
(    AUDITORIUM_TYPE  char(10) constraint AUDITORIUM_TYPE_PK  primary key,  
      AUDITORIUM_TYPENAME  varchar(30)       
 )
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )        values ('��',            '����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )         values ('��-�',          '������������ �����');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )         values ('��-�',          '���������� � ���. ����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )          values  ('��-X',          '���������� �����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )        values  ('��-��',   '����. ������������ �����');

-------------�������� � ���������� ������� AUDITORIUM  
  create table AUDITORIUM 
(   AUDITORIUM   char(20)  constraint AUDITORIUM_PK  primary key,              
    AUDITORIUM_TYPE     char(10) constraint  AUDITORIUM_AUDITORIUM_TYPE_FK foreign key         
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE), 
   AUDITORIUM_CAPACITY  integer constraint  AUDITORIUM_CAPACITY_CHECK default 1  check (AUDITORIUM_CAPACITY between 1 and 300),  -- ����������� 
   AUDITORIUM_NAME      varchar(50)                                     
)

insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME,  
 AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
values  ('206-1', '206-1','��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) 
values  ('301-1',   '301-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
values  ('236-1',   '236-1', '��',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
values  ('313-1',   '313-1', '��-�',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
values  ('324-1',   '324-1', '��-�',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
 values  ('413-1',   '413-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY ) 
values  ('423-1',   '423-1', '��-�', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )     
values  ('408-2',   '408-2', '��',  90);

------�������� � ���������� ������� FACULTY
  create table FACULTY
  (    FACULTY      char(10)   constraint  FACULTY_PK primary key,
       FACULTY_NAME  varchar(50) default '???'
  );
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',   '���������� ���������� � �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '����������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������-������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',    '���������� � ������� ������ ��������������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������� ������������ �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('��',     '��������� �������������� ����������');  
------�������� � ���������� ������� PROFESSION
   create table PROFESSION
  (   PROFESSION   char(20) constraint PROFESSION_PK  primary key,
       FACULTY    char(10) constraint PROFESSION_FACULTY_FK foreign key 
                            references FACULTY(FACULTY),
       PROFESSION_NAME varchar(100),    QUALIFICATION   varchar(50)  
  );  
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('��',  '1-40 01 02',   '�������������� ������� � ����������', '�������-�����������-�������������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('��',  '1-47 01 01', '������������ ����', '��������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)    values    ('��',  '1-36 06 01',  '��������������� ������������ � ������� ��������� ����������', '�������-��������������' );                     
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)  values    ('����',  '1-36 01 08',    '��������������� � ������������ ������� �� �������������� ����������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('����',  '1-36 07 01',  '������ � �������� ���������� ����������� � ����������� ������������ ����������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-75 01 01',      '������ ���������', '������� ������� ���������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)   values    ('���',  '1-75 02 01',   '������-�������� �������������', '������� ������-��������� �������������' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)   values    ('���',  '1-89 02 02',     '������ � ������������������', '���������� � ����� �������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-25 01 07',  '��������� � ���������� �� �����������', '���������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('���',  '1-25 01 08',    '������������� ����, ������ � �����', '���������' );                      
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)  values    ('����',  '1-36 05 01',   '������ � ������������ ������� ���������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)   values    ('����',  '1-46 01 01',      '�������������� ����', '�������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)      values    ('���',  '1-48 01 02',  '���������� ���������� ������������ �������, ���������� � �������', '�������-�����-��������' );                
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)    values    ('���',  '1-48 01 05',    '���������� ���������� ����������� ���������', '�������-�����-��������' );

 insert into PROFESSION(FACULTY, PROFESSION,    PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-54 01 03',   '������-���������� ������ � ������� �������� �������� ���������', '������� �� ������������' ); 

------�������� � ���������� ������� PULPIT
  create table  PULPIT 
(   PULPIT   char(20)  constraint PULPIT_PK  primary key,
    PULPIT_NAME  varchar(100), 
    FACULTY   char(10)   constraint PULPIT_FACULTY_FK foreign key 
                         references FACULTY(FACULTY) 
);  
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY )
  values  ('����', '�������������� ������ � ���������� ','��'  );
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
    values  ('��', '�����������','���')      ;    
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('��', '��������������','���')  ;         
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
  values  ('�����', '���������� � ����������������','���')   ;             
insert into PULPIT   (PULPIT,  PULPIT_NAME, FACULTY)
   values  ('����', '������ ������� � ������������','���') ;
insert into PULPIT   (PULPIT,  PULPIT_NAME, FACULTY)
   values  ('���', '������� � ������������������','���')         ;     
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('������','������������ �������������� � ������-��������� �������������','���')   ;       
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('��', '���������� ����', '����')    ;                      
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('�����','������ ����� � ���������� �������������','����')  ;
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('���','���������� �������������������� �����������', '����')  ; 
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
values  ('�����','���������� � ������� ������� �� ���������','����')   ; 
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
values  ('��', '������������ �����','���') ;
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
 values  ('���','���������� ����������� ���������','���');             
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
 values  ('�������','���������� �������������� ������� � ����� ���������� ���������� ','����') ;
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
    values  ('�����','��������� � ��������� ���������� �����������','����')    ;                                           
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
values  ('����',    '������������� ������ � ����������','���') ;  
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
  values  ('����',   '����������� � ��������� ������������������','���')   ;
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
   values  ('������', '����������, �������������� �����, ������� � ������', '���') ;    
             
------�������� � ���������� ������� TEACHER
 create table TEACHER
 (   TEACHER    char(10)  constraint TEACHER_PK  primary key,
     TEACHER_NAME  varchar(100), 
     GENDER     char(1) CHECK (GENDER in ('�', '�')),
     PULPIT   char(20) constraint TEACHER_PULPIT_FK foreign key 
                         references PULPIT(PULPIT) 
 );
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT )
                       values  ('����',    '������ �������� �������������', '�',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',    '�������� ��������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',    '���������� ������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',    '�������� ������ ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '����� ��������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '��������� ����� ��������', '�', '����');

insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                      values  ('���',     '����� ������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '����� ������� �������������',  '�', '����');                     
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '����� ����� �������������',  '�',   '����');                                                                                           
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
             values  ('������',   '���������� ��������� �������������', '�','�����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '��������� ������� �����������', '�', '�����');                       
insert into  TEACHER    (TEACHER,  TEACHER_NAME,GENDER, PULPIT )
                       values  ('������',   '����������� ��������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('����',   '������� ��������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('����',   '������ ������ ��������', '�', '��');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('����', '������� ������ ����������',  '�',  '������');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '���������� ������� ��������', '�', '������');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',   '������ ������ ���������� ', '�', '��');                      
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',   '��������� �������� ���������', '�', '�����'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('������',   '���������� �������� ����������', '�', '��'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',   '�������� ������ ����������', '�', '��');

------�������� � ���������� ������� SUBJECT_T
create table SUBJECT_T
    (     SUBJECT_T  char(10) constraint SUBJECT_PK  primary key, 
           SUBJECT_NAME varchar(100) unique,
           PULPIT  char(20) constraint SUBJECT_PULPIT_FK foreign key 
                         references PULPIT(PULPIT)   
     )
 insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('����',   '������� ���������� ������ ������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT)
                       values ('��',     '���� ������','����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('���',    '�������������� ����������','����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('����',  '������ �������������� � ����������������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('��',     '������������� ������ � ������������ ��������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('���',    '���������������� ������� ����������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('����',  '������������� ������ ��������� ����������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('���',     '�������������� �������������� ������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('��',      '������������ ��������� ','����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
           values ('�����',   '��������. ������, �������� � �������� �����', '�����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('���',     '������������ �������������� �������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('���',     '����������� ��������. ������������', '�����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT)
                       values ('��',   '���������� ����������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                      values ('��',   '�������������� ����������������','����');  
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
               values ('����', '���������� ������ ���',  '����');                   
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
               values ('���',  '��������-��������������� ����������������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('��', '��������� ������������������','����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('��', '������������� ������','����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('������OO','�������� ������ ������ � ���� � ���. ������.','��');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('�������','������ ������-��������� � ������������� ���������',  '������');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('��', '���������� �������� ','��');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('��',    '�����������', '�����') ;
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('��',    '������������ �����', '��')   ;
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('���',    '���������� ��������� �������','�������') ;
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('���',    '������ ��������� ����','��');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('����',   '���������� � ������������ �������������', '�����') ;

insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('����',   '���������� ���������� �������� ���������� ','�������');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('���',    '���������� ������������','�������') ;                                                                                                                                                          
  
------�������� � ���������� ������� GROUPS
create table GROUPS 
(   IDGROUP  integer  identity(1,1) constraint GROUP_PK  primary key,              
    FACULTY   char(10) constraint  GROUPS_FACULTY_FK foreign key         
                                                         references FACULTY(FACULTY), 
     PROFESSION  char(20) constraint  GROUPS_PROFESSION_FK foreign key         
                                                         references PROFESSION(PROFESSION),
    YEAR_FIRST  smallint  check (YEAR_FIRST<=YEAR(GETDATE())),                  
  )
insert into GROUPS   (FACULTY,  PROFESSION, YEAR_FIRST )
         values ('����','1-40 01 02', 2013), --1
                ('����','1-40 01 02', 2012),
                ('����','1-40 01 02', 2011),
                ('����','1-40 01 02', 2010),
                ('����','1-47 01 01', 2013),---5 ��
                ('����','1-47 01 01', 2012),
                ('����','1-47 01 01', 2011),
                ('����','1-36 06 01', 2010),-----8 ��
                ('����','1-36 06 01', 2013),
                ('����','1-36 06 01', 2012),
                ('����','1-36 06 01', 2011),
                ('����','1-36 01 08', 2013),---12 ��                                                  
                ('����','1-36 01 08', 2012),
                ('����','1-36 07 01', 2011),
                ('����','1-36 07 01', 2010),
                ('���','1-48 01 02', 2012), ---16 �� 
                ('���','1-48 01 02', 2011),
                ('���','1-48 01 05', 2013),
                ('���','1-54 01 03', 2012),
                ('���','1-75 01 01', 2013),--20 ��      
                ('���','1-75 02 01', 2012),
                ('���','1-75 02 01', 2011),
                ('���','1-89 02 02', 2012),
                ('���','1-89 02 02', 2011),  
                ('����','1-36 05 01', 2013),
                ('����','1-36 05 01', 2012),
                ('����','1-46 01 01', 2012),--27 ��
                ('���','1-25 01 07', 2013), 
                ('���','1-25 01 07', 2012),     
                ('���','1-25 01 07', 2010),
                ('���','1-25 01 08', 2013),
                ('���','1-25 01 08', 2012); ---32 ��       
                          
------�������� � ���������� ������� STUDENT
create table STUDENT 
(    IDSTUDENT   integer  identity(1000,1) constraint STUDENT_PK  primary key,
      IDGROUP   integer  constraint STUDENT_GROUP_FK foreign key         
                      references GROUPS(IDGROUP),        
      NAME   nvarchar(100), 
      BDAY   date,
      STAMP  timestamp,
      INFO     xml,
      FOTO     varbinary
 ) 
insert into STUDENT (IDGROUP,NAME, BDAY)
    values (2, '����� ������� ��������',         '12.07.1994'),
           (2, '������� �������� ����������',    '06.03.1994'),
           (2, '�������� ����� �����������',     '09.11.1994'),
           (2, '������� ����� ���������',        '04.10.1994'),
           (2, '��������� ��������� ����������', '08.01.1994'),
           (3, '������� ������ ���������',       '02.08.1993'),
           (3, '������� ��� ����������',         '07.12.1993'),
           (3, '������� ����� �����������',      '02.12.1993'),
           (4, '������� ������ �����������',     '08.03.1992'),
           (4, '������� ����� �������������',    '02.06.1992'),
           (4, '�������� ����� �����������',     '11.12.1992'),
           (4, '�������� ������� �������������', '11.05.1992'),
           (4, '����������� ������� ��������',   '09.11.1992'),
           (4, '�������� ������� ����������',    '01.11.1992'),
           (5, '�������� ����� ������������',    '08.07.1995'),
(5, '������ ������� ����������',      '02.11.1995'),
           (5, '������ ��������� �����������',   '07.05.1995'),
           (5, '����� ��������� ���������',      '04.08.1995'),
           (6, '���������� ����� ����������',    '08.11.1994'),
           (6, '�������� ������ ��������',       '02.03.1994'),
           (6, '���������� ����� ����������',    '04.06.1994'),
           (6, '��������� ���������� ���������', '09.11.1994'),
           (6, '����� ��������� �������',        '04.07.1994'),
           (7, '����������� ����� ������������', '03.01.1993'),
           (7, '������� ���� ��������',          '12.09.1993'),
           (7, '��������� ������ ��������',      '12.06.1993'),
           (7, '���������� ��������� ����������','09.02.1993'),
           (7, '������� ������ ���������',       '04.07.1993'),
           (8, '������ ������� ���������',       '08.01.1992'),
           (8, '��������� ����� ����������',     '12.05.1992'),
           (8, '�������� ����� ����������',      '08.11.1992'),
           (8, '������� ������� ���������',      '12.03.1992'),
           (9, '�������� ����� �������������',   '10.08.1995'),
           (9, '���������� ������ ��������',     '02.05.1995'),
           (9, '������ ������� �������������',   '08.01.1995'),
           (9, '��������� ��������� ��������',   '11.09.1995'),
           (10, '������ ������� ������������',   '08.01.1994'),
           (10, '������ ������ ����������',      '11.09.1994'),
           (10, '����� ���� �������������',      '06.04.1994'),
           (10, '������� ������ ����������',     '12.08.1994');
insert into STUDENT (IDGROUP,NAME, BDAY)
    values (11, '��������� ��������� ����������','07.11.1993'),
           (11, '������ ������� ����������',     '04.06.1993'),
           (11, '������� ����� ����������',      '10.12.1993'),
           (11, '������� ������ ����������',     '04.07.1993'),
           (11, '������� ����� ���������',       '08.01.1993'),
           (11, '����� ������� ����������',      '02.09.1993'),
           (12, '���� ������ �����������',       '11.12.1995'),
           (12, '������� ���� �������������',    '10.06.1995'),
           (12, '��������� ���� ���������',      '09.08.1995'),
           (12, '����� ����� ���������',         '04.07.1995'),
           (12, '��������� ������ ����������',   '08.03.1995'),
           (12, '����� ����� ��������',          '12.09.1995'),
           (13, '������ ����� ������������',     '08.10.1994'),
           (13, '���������� ����� ����������',   '10.02.1994'),
           (13, '�������� ������� �������������','11.11.1994'),
           (13, '���������� ����� ����������',   '10.02.1994'),
           (13, '����������� ����� ��������',    '12.01.1994'),
           (14, '�������� ������� �������������','11.09.1993'),
           (14, '������ �������� ����������',    '01.12.1993'),
           (14, '���� ������� ����������',       '09.06.1993'),
           (14, '�������� ���������� ����������','05.01.1993'),
           (14, '����������� ����� ����������',  '01.07.1993'),
           (15, '������� ��������� ���������',   '07.04.1992'),
           (15, '������ �������� ���������',     '10.12.1992'),
           (15, '��������� ����� ����������',    '05.05.1992'),
           (15, '���������� ����� ������������', '11.01.1992'),
           (15, '�������� ����� ����������',     '04.06.1992'),
           (16, '����� ����� ����������',        '08.01.1994'),
           (16, '��������� ��������� ���������', '07.02.1994'),
           (16, '������ ������ �����������',     '12.06.1994'),
           (16, '������� ����� ��������',        '03.07.1994'),
           (16, '������ ������ ���������',       '04.07.1994'),
           (17, '������� ��������� ����������',  '08.11.1993'),
           (17, '������ ����� ����������',       '02.04.1993'),
           (17, '������ ���� ��������',          '03.06.1993'),
           (17, '������� ������ ���������',      '05.11.1993'),
           (17, '������ ������ �������������',   '03.07.1993'),
           (18, '��������� ����� ��������',      '08.01.1995'),
(18, '���������� ��������� ���������','06.09.1995'),
           (18, '�������� ��������� ����������', '08.03.1995'),
           (18, '��������� ����� ��������',      '07.08.1995');

------�������� � ���������� ������� PROGRESS
create table PROGRESS
 (  SUBJECT_T   char(10) constraint PROGRESS_SUBJECT_FK foreign key
                      references SUBJECT_T(SUBJECT_T),                
     IDSTUDENT integer  constraint PROGRESS_IDSTUDENT_FK foreign key         
                      references STUDENT(IDSTUDENT),        
     PDATE    date, 
     NOTE     integer check (NOTE between 1 and 10)
  )
insert into PROGRESS (SUBJECT_T, IDSTUDENT, PDATE, NOTE)
    values  ('����', 1001,  '01.10.2013',8),
           ('����', 1002,  '01.10.2013',7),
           ('����', 1003,  '01.10.2013',5),
           ('����', 1005,  '01.10.2013',4);
insert into PROGRESS (SUBJECT_T, IDSTUDENT, PDATE, NOTE)
    values   ('����', 1014,  '01.12.2013',5),
           ('����', 1015,  '01.12.2013',9),
           ('����', 1016,  '01.12.2013',5),
           ('����', 1017,  '01.12.2013',4);
insert into PROGRESS (SUBJECT_T, IDSTUDENT, PDATE, NOTE)
    values ('��',   1018,  '06.5.2013',4),
           ('��',   1019,  '06.05.2013',7),
           ('��',   1020,  '06.05.2013',7),
           ('��',   1021,  '06.05.2013',9),
           ('��',   1022,  '06.05.2013',5),
           ('��',   1023,  '06.05.2013',6);
  
  
SELECT AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
FROM AUDITORIUM
INNER JOIN AUDITORIUM_TYPE ON AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;

SELECT AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
FROM AUDITORIUM
INNER JOIN AUDITORIUM_TYPE ON AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
WHERE AUDITORIUM_TYPE.AUDITORIUM_TYPENAME LIKE '%���������%';

SELECT FACULTY.FACULTY_NAME AS ���������, PULPIT.PULPIT_NAME AS �������,
       GROUPS.PROFESSION AS �������������, SUBJECT_T.SUBJECT_NAME AS ����������,
       STUDENT.NAME AS [��� ��������],
       CASE
           WHEN PROGRESS.NOTE = 6 THEN '�����'
           WHEN PROGRESS.NOTE = 7 THEN '����'
           WHEN PROGRESS.NOTE = 8 THEN '������'
       END AS ������
FROM PROGRESS
INNER JOIN SUBJECT_T ON PROGRESS.SUBJECT_T = SUBJECT_T.SUBJECT_T
INNER JOIN STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
INNER JOIN GROUPS ON STUDENT.IDGROUP = GROUPS.IDGROUP
INNER JOIN PULPIT ON SUBJECT_T.PULPIT = PULPIT.PULPIT
INNER JOIN FACULTY ON PULPIT.FACULTY = FACULTY.FACULTY
WHERE PROGRESS.NOTE BETWEEN 6 AND 8
ORDER BY PROGRESS.NOTE DESC;

SELECT PULPIT.PULPIT_NAME AS �������, ISNULL(TEACHER.TEACHER_NAME, '***') AS �������������
FROM PULPIT
LEFT OUTER JOIN TEACHER 
ON PULPIT.PULPIT = TEACHER.PULPIT;

SELECT AT.AUDITORIUM_TYPE, A.AUDITORIUM
FROM AUDITORIUM_TYPE AT
FULL OUTER JOIN AUDITORIUM A 
ON AT.AUDITORIUM_TYPE = A.AUDITORIUM_TYPE;

SELECT AUDITORIUM_TYPE.AUDITORIUM_TYPENAME AS [��� ���������], AUDITORIUM.AUDITORIUM_NAME AS [�������� ���������]
FROM AUDITORIUM_TYPE
CROSS JOIN AUDITORIUM;

--------------------------------- 5 lab -----------------------------------

SELECT PULPIT.PULPIT_NAME
FROM PULPIT
WHERE PULPIT.FACULTY IN (
    SELECT PROFESSION.FACULTY
    FROM PROFESSION
    WHERE PROFESSION.PROFESSION_NAME LIKE '%����������%'
       OR PROFESSION.PROFESSION_NAME LIKE '%����������%'
);

SELECT DISTINCT PULPIT.PULPIT_NAME
FROM PULPIT INNER JOIN PROFESSION 
ON PULPIT.FACULTY = PROFESSION.FACULTY
WHERE PROFESSION.PROFESSION_NAME LIKE '%����������%'
   OR PROFESSION.PROFESSION_NAME LIKE '%����������%';


SELECT PULPIT.PULPIT_NAME,FACULTY.FACULTY
FROM PULPIT
INNER JOIN FACULTY
ON PULPIT.FACULTY = FACULTY.FACULTY
INNER JOIN PROFESSION 
ON FACULTY.FACULTY = PROFESSION.FACULTY
WHERE PROFESSION_NAME LIKE '%����������%'
  OR PROFESSION_NAME LIKE '%����������%'


SELECT AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY
FROM AUDITORIUM
WHERE AUDITORIUM_CAPACITY = (
    SELECT TOP(1) AUDITORIUM_CAPACITY
    FROM AUDITORIUM
    WHERE AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE
)
ORDER BY AUDITORIUM_CAPACITY DESC;


SELECT FACULTY_NAME
FROM FACULTY
WHERE NOT EXISTS (
    SELECT PULPIT_NAME from PULPIT
 
    WHERE PULPIT.PULPIT_NAME = FACULTY.FACULTY_NAME
)

SELECT 
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT_T = '����') [AVG_OAIP],
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT_T  = '��')  [AVG_BD],
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT_T  = '����') [AVG_SUBD]
  FROM PROGRESS


  SELECT PULPIT_NAME, FACULTY
FROM PULPIT 
WHERE PULPIT_NAME >= ALL (
    SELECT PULPIT_NAME
    FROM PULPIT
    WHERE FACULTY LIKE '%�����%'
)


SELECT PULPIT_NAME, FACULTY
FROM PULPIT
WHERE PULPIT_NAME >= ANY (
    SELECT PULPIT_NAME
    FROM PULPIT
    WHERE FACULTY LIKE '%�����%'
)

----------------------------------- 6 lab ------------------------------

SELECT AUDITORIUM.AUDITORIUM_TYPE,
		MAX(AUDITORIUM.AUDITORIUM_CAPACITY)[������������ ���������������],
		MIN(AUDITORIUM.AUDITORIUM_CAPACITY)[����������� ���������������],
		AVG(AUDITORIUM.AUDITORIUM_CAPACITY)[������� ���������������],
		SUM(AUDITORIUM.AUDITORIUM_CAPACITY)[����� ����������������],
		COUNT(*)[���������� ���������]
FROM AUDITORIUM
GROUP BY AUDITORIUM.AUDITORIUM_TYPE;


SELECT *
FROM (SELECT CASE 
			 WHEN PROGRESS.NOTE BETWEEN 1 AND 3 THEN '�������'
			 WHEN PROGRESS.NOTE BETWEEN 4 AND 7 THEN '�����'
			 ELSE '����� �� �������'
			 END [������� ������], COUNT (*) [����������]
	  FROM PROGRESS GROUP BY CASE
							 WHEN PROGRESS.NOTE BETWEEN 1 AND 3 THEN '�������'
							 WHEN PROGRESS.NOTE BETWEEN 4 AND 7 THEN '�����'
							 ELSE '����� �� �������'
							 END ) AS T 
								   ORDER BY CASE[������� ������]
											WHEN '�������' THEN 3
											WHEN '�����' THEN 2
											WHEN '����� �� �������' THEN 1
											ELSE 0
											END;

SELECT F.FACULTY, G.PROFESSION, 
	   (2013 - G.YEAR_FIRST + 1)[����],
	   ROUND(AVG(CAST(P.NOTE AS FLOAT(4))), 2)[������� ������]
FROM FACULTY F 
	INNER JOIN GROUPS G ON F.FACULTY = G.FACULTY
	INNER JOIN STUDENT S ON G.IDGROUP = S.IDGROUP
	INNER JOIN PROGRESS P ON S.IDSTUDENT = P.IDSTUDENT
GROUP BY F.FACULTY, G.PROFESSION, G.YEAR_FIRST;


SELECT F.FACULTY, G.PROFESSION, 
	   (2013 - G.YEAR_FIRST + 1)[����],
	   ROUND(AVG(CAST(P.NOTE AS FLOAT(4))), 2)[������� ������]
FROM FACULTY F 
	INNER JOIN GROUPS G ON F.FACULTY = G.FACULTY
	INNER JOIN STUDENT S ON G.IDGROUP = S.IDGROUP
	INNER JOIN PROGRESS P ON S.IDSTUDENT = P.IDSTUDENT
						  WHERE P.SUBJECT_T IN ('����', '����')
GROUP BY F.FACULTY, G.PROFESSION, G.YEAR_FIRST;

SELECT G.PROFESSION, P.SUBJECT_T, ROUND(AVG(CAST(P.NOTE AS FLOAT(4))), 2)[������� ������]
FROM GROUPS G
		INNER JOIN FACULTY ON G.FACULTY = FACULTY.FACULTY
		INNER JOIN STUDENT ON G.IDGROUP = STUDENT.IDGROUP
		INNER JOIN PROGRESS P ON P.IDSTUDENT = STUDENT.IDSTUDENT
		WHERE FACULTY.FACULTY = '�OB'
GROUP BY G.PROFESSION, P.SUBJECT_T


SELECT P.SUBJECT_T, COUNT(*)[����������]
FROM PROGRESS P
GROUP BY P.SUBJECT_T, P.NOTE
					HAVING P.NOTE >= 8 AND P.NOTE <= 9


---------------------------- lab 7 -------------------------

SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('���')
GROUP BY ROLLUP( GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY );


SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('���')
GROUP BY CUBE( GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY );

SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('����')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY
UNION
SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('���')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY ;


SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('����')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY
UNION ALL
SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('���')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY ;


SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('����')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY
INTERSECT
SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('���')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY


SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('����')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY
EXCEPT
SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('���')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY

----------------------- lab8 -------------------------------
Create VIEW [�������������] 
AS select GENDER[���], PULPIT[�������], TEACHER[���], TEACHER_NAME[���]
	from TEACHER;

SELECT * FROM �������������;


Create VIEW[����������_������]
as select FACULTY_NAME[���������], COUNT(PULPIT)[���������� ������]
		from FACULTY inner join PULPIT
		on FACULTY.FACULTY = PULPIT.FACULTY 
		group by FACULTY_NAME;

select * from ����������_������;


create VIEW[���������]
as select AUDITORIUM[�����_���������], AUDITORIUM_TYPE[��������]
from AUDITORIUM 
where AUDITORIUM.AUDITORIUM_TYPE like '��%'

select * from ���������;


create VIEW ����������_���������(�����_���������,��������)
as select AUDITORIUM, AUDITORIUM_TYPE
from AUDITORIUM 
where AUDITORIUM.AUDITORIUM_TYPE like '��%' WITH CHECK OPTION

insert ����������_��������� values('934-1', '��');

select * from ����������_���������;


create VIEW ����������(���, ������������_����������, ���_�������)
as select TOP 100 SUBJECT_T, SUBJECT_NAME, PULPIT
from SUBJECT_T order by SUBJECT_T.SUBJECT_NAME

select * from ����������;


ALTER VIEW [����������_������] with SCHEMABINDING
as select		fclt.FACULTY_NAME		[���������],
				count(plpt.PULPIT)		[����������_������]
				from dbo.FACULTY fclt inner join dbo.PULPIT plpt
				on fclt.FACULTY = plpt.FACULTY 
				group by FACULTY_NAME;
	
select * from ����������_������;