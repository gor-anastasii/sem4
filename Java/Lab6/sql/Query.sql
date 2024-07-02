
DROP TABLE CITIZENCOUNT;
DROP TABLE CITIZENTYPES;
DROP TABLE CITIES;

drop table status;
Create table Status(
 ID int not null primary key auto_increment,
 name nvarchar(20) unique,
    password blob,
    status nvarchar(10)
);

select * from status;
delete status from status where name='newAdmin';
delete status from status where name='newAdmin2';


drop table universities;
Create table universities(
 ID int not null primary key auto_increment,
 name nvarchar(20) unique,
    rating int,
    address nvarchar(30)
);

select * from universities;
insert into universities(name, rating, address) values('name', 3, 'address');
select count(*) as count from universities where rating = 3;

CREATE TABLE CITIES(
	IDcity INT NOT NULL PRIMARY KEY,
	Name nvarchar(20) not null,
	FoundationYear int not null,
	Area real not null,
	CHECK (Area >= 0)
);

CREATE TABLE CITIZENTYPES(
	IDtype INT NOT NULL PRIMARY KEY,
	Name nvarchar(20) not null,
	Language nvarchar(20) not null
);

CREATE TABLE CITIZENCOUNT(
	IDtype int not null,
	Amount int,
	IDcity int not null,
	FOREIGN KEY (IDtype) REFERENCES CITIZENTYPES(IDtype),
    FOREIGN KEY (IDcity) REFERENCES CITIES(IDcity)
);

INSERT INTO CITIES (IDcity, Name, FoundationYear, Area)
VALUES  (1, 'Minsk', 1067, 348),
		(2, 'Odessa', 1415, 236.6),
		(3, 'Moscow', 1147, 2561),
		(4, 'Riga', 1201, 307),
		(5, 'Warsaw', 1313, 517);

INSERT into CITIZENTYPES(IDtype, Name, Language)
VALUES (1, 'Belarusian', 'Belarusian'),
	   (2, 'Russian', 'Russian'),
       (3, 'Ukrainian', 'Ukrainian'),
       (4, 'Polish', 'Polish'),
       (5, 'Latvian', 'Latvian'),
	   (6, 'Jewish', 'Hebrew'),
       (7, 'Armenian', 'Armenian');

INSERT into CITIZENCOUNT(IDcity, Amount, IDtype)
	values(1, 1753122, 1),
		  (1, 148079, 2),
		  (1, 34662, 3),
		  (1, 19397, 4),
		  (1, 299, 5),
		  (1, 5699, 6),
		  (1, 2509, 7),
		  (2, 6088, 1),
		  (2, 294264, 2),
		  (2, 625057, 3),
		  (2, 12176, 4),
		  (2, 101, 5),
		  (2, 121764, 6),
		  (2, 4058, 7),
		  (3, 17632, 1),
		  (3, 9074375, 2),
		  (3, 58788, 3),
		  (3, 4456, 4),
		  (3, 3291, 5),
		  (3, 28014, 6),
		  (3, 68018, 7),
		  (4, 21778, 1),
		  (4, 216303, 2),
		  (4, 21120, 3),
		  (4, 10317, 4),
		  (4, 286977, 5),
		  (4, 6234, 6),
		  (4, 1845, 7),
		  (5, 41834, 1),
		  (5, 6032, 2),
		  (5, 102634, 3),
		  (5, 3100000, 4),
		  (5, 23455, 5),
		  (5, 2359, 6),
		  (5, 194, 7);


SELECT CITIES.Name, CITIZENTYPES.Name, CITIZENTYPES.Language, CITIZENCOUNT.Amount
FROM CITIES 
	JOIN CITIZENCOUNT ON CITIES.IDcity = CITIZENCOUNT.IDcity
	JOIN CITIZENTYPES ON CITIZENTYPES.IDtype = CITIZENCOUNT.IDtype
	WHERE CITIZENTYPES.Language LIKE 'Russian';

SELECT CITIES.Name, CITIES.FoundationYear, CITIES.Area, CITIZENCOUNT.Amount
FROM CITIES 
	JOIN CITIZENCOUNT ON CITIES.IDcity = CITIZENCOUNT.IDcity
	JOIN CITIZENTYPES ON CITIZENTYPES.IDtype = CITIZENCOUNT.IDtype
	WHERE CITIZENTYPES.Name LIKE 'Belarusian';

SELECT CITIES.Name, CITIZENTYPES.Name, CITIZENTYPES.Language, CITIZENCOUNT.Amount
FROM CITIES 
	JOIN CITIZENCOUNT ON CITIES.IDcity = CITIZENCOUNT.IDcity
	JOIN CITIZENTYPES ON CITIZENTYPES.IDtype = CITIZENCOUNT.IDtype
WHERE CITIES.FoundationYear = (SELECT MIN(CITIES.FoundationYear) FROM CITIES)
ORDER BY CITIZENCOUNT.Amount DESC
LIMIT 1;