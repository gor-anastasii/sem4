DECLARE @name varchar(200), @list varchar(600) = '';
DECLARE first_cursor CURSOR LOCAL FOR SELECT �������������.������� FROM �������������;
--deallocate first_cursor;

OPEN first_cursor;
FETCH first_cursor INTO @name;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @list = RTRIM(@name) + ',' + @list;
    FETCH first_cursor INTO @name;
END;

CLOSE first_cursor;

IF LEN(@list) > 0
BEGIN
    PRINT '��� �����: ' + @list;
END
ELSE
BEGIN
    PRINT '������ �� �������';
END

--------------------------------------------------

go
DECLARE @name varchar(200), @list varchar(600) = '';

OPEN first_cursor;
FETCH first_cursor INTO @name;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @list = RTRIM(@name) + ',' + @list;
    FETCH first_cursor INTO @name;
END;

CLOSE first_cursor;

IF LEN(@list) > 0
BEGIN
    PRINT '��� �����: ' + @list;
END
ELSE
BEGIN
    PRINT '������ �� �������';
END

------------------------------------------

insert into �������������(���_�������������, �������, ���, ��������, �������, ����) 
VALUES
(8, '������������', '�����', '�������������', '3456434', 6);

DECLARE @name2 varchar(200), @list2 varchar(600) = '';
DECLARE first_cursor2 CURSOR LOCAL dynamic /*static*/ FOR SELECT �������������.������� FROM �������������;
--deallocate first_cursor2;

OPEN first_cursor2;
delete ������������� where ������� like '������������';
FETCH first_cursor2 INTO @name2;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @list2 = RTRIM(@name2) + ',' + @list2;
    FETCH first_cursor2 INTO @name2;
END;

CLOSE first_cursor2;

IF LEN(@list2) > 0
BEGIN
    PRINT '��� �����: ' + @list2;
END
ELSE
BEGIN
    PRINT '������ �� �������';
END

--------------------------------------------

DECLARE @name3 varchar(200), @list3 varchar(600) = '';
DECLARE first_cursor3 CURSOR LOCAL static FOR SELECT �������������.������� FROM �������������;
--deallocate first_curso3;

OPEN first_cursor3;
FETCH last from first_cursor3 INTO @name3;
    SET @list3 = '��������� ������: ' +RTRIM(@name3) + ',' + @list3;

FETCH ABSOLUTE 3 FROM first_cursor3 INTO @name3;
	 SET @list3 = '������ ������: ' +RTRIM(@name3) + ',' + @list3;

FETCH ABSOLUTE -2 from first_cursor3 INTO @name3;
	SET @list3 = '������ ������ � �����: ' +RTRIM(@name3) + ',' + @list3;

CLOSE first_cursor3;

IF LEN(@list3) > 0
BEGIN
    PRINT @list3;
END
ELSE
BEGIN
    PRINT '������ �� �������';
END