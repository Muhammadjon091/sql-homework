create database hw14
use hw14



Create table Employees
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10),
    Salary int,
    DepartmentId int
)
Go

Insert into Employees values (1, 'mark', 'Male', 50000, 1)
Insert into Employees values (2, 'mary', 'Female', 60000, 3)
Insert into Employees values (3, 'steve', 'Male', 45000, 2)
Insert into Employees values (4, 'john', 'Male', 56000, 1)
Insert into Employees values (5, 'sara', 'Female', 39000, 2)
Go

select id, (upper(substring(name,1,1)) + lower(substring(name, 2, len(name)))) as name, 
Gender, Salary, DepartmentId from Employees


select id, (lower(substring(name,1,len(name)-1)) + upper(substring(name, len(name), 1))) as name, 
Gender, Salary, DepartmentId from Employees

select * from Employees where LEN(name)=(
select max(len(name)) from Employees)








CREATE TABLE [dbo].[TestMultipleColumns] 
(
    [Id] [int] NULL,
    [Name] [varchar](20) NULL
);
INSERT INTO [TestMultipleColumns] 
VALUES 
(1,    'Pawan,Kumar'), 
(2,    'Sandeep,Goyal'), 
(3,    'Isha,Mattoo'), 
(4,    'Gopal,Ranjan'),
(5,    'Neeraj,Garg'), 
(6,    'Deepak,Sharma'), 
(7,    ' Mayank,Tripathi');


select name, SUBSTRING(name, charindex(',', name)-len(name), len(name)) as frist_name, 
SUBSTRING(name, charindex(',', name)+1, len(name)) as last_name from TestMultipleColumns
