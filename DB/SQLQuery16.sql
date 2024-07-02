----- 1

select TEACHER_NAME
from TEACHER join PULPIT 
on TEACHER.PULPIT = PULPIT.PULPIT
where PULPIT.PULPIT = '����' for xml RAW('�������'),
root('������_��������������'), elements;

----- 2
select AUDITORIUM_NAME, AUDITORIUM_TYPENAME,
AUDITORIUM_CAPACITY
from AUDITORIUM_TYPE join AUDITORIUM
on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = '��'
order by AUDITORIUM_TYPENAME for xml AUTO,
root('������_���������'), elements;

select AUDITORIUM_NAME, AUDITORIUM_TYPENAME,
AUDITORIUM_CAPACITY
from AUDITORIUM_TYPE join AUDITORIUM
on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = '��'
order by AUDITORIUM_TYPENAME for xml PATH('��������'),
root('������_���������'), elements;

----- 3
declare @h int= 0,
@x varchar(2000)='
   <?xml version="1.0" encoding = "windows-1251" ?>
   <subjects> 
   <subj SUBJECT_T="DE" SUBJECT_NAME="Delovoienglish" PULPIT="En"/> 
   <subj SUBJECT_T="TV" SUBJECT_NAME="Theoryver" PULPIT="M"/> 
   <subj SUBJECT_T="AF" SUBJECT_NAME="Atom_fisika" PULPIT="F"/> 
   </subjects>';
exec sp_xml_preparedocument @h output, @x;  -- ���������� ���������
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
    adress xml  -- ������� XML-���� 
 );

 insert into Passport (NAME,  seria, number, adress)
    values ('����� ��������� ��������', 'BM', '2583553', '<�����>  <������>��������</������>
             <�����>�������</�����>  <�����>��������</�����>
             <���>52</���>    </�����>'); 
insert into Passport (NAME,  seria, number, adress)
    values ('������� �������� ����������', 'BM', '2563553', '<�����>   <������>��������</������>
            <�����>�����</�����>  <�����>�������������</�����>
            <���>35</���>   </�����>'); 
insert into Passport (NAME,  seria, number, adress)
    values ('����� ������� ����������', 'BM', '2522553', '<�����>   <������>��������</������>
            <�����>�����</�����>  <�����>�������������</�����>
            <���>35</���>   </�����>'); 

select * from Passport

update Passport 
        set adress = '<�����> <������>��������</������> 
             <�����>�����</�����>    <�����>�������������</�����>
             <���>45</���> </�����>' 
                where adress.value('(/�����/���)[1]','varchar(10)') = 35;

select Number, 
     adress.value('(/�����/������)[1]','varchar(10)') [������],
     adress.query('/�����')        [�����]
             from  Passport;  
			 
----- 5

use UNIVER
go
create xml schema collection Student as 
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
           elementFormDefault="qualified"
           xmlns:xs="http://www.w3.org/2001/XMLSchema">
       <xs:element name="�������">  
       <xs:complexType><xs:sequence>
       <xs:element name="�������" maxOccurs="1" minOccurs="1">
       <xs:complexType>
       <xs:attribute name="�����" type="xs:string" use="required" />
       <xs:attribute name="�����" type="xs:unsignedInt" use="required"/>
       <xs:attribute name="����"  use="required" >  
       <xs:simpleType>  <xs:restriction base ="xs:string">
   <xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
   </xs:restriction>   </xs:simpleType>
   </xs:attribute> </xs:complexType> 
   </xs:element>
   <xs:element maxOccurs="3" name="�������" type="xs:unsignedInt"/>
   <xs:element name="�����">   <xs:complexType><xs:sequence>
   <xs:element name="������" type="xs:string" />
   <xs:element name="�����" type="xs:string" />
   <xs:element name="�����" type="xs:string" />
   <xs:element name="���" type="xs:string" />
   <xs:element name="��������" type="xs:string" />
   </xs:sequence></xs:complexType>  </xs:element>
   </xs:sequence></xs:complexType>
   </xs:element>
</xs:schema>';


drop table STUDENT;
go
create table STUDENT�� 
(    IDSTUDENT integer  identity(1000,1)  primary key,
      IDGROUP integer  foreign key  references GROUPS(IDGROUP),        
      NAME nvarchar(100), 
      BDAY  date,
      STAMP timestamp,
      INFO   xml(STUDENT),    -- �������������� ������� XML-����
      FOTO  varbinary
  );



INSERT INTO STUDENT�� (INFO)
VALUES (N'
<�������>
    <������� �����="AB" �����="1239856" ����="01.01.2023" />
    <�������>1234567890</�������>
    <�������>3753345502</�������>
    <�����>
        <������>��������</������>
        <�����>�����</�����>
        <�����>���������</�����>
        <���>9</���>
        <��������>4</��������>
    </�����>
</�������>'
);


select * from STUDENT��