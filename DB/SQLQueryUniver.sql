USE Master
CREATE database UNIVER;

use UNIVER
create table AUDITORIUM_TYPE 
(    AUDITORIUM_TYPE  char(10) constraint AUDITORIUM_TYPE_PK  primary key,  
      AUDITORIUM_TYPENAME  varchar(30)       
 )
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )        values ('ЛК',            'Лекционная');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )         values ('ЛБ-К',          'Компьютерный класс');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )         values ('ЛК-К',          'Лекционная с уст. проектором');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )          values  ('ЛБ-X',          'Химическая лаборатория');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )        values  ('ЛБ-СК',   'Спец. компьютерный класс');

-------------Создание и заполнение таблицы AUDITORIUM  
  create table AUDITORIUM 
(   AUDITORIUM   char(20)  constraint AUDITORIUM_PK  primary key,              
    AUDITORIUM_TYPE     char(10) constraint  AUDITORIUM_AUDITORIUM_TYPE_FK foreign key         
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE), 
   AUDITORIUM_CAPACITY  integer constraint  AUDITORIUM_CAPACITY_CHECK default 1  check (AUDITORIUM_CAPACITY between 1 and 300),  -- вместимость 
   AUDITORIUM_NAME      varchar(50)                                     
)

insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME,  
 AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
values  ('206-1', '206-1','ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) 
values  ('301-1',   '301-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
values  ('236-1',   '236-1', 'ЛК',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
values  ('313-1',   '313-1', 'ЛК-К',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
values  ('324-1',   '324-1', 'ЛК-К',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
 values  ('413-1',   '413-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY ) 
values  ('423-1',   '423-1', 'ЛБ-К', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )     
values  ('408-2',   '408-2', 'ЛК',  90);

------Создание и заполнение таблицы FACULTY
  create table FACULTY
  (    FACULTY      char(10)   constraint  FACULTY_PK primary key,
       FACULTY_NAME  varchar(50) default '???'
  );
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ХТиТ',   'Химическая технология и техника');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ЛХФ',     'Лесохозяйственный факультет');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ИЭФ',     'Инженерно-экономический факультет');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ТТЛП',    'Технология и техника лесной промышленности');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ТОВ',     'Технология органических веществ');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ИТ',     'Факультет информационных технологий');  
------Создание и заполнение таблицы PROFESSION
   create table PROFESSION
  (   PROFESSION   char(20) constraint PROFESSION_PK  primary key,
       FACULTY    char(10) constraint PROFESSION_FACULTY_FK foreign key 
                            references FACULTY(FACULTY),
       PROFESSION_NAME varchar(100),    QUALIFICATION   varchar(50)  
  );  
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('ИТ',  '1-40 01 02',   'Информационные системы и технологии', 'инженер-программист-системотехник' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('ИТ',  '1-47 01 01', 'Издательское дело', 'редактор-технолог' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)    values    ('ИТ',  '1-36 06 01',  'Полиграфическое оборудование и системы обработки информации', 'инженер-электромеханик' );                     
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)  values    ('ХТиТ',  '1-36 01 08',    'Конструирование и производство изделий из композиционных материалов', 'инженер-механик' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('ХТиТ',  '1-36 07 01',  'Машины и аппараты химических производств и предприятий строительных материалов', 'инженер-механик' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('ЛХФ',  '1-75 01 01',      'Лесное хозяйство', 'инженер лесного хозяйства' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)   values    ('ЛХФ',  '1-75 02 01',   'Садово-парковое строительство', 'инженер садово-паркового строительства' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)   values    ('ЛХФ',  '1-89 02 02',     'Туризм и природопользование', 'специалист в сфере туризма' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('ИЭФ',  '1-25 01 07',  'Экономика и управление на предприятии', 'экономист-менеджер' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('ИЭФ',  '1-25 01 08',    'Бухгалтерский учет, анализ и аудит', 'экономист' );                      
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)  values    ('ТТЛП',  '1-36 05 01',   'Машины и оборудование лесного комплекса', 'инженер-механик' );
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)   values    ('ТТЛП',  '1-46 01 01',      'Лесоинженерное дело', 'инженер-технолог' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)      values    ('ТОВ',  '1-48 01 02',  'Химическая технология органических веществ, материалов и изделий', 'инженер-химик-технолог' );                
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)    values    ('ТОВ',  '1-48 01 05',    'Химическая технология переработки древесины', 'инженер-химик-технолог' );

 insert into PROFESSION(FACULTY, PROFESSION,    PROFESSION_NAME, QUALIFICATION)  values    ('ТОВ',  '1-54 01 03',   'Физико-химические методы и приборы контроля качества продукции', 'инженер по сертификации' ); 

------Создание и заполнение таблицы PULPIT
  create table  PULPIT 
(   PULPIT   char(20)  constraint PULPIT_PK  primary key,
    PULPIT_NAME  varchar(100), 
    FACULTY   char(10)   constraint PULPIT_FACULTY_FK foreign key 
                         references FACULTY(FACULTY) 
);  
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY )
  values  ('ИСиТ', 'Информационных систем и технологий ','ИТ'  );
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
    values  ('ЛВ', 'Лесоводства','ЛХФ')      ;    
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('ЛУ', 'Лесоустройства','ЛХФ')  ;         
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
  values  ('ЛЗиДВ', 'Лесозащиты и древесиноведения','ЛХФ')   ;             
insert into PULPIT   (PULPIT,  PULPIT_NAME, FACULTY)
   values  ('ЛКиП', 'Лесных культур и почвоведения','ЛХФ') ;
insert into PULPIT   (PULPIT,  PULPIT_NAME, FACULTY)
   values  ('ТиП', 'Туризма и природопользования','ЛХФ')         ;     
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('ЛПиСПС','Ландшафтного проектирования и садово-паркового строительства','ЛХФ')   ;       
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('ТЛ', 'Транспорта леса', 'ТТЛП')    ;                      
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('ЛМиЛЗ','Лесных машин и технологии лесозаготовок','ТТЛП')  ;
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('ТДП','Технологий деревообрабатывающих производств', 'ТТЛП')  ; 
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
values  ('ТиДИД','Технологии и дизайна изделий из древесины','ТТЛП')   ; 
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
values  ('ОХ', 'Органической химии','ТОВ') ;
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
 values  ('ХПД','Химической переработки древесины','ТОВ');             
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
 values  ('ТНВиОХТ','Технологии неорганических веществ и общей химической технологии ','ХТиТ') ;
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
    values  ('ПиАХП','Процессов и аппаратов химических производств','ХТиТ')    ;                                           
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
values  ('ЭТиМ',    'Экономической теории и маркетинга','ИЭФ') ;  
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
  values  ('МиЭП',   'Менеджмента и экономики природопользования','ИЭФ')   ;
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
   values  ('СБУАиА', 'Статистики, бухгалтерского учета, анализа и аудита', 'ИЭФ') ;    
             
------Создание и заполнение таблицы TEACHER
 create table TEACHER
 (   TEACHER    char(10)  constraint TEACHER_PK  primary key,
     TEACHER_NAME  varchar(100), 
     GENDER     char(1) CHECK (GENDER in ('м', 'ж')),
     PULPIT   char(20) constraint TEACHER_PULPIT_FK foreign key 
                         references PULPIT(PULPIT) 
 );
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT )
                       values  ('СМЛВ',    'Смелов Владимир Владиславович', 'м',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('АКНВЧ',    'Акунович Станислав Иванович', 'м', 'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('КЛСНВ',    'Колесников Виталий Леонидович', 'м', 'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('БРКВЧ',    'Бракович Андрей Игоревич', 'м', 'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('ДТК',     'Дятко Александр Аркадьевич', 'м', 'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('УРБ',     'Урбанович Павел Павлович', 'м', 'ИСиТ');

insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                      values  ('ГРН',     'Гурин Николай Иванович', 'м', 'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('ЖЛК',     'Жиляк Надежда Александровна',  'ж', 'ИСиТ');                     
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('МРЗ',     'Мороз Елена Станиславовна',  'ж',   'ИСиТ');                                                                                           
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
             values  ('БРТШВЧ',   'Барташевич Святослав Александрович', 'м','ПиАХП');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('АРС',     'Арсентьев Виталий Арсентьевич', 'м', 'ПиАХП');                       
insert into  TEACHER    (TEACHER,  TEACHER_NAME,GENDER, PULPIT )
                       values  ('БРНВСК',   'Барановский Станислав Иванович', 'м', 'ЭТиМ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('НВРВ',   'Неверов Александр Васильевич', 'м', 'МиЭП');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('РВКЧ',   'Ровкач Андрей Иванович', 'м', 'ЛВ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('ДМДК', 'Демидко Марина Николаевна',  'ж',  'ЛПиСПС');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('БРГ',     'Бурганская Татьяна Минаевна', 'ж', 'ЛПиСПС');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('РЖК',   'Рожков Леонид Николаевич ', 'м', 'ЛВ');                      
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('ЗВГЦВ',   'Звягинцев Вячеслав Борисович', 'м', 'ЛЗиДВ'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('БЗБРДВ',   'Безбородов Владимир Степанович', 'м', 'ОХ'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('НСКВЦ',   'Насковец Михаил Трофимович', 'м', 'ТЛ');

------Создание и заполнение таблицы SUBJECT_T
create table SUBJECT_T
    (     SUBJECT_T  char(10) constraint SUBJECT_PK  primary key, 
           SUBJECT_NAME varchar(100) unique,
           PULPIT  char(20) constraint SUBJECT_PULPIT_FK foreign key 
                         references PULPIT(PULPIT)   
     )
 insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('СУБД',   'Системы управления базами данных', 'ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT)
                       values ('БД',     'Базы данных','ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('ИНФ',    'Информационные технологии','ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('ОАиП',  'Основы алгоритмизации и программирования', 'ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('ПЗ',     'Представление знаний в компьютерных системах', 'ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('ПСП',    'Программирование сетевых приложений', 'ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('МСОИ',  'Моделирование систем обработки информации', 'ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('ПИС',     'Проектирование информационных систем', 'ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('КГ',      'Компьютерная геометрия ','ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
           values ('ПМАПЛ',   'Полиграф. машины, автоматы и поточные линии', 'ПиАХП');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('КМС',     'Компьютерные мультимедийные системы', 'ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('ОПП',     'Организация полиграф. производства', 'ПиАХП');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT)
                       values ('ДМ',   'Дискретная математика', 'ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                      values ('МП',   'Математическое программирование','ИСиТ');  
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
               values ('ЛЭВМ', 'Логические основы ЭВМ',  'ИСиТ');                   
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
               values ('ООП',  'Объектно-ориентированное программирование', 'ИСиТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('ЭП', 'Экономика природопользования','МиЭП');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('ЭТ', 'Экономическая теория','ЭТиМ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('БЛЗиПсOO','Биология лесных зверей и птиц с осн. охотов.','ОХ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('ОСПиЛПХ','Основы садово-паркового и лесопаркового хозяйства',  'ЛПиСПС');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('ИГ', 'Инженерная геодезия ','ЛУ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('ЛВ',    'Лесоводство', 'ЛЗиДВ') ;
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('ОХ',    'Органическая химия', 'ОХ')   ;
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('ТРИ',    'Технология резиновых изделий','ТНВиОХТ') ;
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('ВТЛ',    'Водный транспорт леса','ТЛ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('ТиОЛ',   'Технология и оборудование лесозаготовок', 'ЛМиЛЗ') ;

insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('ТОПИ',   'Технология обогащения полезных ископаемых ','ТНВиОХТ');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('ПЭХ',    'Прикладная электрохимия','ТНВиОХТ') ;                                                                                                                                                          
  
------Создание и заполнение таблицы GROUPS
create table GROUPS 
(   IDGROUP  integer  identity(1,1) constraint GROUP_PK  primary key,              
    FACULTY   char(10) constraint  GROUPS_FACULTY_FK foreign key         
                                                         references FACULTY(FACULTY), 
     PROFESSION  char(20) constraint  GROUPS_PROFESSION_FK foreign key         
                                                         references PROFESSION(PROFESSION),
    YEAR_FIRST  smallint  check (YEAR_FIRST<=YEAR(GETDATE())),                  
  )
insert into GROUPS   (FACULTY,  PROFESSION, YEAR_FIRST )
         values ('ХТиТ','1-40 01 02', 2013), --1
                ('ХТиТ','1-40 01 02', 2012),
                ('ХТиТ','1-40 01 02', 2011),
                ('ХТиТ','1-40 01 02', 2010),
                ('ХТиТ','1-47 01 01', 2013),---5 гр
                ('ХТиТ','1-47 01 01', 2012),
                ('ХТиТ','1-47 01 01', 2011),
                ('ХТиТ','1-36 06 01', 2010),-----8 гр
                ('ХТиТ','1-36 06 01', 2013),
                ('ХТиТ','1-36 06 01', 2012),
                ('ХТиТ','1-36 06 01', 2011),
                ('ХТиТ','1-36 01 08', 2013),---12 гр                                                  
                ('ХТиТ','1-36 01 08', 2012),
                ('ХТиТ','1-36 07 01', 2011),
                ('ХТиТ','1-36 07 01', 2010),
                ('ТОВ','1-48 01 02', 2012), ---16 гр 
                ('ТОВ','1-48 01 02', 2011),
                ('ТОВ','1-48 01 05', 2013),
                ('ТОВ','1-54 01 03', 2012),
                ('ЛХФ','1-75 01 01', 2013),--20 гр      
                ('ЛХФ','1-75 02 01', 2012),
                ('ЛХФ','1-75 02 01', 2011),
                ('ЛХФ','1-89 02 02', 2012),
                ('ЛХФ','1-89 02 02', 2011),  
                ('ТТЛП','1-36 05 01', 2013),
                ('ТТЛП','1-36 05 01', 2012),
                ('ТТЛП','1-46 01 01', 2012),--27 гр
                ('ИЭФ','1-25 01 07', 2013), 
                ('ИЭФ','1-25 01 07', 2012),     
                ('ИЭФ','1-25 01 07', 2010),
                ('ИЭФ','1-25 01 08', 2013),
                ('ИЭФ','1-25 01 08', 2012); ---32 гр       
                          
------Создание и заполнение таблицы STUDENT
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
    values (2, 'Силюк Валерия Ивановна',         '12.07.1994'),
           (2, 'Сергель Виолетта Николаевна',    '06.03.1994'),
           (2, 'Добродей Ольга Анатольевна',     '09.11.1994'),
           (2, 'Подоляк Мария Сергеевна',        '04.10.1994'),
           (2, 'Никитенко Екатерина Дмитриевна', '08.01.1994'),
           (3, 'Яцкевич Галина Иосифовна',       '02.08.1993'),
           (3, 'Осадчая Эла Васильевна',         '07.12.1993'),
           (3, 'Акулова Елена Геннадьевна',      '02.12.1993'),
           (4, 'Плешкун Милана Анатольевна',     '08.03.1992'),
           (4, 'Буянова Мария Александровна',    '02.06.1992'),
           (4, 'Харченко Елена Геннадьевна',     '11.12.1992'),
           (4, 'Крученок Евгений Александрович', '11.05.1992'),
           (4, 'Бороховский Виталий Петрович',   '09.11.1992'),
           (4, 'Мацкевич Надежда Валерьевна',    '01.11.1992'),
           (5, 'Логинова Мария Вячеславовна',    '08.07.1995'),
(5, 'Белько Наталья Николаевна',      '02.11.1995'),
           (5, 'Селило Екатерина Геннадьевна',   '07.05.1995'),
           (5, 'Дрозд Анастасия Андреевна',      '04.08.1995'),
           (6, 'Козловская Елена Евгеньевна',    '08.11.1994'),
           (6, 'Потапнин Кирилл Олегович',       '02.03.1994'),
           (6, 'Равковская Ольга Николаевна',    '04.06.1994'),
           (6, 'Ходоронок Александра Вадимовна', '09.11.1994'),
           (6, 'Рамук Владислав Юрьевич',        '04.07.1994'),
           (7, 'Неруганенок Мария Владимировна', '03.01.1993'),
           (7, 'Цыганок Анна Петровна',          '12.09.1993'),
           (7, 'Масилевич Оксана Игоревна',      '12.06.1993'),
           (7, 'Алексиевич Елизавета Викторовна','09.02.1993'),
           (7, 'Ватолин Максим Андреевич',       '04.07.1993'),
           (8, 'Синица Валерия Андреевна',       '08.01.1992'),
           (8, 'Кудряшова Алина Николаевна',     '12.05.1992'),
           (8, 'Мигулина Елена Леонидовна',      '08.11.1992'),
           (8, 'Шпиленя Алексей Сергеевич',      '12.03.1992'),
           (9, 'Астафьев Игорь Александрович',   '10.08.1995'),
           (9, 'Гайтюкевич Андрей Игоревич',     '02.05.1995'),
           (9, 'Рученя Наталья Александровна',   '08.01.1995'),
           (9, 'Тарасевич Анастасия Ивановна',   '11.09.1995'),
           (10, 'Жоглин Николай Владимирович',   '08.01.1994'),
           (10, 'Санько Андрей Дмитриевич',      '11.09.1994'),
           (10, 'Пещур Анна Александровна',      '06.04.1994'),
           (10, 'Бучалис Никита Леонидович',     '12.08.1994');
insert into STUDENT (IDGROUP,NAME, BDAY)
    values (11, 'Лавренчук Владислав Николаевич','07.11.1993'),
           (11, 'Власик Евгения Викторовна',     '04.06.1993'),
           (11, 'Абрамов Денис Дмитриевич',      '10.12.1993'),
           (11, 'Оленчик Сергей Николаевич',     '04.07.1993'),
           (11, 'Савинко Павел Андреевич',       '08.01.1993'),
           (11, 'Бакун Алексей Викторович',      '02.09.1993'),
           (12, 'Бань Сергей Анатольевич',       '11.12.1995'),
           (12, 'Сечейко Илья Александрович',    '10.06.1995'),
           (12, 'Кузмичева Анна Андреевна',      '09.08.1995'),
           (12, 'Бурко Диана Францевна',         '04.07.1995'),
           (12, 'Даниленко Максим Васильевич',   '08.03.1995'),
           (12, 'Зизюк Ольга Олеговна',          '12.09.1995'),
           (13, 'Шарапо Мария Владимировна',     '08.10.1994'),
           (13, 'Касперович Вадим Викторович',   '10.02.1994'),
           (13, 'Чупрыгин Арсений Александрович','11.11.1994'),
           (13, 'Воеводская Ольга Леонидовна',   '10.02.1994'),
           (13, 'Метушевский Денис Игоревич',    '12.01.1994'),
           (14, 'Ловецкая Валерия Александровна','11.09.1993'),
           (14, 'Дворак Антонина Николаевна',    '01.12.1993'),
           (14, 'Щука Татьяна Николаевна',       '09.06.1993'),
           (14, 'Коблинец Александра Евгеньевна','05.01.1993'),
           (14, 'Фомичевская Елена Эрнестовна',  '01.07.1993'),
           (15, 'Бесараб Маргарита Вадимовна',   '07.04.1992'),
           (15, 'Бадуро Виктория Сергеевна',     '10.12.1992'),
           (15, 'Тарасенко Ольга Викторовна',    '05.05.1992'),
           (15, 'Афанасенко Ольга Владимировна', '11.01.1992'),
           (15, 'Чуйкевич Ирина Дмитриевна',     '04.06.1992'),
           (16, 'Брель Алеся Алексеевна',        '08.01.1994'),
           (16, 'Кузнецова Анастасия Андреевна', '07.02.1994'),
           (16, 'Томина Карина Геннадьевна',     '12.06.1994'),
           (16, 'Дуброва Павел Игоревич',        '03.07.1994'),
           (16, 'Шпаков Виктор Андреевич',       '04.07.1994'),
           (17, 'Шнейдер Анастасия Дмитриевна',  '08.11.1993'),
           (17, 'Шыгина Елена Викторовна',       '02.04.1993'),
           (17, 'Клюева Анна Ивановна',          '03.06.1993'),
           (17, 'Доморад Марина Андреевна',      '05.11.1993'),
           (17, 'Линчук Михаил Александрович',   '03.07.1993'),
           (18, 'Васильева Дарья Олеговна',      '08.01.1995'),
(18, 'Щигельская Екатерина Андреевна','06.09.1995'),
           (18, 'Сазонова Екатерина Дмитриевна', '08.03.1995'),
           (18, 'Бакунович Алина Олеговна',      '07.08.1995');

------Создание и заполнение таблицы PROGRESS
create table PROGRESS
 (  SUBJECT_T   char(10) constraint PROGRESS_SUBJECT_FK foreign key
                      references SUBJECT_T(SUBJECT_T),                
     IDSTUDENT integer  constraint PROGRESS_IDSTUDENT_FK foreign key         
                      references STUDENT(IDSTUDENT),        
     PDATE    date, 
     NOTE     integer check (NOTE between 1 and 10)
  )
insert into PROGRESS (SUBJECT_T, IDSTUDENT, PDATE, NOTE)
    values  ('ОАиП', 1001,  '01.10.2013',8),
           ('ОАиП', 1002,  '01.10.2013',7),
           ('ОАиП', 1003,  '01.10.2013',5),
           ('ОАиП', 1005,  '01.10.2013',4);
insert into PROGRESS (SUBJECT_T, IDSTUDENT, PDATE, NOTE)
    values   ('СУБД', 1014,  '01.12.2013',5),
           ('СУБД', 1015,  '01.12.2013',9),
           ('СУБД', 1016,  '01.12.2013',5),
           ('СУБД', 1017,  '01.12.2013',4);
insert into PROGRESS (SUBJECT_T, IDSTUDENT, PDATE, NOTE)
    values ('КГ',   1018,  '06.5.2013',4),
           ('КГ',   1019,  '06.05.2013',7),
           ('КГ',   1020,  '06.05.2013',7),
           ('КГ',   1021,  '06.05.2013',9),
           ('КГ',   1022,  '06.05.2013',5),
           ('КГ',   1023,  '06.05.2013',6);
  
  
SELECT AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
FROM AUDITORIUM
INNER JOIN AUDITORIUM_TYPE ON AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;

SELECT AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
FROM AUDITORIUM
INNER JOIN AUDITORIUM_TYPE ON AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
WHERE AUDITORIUM_TYPE.AUDITORIUM_TYPENAME LIKE '%компьютер%';

SELECT FACULTY.FACULTY_NAME AS Факультет, PULPIT.PULPIT_NAME AS Кафедра,
       GROUPS.PROFESSION AS Специальность, SUBJECT_T.SUBJECT_NAME AS Дисциплина,
       STUDENT.NAME AS [Имя Студента],
       CASE
           WHEN PROGRESS.NOTE = 6 THEN 'шесть'
           WHEN PROGRESS.NOTE = 7 THEN 'семь'
           WHEN PROGRESS.NOTE = 8 THEN 'восемь'
       END AS Оценка
FROM PROGRESS
INNER JOIN SUBJECT_T ON PROGRESS.SUBJECT_T = SUBJECT_T.SUBJECT_T
INNER JOIN STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
INNER JOIN GROUPS ON STUDENT.IDGROUP = GROUPS.IDGROUP
INNER JOIN PULPIT ON SUBJECT_T.PULPIT = PULPIT.PULPIT
INNER JOIN FACULTY ON PULPIT.FACULTY = FACULTY.FACULTY
WHERE PROGRESS.NOTE BETWEEN 6 AND 8
ORDER BY PROGRESS.NOTE DESC;

SELECT PULPIT.PULPIT_NAME AS Кафедра, ISNULL(TEACHER.TEACHER_NAME, '***') AS Преподаватель
FROM PULPIT
LEFT OUTER JOIN TEACHER 
ON PULPIT.PULPIT = TEACHER.PULPIT;

SELECT AT.AUDITORIUM_TYPE, A.AUDITORIUM
FROM AUDITORIUM_TYPE AT
FULL OUTER JOIN AUDITORIUM A 
ON AT.AUDITORIUM_TYPE = A.AUDITORIUM_TYPE;

SELECT AUDITORIUM_TYPE.AUDITORIUM_TYPENAME AS [Тип аудитории], AUDITORIUM.AUDITORIUM_NAME AS [Название аудитории]
FROM AUDITORIUM_TYPE
CROSS JOIN AUDITORIUM;

--------------------------------- 5 lab -----------------------------------

SELECT PULPIT.PULPIT_NAME
FROM PULPIT
WHERE PULPIT.FACULTY IN (
    SELECT PROFESSION.FACULTY
    FROM PROFESSION
    WHERE PROFESSION.PROFESSION_NAME LIKE '%технология%'
       OR PROFESSION.PROFESSION_NAME LIKE '%технологии%'
);

SELECT DISTINCT PULPIT.PULPIT_NAME
FROM PULPIT INNER JOIN PROFESSION 
ON PULPIT.FACULTY = PROFESSION.FACULTY
WHERE PROFESSION.PROFESSION_NAME LIKE '%технология%'
   OR PROFESSION.PROFESSION_NAME LIKE '%технологии%';


SELECT PULPIT.PULPIT_NAME,FACULTY.FACULTY
FROM PULPIT
INNER JOIN FACULTY
ON PULPIT.FACULTY = FACULTY.FACULTY
INNER JOIN PROFESSION 
ON FACULTY.FACULTY = PROFESSION.FACULTY
WHERE PROFESSION_NAME LIKE '%технология%'
  OR PROFESSION_NAME LIKE '%технологии%'


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
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT_T = 'ОАиП') [AVG_OAIP],
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT_T  = 'БД')  [AVG_BD],
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT_T  = 'СУБД') [AVG_SUBD]
  FROM PROGRESS


  SELECT PULPIT_NAME, FACULTY
FROM PULPIT 
WHERE PULPIT_NAME >= ALL (
    SELECT PULPIT_NAME
    FROM PULPIT
    WHERE FACULTY LIKE '%инфор%'
)


SELECT PULPIT_NAME, FACULTY
FROM PULPIT
WHERE PULPIT_NAME >= ANY (
    SELECT PULPIT_NAME
    FROM PULPIT
    WHERE FACULTY LIKE '%инфор%'
)

----------------------------------- 6 lab ------------------------------

SELECT AUDITORIUM.AUDITORIUM_TYPE,
		MAX(AUDITORIUM.AUDITORIUM_CAPACITY)[Максимальная вместительность],
		MIN(AUDITORIUM.AUDITORIUM_CAPACITY)[Минимальная вместительность],
		AVG(AUDITORIUM.AUDITORIUM_CAPACITY)[Средняя вместительность],
		SUM(AUDITORIUM.AUDITORIUM_CAPACITY)[Сумма вместительностей],
		COUNT(*)[Количество аудиторий]
FROM AUDITORIUM
GROUP BY AUDITORIUM.AUDITORIUM_TYPE;


SELECT *
FROM (SELECT CASE 
			 WHEN PROGRESS.NOTE BETWEEN 1 AND 3 THEN 'незачёт'
			 WHEN PROGRESS.NOTE BETWEEN 4 AND 7 THEN 'зачёт'
			 ELSE 'зачёт на отлично'
			 END [Пределы оценок], COUNT (*) [Количество]
	  FROM PROGRESS GROUP BY CASE
							 WHEN PROGRESS.NOTE BETWEEN 1 AND 3 THEN 'незачёт'
							 WHEN PROGRESS.NOTE BETWEEN 4 AND 7 THEN 'зачёт'
							 ELSE 'зачёт на отлично'
							 END ) AS T 
								   ORDER BY CASE[Пределы оценок]
											WHEN 'незачёт' THEN 3
											WHEN 'зачёт' THEN 2
											WHEN 'зачёт на отлично' THEN 1
											ELSE 0
											END;

SELECT F.FACULTY, G.PROFESSION, 
	   (2013 - G.YEAR_FIRST + 1)[Курс],
	   ROUND(AVG(CAST(P.NOTE AS FLOAT(4))), 2)[Средняя оценка]
FROM FACULTY F 
	INNER JOIN GROUPS G ON F.FACULTY = G.FACULTY
	INNER JOIN STUDENT S ON G.IDGROUP = S.IDGROUP
	INNER JOIN PROGRESS P ON S.IDSTUDENT = P.IDSTUDENT
GROUP BY F.FACULTY, G.PROFESSION, G.YEAR_FIRST;


SELECT F.FACULTY, G.PROFESSION, 
	   (2013 - G.YEAR_FIRST + 1)[Курс],
	   ROUND(AVG(CAST(P.NOTE AS FLOAT(4))), 2)[Средняя оценка]
FROM FACULTY F 
	INNER JOIN GROUPS G ON F.FACULTY = G.FACULTY
	INNER JOIN STUDENT S ON G.IDGROUP = S.IDGROUP
	INNER JOIN PROGRESS P ON S.IDSTUDENT = P.IDSTUDENT
						  WHERE P.SUBJECT_T IN ('ОАиП', 'СУБД')
GROUP BY F.FACULTY, G.PROFESSION, G.YEAR_FIRST;

SELECT G.PROFESSION, P.SUBJECT_T, ROUND(AVG(CAST(P.NOTE AS FLOAT(4))), 2)[Средняя оценка]
FROM GROUPS G
		INNER JOIN FACULTY ON G.FACULTY = FACULTY.FACULTY
		INNER JOIN STUDENT ON G.IDGROUP = STUDENT.IDGROUP
		INNER JOIN PROGRESS P ON P.IDSTUDENT = STUDENT.IDSTUDENT
		WHERE FACULTY.FACULTY = 'ТOB'
GROUP BY G.PROFESSION, P.SUBJECT_T


SELECT P.SUBJECT_T, COUNT(*)[Количество]
FROM PROGRESS P
GROUP BY P.SUBJECT_T, P.NOTE
					HAVING P.NOTE >= 8 AND P.NOTE <= 9


---------------------------- lab 7 -------------------------

SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('ТОВ')
GROUP BY ROLLUP( GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY );


SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('ТОВ')
GROUP BY CUBE( GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY );

SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('ХТиТ')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY
UNION
SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('ТОВ')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY ;


SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('ХТиТ')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY
UNION ALL
SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('ТОВ')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY ;


SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('ХТиТ')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY
INTERSECT
SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('ТОВ')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY


SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('ХТиТ')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY
EXCEPT
SELECT GROUPS.PROFESSION, PROGRESS.SUBJECT_T,GROUPS.FACULTY, AVG(PROGRESS.NOTE) [MARK]
from GROUPS, PROGRESS, FACULTY, STUDENT
where GROUPS.FACULTY = FACULTY.FACULTY and
FACULTY.FACULTY in ('ТОВ')
GROUP BY GROUPS.PROFESSION, PROGRESS.SUBJECT_T, GROUPS.FACULTY

----------------------- lab8 -------------------------------
Create VIEW [Преподаватель] 
AS select GENDER[Пол], PULPIT[Кафедра], TEACHER[Код], TEACHER_NAME[Имя]
	from TEACHER;

SELECT * FROM Преподаватель;


Create VIEW[Количество_кафедр]
as select FACULTY_NAME[Факультет], COUNT(PULPIT)[Количество кафедр]
		from FACULTY inner join PULPIT
		on FACULTY.FACULTY = PULPIT.FACULTY 
		group by FACULTY_NAME;

select * from Количество_кафедр;


create VIEW[Аудитории]
as select AUDITORIUM[Номер_аудитории], AUDITORIUM_TYPE[Название]
from AUDITORIUM 
where AUDITORIUM.AUDITORIUM_TYPE like 'ЛК%'

select * from Аудитории;


create VIEW Лекционные_аудитории(Номер_аудитории,Название)
as select AUDITORIUM, AUDITORIUM_TYPE
from AUDITORIUM 
where AUDITORIUM.AUDITORIUM_TYPE like 'ЛК%' WITH CHECK OPTION

insert Лекционные_аудитории values('934-1', 'ЛК');

select * from Лекционные_аудитории;


create VIEW Дисциплины(код, наименование_дисциплины, код_кафедры)
as select TOP 100 SUBJECT_T, SUBJECT_NAME, PULPIT
from SUBJECT_T order by SUBJECT_T.SUBJECT_NAME

select * from Дисциплины;


ALTER VIEW [Количество_кафедр] with SCHEMABINDING
as select		fclt.FACULTY_NAME		[Факультет],
				count(plpt.PULPIT)		[Количество_кафедр]
				from dbo.FACULTY fclt inner join dbo.PULPIT plpt
				on fclt.FACULTY = plpt.FACULTY 
				group by FACULTY_NAME;
	
select * from Количество_кафедр;