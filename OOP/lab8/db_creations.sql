create database Lab8

create table Companies
(
	company_id int not null primary key check(company_id > 0),
	name nvarchar(20) not null check(name not like '%[^a-zA-Zа-яА-Я-]%'),
	country nvarchar(30) not null check(country not like '%[^a-zA-Zа-яА-Я -]%'),
	address nvarchar(50) not null,
	tel_number nvarchar(13) not null check(tel_number like '+[0-9]%' AND LEN(tel_number) = 13),
	logo nvarchar(max)
)

insert Companies values(3, 'fghj-', 'hjD- oi', 'hjk', '+375445673883', 'df')
insert Products values(4, 'gh j', 's', 1, 'food', '01-01-2002', 1,1,3)
select * from Companies

create table Products
(
	product_id int not null primary key check(product_id > 0),
	name nvarchar(20) not null check(name not like '%[^a-zA-Zа-яА-Я -]%'),
	size nvarchar(1) not null check(size in ('s', 'm', 'l')),
	weight real not null check(weight>0),
	type nvarchar(11) not null check(type in ('electronics','food','clothes')),
	receipt_date date not null check(receipt_date <= getdate()),
	amount int not null check(amount > 0),
	price real not null check(price > 0),
	company_id int not null foreign key references Companies(company_id) on delete cascade
)

drop table Companies
drop table Products

drop procedure AddCompany
drop procedure AddProduct

-- Процедура добавления записи в таблицу "Companies"
CREATE PROCEDURE AddCompany
    @company_id INT,
    @name NVARCHAR(20),
    @country NVARCHAR(30),
    @address NVARCHAR(50),
    @tel_number NVARCHAR(13),
	@logo NVARCHAR(max)
AS
BEGIN
    INSERT INTO Companies (company_id, name, country, address, tel_number, logo)
    VALUES (@company_id, @name, @country, @address, @tel_number, @logo)
END
GO

-- Процедура добавления записи в таблицу "Products"
CREATE PROCEDURE AddProduct
    @product_id INT,
    @name NVARCHAR(20),
    @size NVARCHAR(1),
    @weight REAL,
    @type NVARCHAR(11),
    @receipt_date DATE,
    @amount INT,
    @price REAL,
    @company_id INT
AS
BEGIN
    INSERT INTO Products (product_id, name, size, weight, type, receipt_date, amount, price, company_id)
    VALUES (@product_id, @name, @size, @weight, @type, @receipt_date, @amount, @price, @company_id)
END
GO