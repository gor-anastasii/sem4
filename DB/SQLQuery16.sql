----- 1

select TEACHER_NAME
from TEACHER join PULPIT 
on TEACHER.PULPIT = PULPIT.PULPIT
where PULPIT.PULPIT = 'ИСиТ' for xml RAW('Кафедра'),
root('Список_преподавателей'), elements;

----- 2
select AUDITORIUM_NAME, AUDITORIUM_TYPENAME,
AUDITORIUM_CAPACITY
from AUDITORIUM_TYPE join AUDITORIUM
on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = 'ЛК'
order by AUDITORIUM_TYPENAME for xml AUTO,
root('Список_лекционок'), elements;

select AUDITORIUM_NAME, AUDITORIUM_TYPENAME,
AUDITORIUM_CAPACITY
from AUDITORIUM_TYPE join AUDITORIUM
on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = 'ЛК'
order by AUDITORIUM_TYPENAME for xml PATH('Кабинеты'),
root('Список_лекционок'), elements;

----- 3
declare @h int= 0,
@x varchar(2000)='
   <?xml version="1.0" encoding = "windows-1251" ?>
   <subjects> 
   <subj SUBJECT_T="DE" SUBJECT_NAME="Delovoienglish" PULPIT="En"/> 
   <subj SUBJECT_T="TV" SUBJECT_NAME="Theoryver" PULPIT="M"/> 
   <subj SUBJECT_T="AF" SUBJECT_NAME="Atom_fisika" PULPIT="F"/> 
   </subjects>';
exec sp_xml_preparedocument @h output, @x;  -- подготовка документа
insert SUBJECT_T select [SUBJECT_T], [SUBJECT_NAME], [PULPIT] 
           from openxml(@h, '/SUBJECT_T/subj', 0)     
     with([SUBJECT_T] nvarchar(20), [SUBJECT_NAME] varchar(30), [PULPIT] nvarchar(20)) 
     
select * from openxml(@h, '/SUBJECT_T/subj', 0)
     with([SUBJECT_T] nvarchar(20), [SUBJECT_NAME] varchar(30), [PULPIT] nvarchar(20))    
exec sp_xml_removedocument @h; 

----- 4

create table Passport 
(     NAME nvarchar(300) primary key,
    seria  nvarchar(50),
    number int,         
    adress xml  -- столбец XML-типа 
 );

 insert into Passport (NAME,  seria, number, adress)
    values ('Лагун Анастасия Ивановна', 'BM', '2583553', '<адрес>  <страна>Беларусь</страна>
             <город>Витебск</город>  <улица>Еременко</улица>
             <дом>52</дом>    </адрес>'); 
insert into Passport (NAME,  seria, number, adress)
    values ('Конашук Катерина Витальевна', 'BM', '2563553', '<адрес>   <страна>Беларусь</страна>
            <город>Минск</город>  <улица>Кальварийская</улица>
            <дом>35</дом>   </адрес>'); 
insert into Passport (NAME,  seria, number, adress)
    values ('Шиман Дмитрий Васильевич', 'BM', '2522553', '<адрес>   <страна>Беларусь</страна>
            <город>Минск</город>  <улица>Кальварийская</улица>
            <дом>35</дом>   </адрес>'); 

select * from Passport

update Passport 
        set adress = '<адрес> <страна>Беларусь</страна> 
             <город>Минск</город>    <улица>Кальварийская</улица>
             <дом>45</дом> </адрес>' 
                where adress.value('(/адрес/дом)[1]','varchar(10)') = 35;

select Number, 
     adress.value('(/адрес/страна)[1]','varchar(10)') [страна],
     adress.query('/адрес')        [адрес]
             from  Passport;  
			 
----- 5

use UNIVER
go
create xml schema collection Student as 
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
           elementFormDefault="qualified"
           xmlns:xs="http://www.w3.org/2001/XMLSchema">
       <xs:element name="студент">  
       <xs:complexType><xs:sequence>
       <xs:element name="паспорт" maxOccurs="1" minOccurs="1">
       <xs:complexType>
       <xs:attribute name="серия" type="xs:string" use="required" />
       <xs:attribute name="номер" type="xs:unsignedInt" use="required"/>
       <xs:attribute name="дата"  use="required" >  
       <xs:simpleType>  <xs:restriction base ="xs:string">
   <xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
   </xs:restriction>   </xs:simpleType>
   </xs:attribute> </xs:complexType> 
   </xs:element>
   <xs:element maxOccurs="3" name="телефон" type="xs:unsignedInt"/>
   <xs:element name="адрес">   <xs:complexType><xs:sequence>
   <xs:element name="страна" type="xs:string" />
   <xs:element name="город" type="xs:string" />
   <xs:element name="улица" type="xs:string" />
   <xs:element name="дом" type="xs:string" />
   <xs:element name="квартира" type="xs:string" />
   </xs:sequence></xs:complexType>  </xs:element>
   </xs:sequence></xs:complexType>
   </xs:element>
</xs:schema>';


drop table STUDENT;
go
create table STUDENTЕЕ 
(    IDSTUDENT integer  identity(1000,1)  primary key,
      IDGROUP integer  foreign key  references GROUPS(IDGROUP),        
      NAME nvarchar(100), 
      BDAY  date,
      STAMP timestamp,
      INFO   xml(STUDENT),    -- типизированный столбец XML-типа
      FOTO  varbinary
  );



INSERT INTO STUDENTЕЕ (INFO)
VALUES (N'
<студент>
    <паспорт серия="AB" номер="1239856" дата="01.01.2023" />
    <телефон>1234567890</телефон>
    <телефон>3753345502</телефон>
    <адрес>
        <страна>Беларусь</страна>
        <город>Минск</город>
        <улица>Примерная</улица>
        <дом>9</дом>
        <квартира>4</квартира>
    </адрес>
</студент>'
);


select * from STUDENTЕЕ