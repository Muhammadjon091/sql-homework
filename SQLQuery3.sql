create database class_12_9
use class_12_9
drop table customer
create table Customer (id int, [name] varchar(30))
insert into customer values(1,'SuperPro'),(2,'ProMax'),(3,'MegaPro'),(4,'Honor')
insert into customer values (5, 'MegaProMax')

select * from customer where name like '_%Pro%'


create table Order2 (id int, [name] varchar(30))
insert into Order2 values(1, '12Anvar34'), (2, 'Iroda'), (3, 'Bah12rom')
select * from Order2 where  [name] like '%[0-9]%'


CREATE TABLE Users (
    UserID INT,
    Name VARCHAR(50)
);

CREATE TABLE Admins (
    UserID INT,
    Name VARCHAR(50)
);

INSERT INTO Users VALUES 
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Admins VALUES 
(1, 'Alice'),
(3, 'Charlie');

select * from Users where UserID=

CREATE TABLE Orders1 (
    OrderID INT,
    Product VARCHAR(50),
    Status VARCHAR(20)
);

INSERT INTO Orders1 VALUES 
(1, 'Laptop', 'Completed'),
(2, 'Tablet', 'Pending'),
(3, 'Keyboard', 'Completed'),
(4, 'Mouse', 'Pending'),
(5, 'Phone', 'New');
select * from Orders1 iif


