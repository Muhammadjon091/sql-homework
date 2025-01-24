create database hw2 
use hw2


CREATE TABLE MyNumbers (
    num INT
);

-- Insert the data into the MyNumbers table
INSERT INTO MyNumbers (num) VALUES
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);

with cte as(
select * from MyNumbers group by num having count(num)=1) 
select max(num) from cte






CREATE TABLE Seat (
    id INT PRIMARY KEY,
    student VARCHAR(50)
);

INSERT INTO Seat (id, student) VALUES (1, 'Abbot');
INSERT INTO Seat (id, student) VALUES (2, 'Doris');
INSERT INTO Seat (id, student) VALUES (3, 'Emerson');
INSERT INTO Seat (id, student) VALUES (4, 'Green');
INSERT INTO Seat (id, student) VALUES (5, 'Jeames');



select student, 
case
	when id%2=0 then lag(student,1,student) over(order by student) 
	when id%2=1 then lead(student,1,student) over(order by student)
end
from Seat






CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    managerId INT
);

-- Insert the data into the Employee table
INSERT INTO Employees (id, name, salary, managerId) VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);


select * from Employees a, Employees b where a.id=b.managerId and a.salary<b.salary



CREATE TABLE Activities (
    sell_date DATE,
    product VARCHAR(50)
);

INSERT INTO Activities (sell_date, product) VALUES ('2020-05-30', 'Headphone');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-01', 'Pencil');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-02', 'Mask');
INSERT INTO Activities (sell_date, product) VALUES ('2020-05-30', 'Basketball');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-01', 'Bible');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-02', 'Mask');
INSERT INTO Activities (sell_date, product) VALUES ('2020-05-30', 'T-Shirt');





select sell_date, string_agg(product, ',') as products FROM Activities group by sell_date



CREATE TABLE Orders (
    order_number INT PRIMARY KEY,
    customer_number INT
);

-- Insert the data into the Orders table
INSERT INTO Orders (order_number, customer_number) VALUES
(5, 1),
(2, 2),
(3, 3),
(4, 3);

with cte as(
select customer_number, count(customer_number) as quantity from Orders  group by customer_number
)
select *  from cte where quantity=(select max(quantity) from cte)





CREATE TABLE Employees1 (
    emp_id INT,
    event_day DATE,
    in_time INT,
    out_time INT
);

-- Insert the data into the Employees table
INSERT INTO Employees1 (emp_id, event_day, in_time, out_time) VALUES
(1, '2020-11-28', 4, 32),
(1, '2020-11-28', 55, 200),
(1, '2020-12-03', 1, 42),
(2, '2020-11-28', 3, 33),
(2, '2020-12-09', 47, 74);

select event_day, emp_id, sum(out_time-in_time) from Employees1 group by event_day, emp_id





CREATE TABLE Product (
    product_key INT 
);

-- Insert the data into the Product table
INSERT INTO Product (product_key) VALUES
(5),
(6);

-- Create the Customer table
CREATE TABLE Customer (
    customer_id INT,
    product_key INT,
   );

-- Insert the data into the Customer table
INSERT INTO Customer (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);


select * from Customer
select * from Product


?????????????????????





CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Users (user_id, name) VALUES (1, 'aLice');
INSERT INTO Users (user_id, name) VALUES (2, 'bOB');
INSERT INTO Users (user_id, name) VALUES (3, 'sArA');
INSERT INTO Users (user_id, name) VALUES (4, 'JoHNSoN');

select UPPER(SUBSTRING(name, 1, 1)) + lower(SUBSTRING(name, 2, len(name)-1)) from users