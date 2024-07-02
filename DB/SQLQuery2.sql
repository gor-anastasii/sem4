USE master;
CREATE database MyBase;

CREATE table ������������� 
(
	���_������������� int primary key,
	������� nvarchar(20),
	��� nvarchar(20),
	�������� nvarchar(20),
	������� int,
	���� int,
);

CREATE table ������ 
(
	�����_������ int primary key,
	������������� nvarchar(20),
	��������� nvarchar(20),
	����������_��������� int,
);

CREATE table �����
(
	���_�������� int primary key,
	������� nvarchar(20),
	���_������� nvarchar(20),
	����������_����� real,
	������ real,
	���_������������� int foreign key references �������������(���_�������������),
	�����_������ int foreign key references ������(�����_������),
);

ALTER table ����� ADD ����_������ date;
ALTER table ����� DROP column ����_������;

INSERT into ������������� (���_�������������, �������, ���, ��������, �������, ����)
	Values(1, '����������', '���������', '���������', 1234566, 2),
		  (2, '����', '�������', '���������', 1654366, 4);

INSERT into ������ (�����_������, �������������, ���������, ����������_���������)
	Values(1, '����', '���', 30),
		  (2, '����', '���', 28),
		  (4, '����', '���', 15);

INSERT into ����� (���_��������, �������, ���_�������, ����������_�����, ������, ���_�������������, �����_������)
	Values(1, '���', '��', 30, 1234, 1, 1),
		  (2, 'JS', '��', 28, 8765, 2, 2);

SELECT �����_������, ����������_��������� from ������;

SELECT count(*) from ������;

SELECT �����_������, ������������� ghvbhgbujnj, ����������_��������� from ������
		WHERE ����������_��������� > 25;

UPDATE ������ set ����������_��������� = ����������_��������� - 1;

DELETE from ������ WHERE �����_������ = 4;

create database MyBase1 on primary
( name = N'MyBase1_mdf', filename = N'C:\AllMine\Labs\DB\MyBase1_mdf.mdf', 
   size = 10240Kb, maxsize=UNLIMITED, filegrowth=1024Kb),
( name = N'MyBase1_ndf', filename = N'C:\AllMine\Labs\DB\MyBase1_ndf.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
filegroup FG1
( name = N'MyBase1_fg1_1', filename = N'C:\AllMine\Labs\DB\MyBase1_fgq-1.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%),
( name = N'MyBase1_fg1_2', filename = N'C:\AllMine\Labs\DB\MyBase1_fgq-2.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%)
log on
( name = N'MyBase1_log', filename=N'C:\AllMine\Labs\DB\MyBase1_log.ldf',       
   size=10240Kb,  maxsize=2048Gb, filegrowth=10%)


   
CREATE table ������������� 
(
	���_������������� int primary key,
	������� nvarchar(20),
	��� nvarchar(20),
	�������� nvarchar(20),
	������� int,
	���� int,
) on FG1;

CREATE table ������ 
(
	�����_������ int primary key,
	������������� nvarchar(20),
	��������� nvarchar(20),
	����������_��������� int,
) on fg1;

CREATE table �����
(
	���_�������� int primary key,
	������� nvarchar(20),
	���_������� nvarchar(20),
	����������_����� real,
	������ real,
	���_������������� int foreign key references �������������(���_�������������),
	�����_������ int foreign key references ������(�����_������),
) on fg1;	



------------ 4 ���� -------------------------------------------------------------

SELECT �������������.�������, �����.������
FROM ������������� INNER JOIN ����� 
ON �����.���_������������� = �������������.���_�������������
WHERE �����.������ LIKE '%23%';

SELECT �����.������� AS �������_��������, �������������.������� AS ������,
       �����.����������_����� AS ������������, �������������.���� AS ����,
       CASE
           WHEN �������������.���� = 2 THEN '��������'
           WHEN �������������.���� = 3 THEN '����'
           WHEN �������������.���� = 4 THEN '����'
       END AS �����
FROM ����� INNER JOIN �������������
ON �����.���_������������� = �������������.���_�������������
WHERE �������������.���� BETWEEN 2 AND 4
ORDER BY �������������.���� DESC;

SELECT �����.������� AS �������, ISNULL(������.�������������, '***') AS ������
FROM �����
LEFT OUTER JOIN ������ 
ON �����.�����_������ = ������.�����_������;

SELECT �.����������_���������, �.�������
FROM ������ � RIGHT JOIN ����� �
ON �.�����_������ = �.�����_������;

SELECT �.�������, �.�������������
FROM ����� � FULL OUTER JOIN ������ �
ON �.�����_������ = �.�����_������;
 
SELECT �����.������� AS [�������], �������������.������� AS [������]
FROM �����
CROSS JOIN �������������;

-------------------------- 5 lab -----------------

SELECT �����.�������, �����.����������_�����
FROM �����
WHERE �����.���_������������� IN (
    SELECT �������������.���_�������������
    FROM �������������
    WHERE �������������.���� LIKE '%4%'
       OR �������������.���� LIKE '%3%'
);

SELECT �����.�������, �����.����������_�����, �������������.�������
FROM ����� INNER JOIN �������������
ON �����.���_������������� = �������������.���_�������������
WHERE �������������.������� LIKE  '%�%'
   OR �������������.������� LIKE '%�%';

SELECT �����.�������, �����.����������_�����
FROM �����
WHERE �����.�����_������ = (
    SELECT TOP(1) ������.�����_������
    FROM ������
    WHERE ������.����������_��������� >= 20 AND ������.�����_������ = �����.�����_������
)
ORDER BY �����.�����_������ DESC;

SELECT �����.�������
FROM �����
WHERE EXISTS (
    SELECT �������������.���_������������� from �������������
    WHERE �������������.������� LIKE '%�%' AND �����.���_������������� = �������������.���_�������������
)

SELECT 
    (SELECT AVG(������) FROM ����� WHERE ������� = '���') [AVG_OOP],
	(SELECT AVG(������) FROM ����� WHERE ������� = 'JS') [AVG_JS],
	(SELECT AVG(������) FROM ����� WHERE ������� = 'Java') [AVG_Java]
FROM �����


SELECT �����.�������, �����.����������_�����
FROM ����� 
WHERE �����.���_������������� >= ALL (
    SELECT �������������.���_�������������
    FROM �������������
    WHERE �������������.������� LIKE '%23%'
)


SELECT �����.�������, �����.����������_�����, �����.���_�������������
FROM ����� 
WHERE �����.���_������������� >= ANY (
    SELECT �������������.���_�������������
    FROM �������������
    WHERE �������������.������� LIKE '%5%'
)

-------------------------------- 6 lab ----------------------
SELECT 
    �����.���_������� AS [��� �������],
    ������.�����_������ AS [����� ������],
    MAX(�����.����������_�����) AS [������������ ���������� �����],
    MIN(�����.����������_�����) AS [����������� ���������� �����],
    AVG(�����.����������_�����) AS [������� ���������� �����],
    SUM(�����.����������_�����) AS [��������� ���������� �����],
    COUNT(*) AS [���������� ���������]
FROM 
    ����� INNER JOIN ������ ON �����.�����_������ = ������.�����_������
GROUP BY 
    �����.���_�������, ������.�����_������;

SELECT 
    CASE 
        WHEN �����.���_������� = '��' THEN '������'
        WHEN �����.���_������� = '��' THEN '������������'
        WHEN �����.���_������� = '��' THEN '������������'
    END AS [��� �������],
    ������.������������� AS [�������������],
    COUNT(*) AS [���������� ������]
FROM ����� INNER JOIN ������ ON �����.�����_������ = ������.�����_������
GROUP BY 
    CASE 
        WHEN �����.���_������� = '��' THEN '������'
        WHEN �����.���_������� = '��' THEN '������������'
        WHEN �����.���_������� = '��' THEN '������������'
    END,
    ������.�������������;

SELECT �����.���_������� AS [��� �������],
	   ������.�����_������ AS [����� ������],
       ROUND(AVG(�����.����������_�����), 2) AS [������� ���������� �����],
       ROUND(AVG(�����.������), 2) AS [������� ������]
FROM ����� INNER JOIN ������ ON �����.�����_������ = ������.�����_������	
GROUP BY ���_�������, ������.�����_������;

SELECT �����.���_������� AS [��� �������],
	   ������.�����_������ AS [����� ������],
       ROUND(AVG(�����.����������_�����), 2) AS [������� ���������� �����],
       ROUND(AVG(�����.������), 2) AS [������� ������]
FROM ����� INNER JOIN ������ ON �����.�����_������ = ������.�����_������	
WHERE ������.�����_������ >= 3
GROUP BY ���_�������, ������.�����_������;

SELECT ���_������� AS [��� �������],
       SUM(������) AS [����� ������]
FROM ����� 
WHERE ���_������� IN('��', '��')
GROUP BY ���_�������;

SELECT �����.������� AS [�������],
	   �������������.������� AS [������� �������������],
       COUNT(*) AS [����������]
FROM ����� INNER JOIN ������������� ON �����.���_������������� = �������������.���_�������������
GROUP BY �����.�������, �������������.�������
HAVING AVG(�����.������) >= 100 AND AVG(�����.������) <= 2000;

----------------------- lab 7 --------------------------------

select �����.�������, �������������.�������, AVG(�����.������)
from ����� inner join �������������
on �����.���_������������� = �������������.���_�������������
group by rollup(�����.�������, �������������.�������);


select �����.�������, �������������.�������, AVG(�����.������)
from ����� inner join �������������
on �����.���_������������� = �������������.���_�������������
group by cube(�����.�������, �������������.�������);


select �����.�������, AVG(�����.������)
from ����� inner join �������������
on �����.���_������������� = �������������.���_�������������
where �����.������� like 'JS'
group by rollup(�����.�������)
UNION
select �����.�������, AVG(�����.������)
from ����� inner join �������������
on �����.���_������������� = �������������.���_�������������
where �����.������� like '���'
group by rollup(�����.�������);


select �����.�������, AVG(�����.������)
from ����� inner join �������������
on �����.���_������������� = �������������.���_�������������
where �����.������� like 'JS'
group by rollup(�����.�������)
intersect
select �����.�������, AVG(�����.������)
from ����� inner join �������������
on �����.���_������������� = �������������.���_�������������
where �����.������� like '���'
group by rollup(�����.�������);


select �����.�������, AVG(�����.������)
from ����� inner join �������������
on �����.���_������������� = �������������.���_�������������
where �����.������� like 'JS'
group by rollup(�����.�������)
except
select �����.�������, AVG(�����.������)
from ����� inner join �������������
on �����.���_������������� = �������������.���_�������������
where �����.������� like '���'
group by rollup(�����.�������);


------------------------------ lab 8 -------------------

create view [�������������]
as select �������[�������], ����[����]
from �������������

select * from �������������


Create VIEW[��������]
as select �����.�������, SUM(������.����������_���������)[���������� ���������]
		from ����� inner join ������
		on �����.�����_������ = ������.�����_������
		group by �������;

select * from ��������;

insert into  ��������(�������, [���������� ���������])
values('fghj', 20)


create VIEW[�������������_�_�]
as select �������[�������], ����[����]
from �������������
where �������������.������� like '%�%'

select * from �������������_�_�;

update �������������_�_�
set ������� = 'fghj', ���� = 20



create VIEW ������(���_��������, �������, ���_�������, ������)
as select ���_��������, �������, ���_�������, ������
from ����� 
where �����.���_������� = '��' WITH CHECK OPTION

insert into ������(���_��������, �������, ���_�������, ������) 
values (10, '���������', '��', 1234);

insert into ������(���_��������, �������, ���_�������, ������) 
values (11, '���������', '��', 1234);

select * from ������;

create VIEW ��������2(���, ��������, ����������_�����)
as select TOP 5 ���_��������, �������, ����������_�����
from ����� order by �����.�������

select * from ��������2;


ALTER VIEW dbo.[�������������] with SCHEMABINDING
as select dbo.�������������.������� [�������������],
		  dbo.�����.������� [�������],
          SUM(dbo.�����.����������_�����) [�������_����]
from dbo.������������� inner join dbo.�����
on dbo.�����.���_������������� = dbo.�������������.���_�������������
group by dbo.�������������.�������, dbo.�����.�������;
	
select * from �������������;


