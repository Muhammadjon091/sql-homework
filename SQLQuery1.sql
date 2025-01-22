create database homework2
use homework2

--Homework 1
/*Independent Subquery Question
Scenario:
You have two tables:
books: Contains information about books (id, title, author_id).
authors: Contains information about authors (id, name, country).
Write a query to find the titles of all books written by authors from 'United Kingdom'.*/

CREATE TABLE authors (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);
INSERT INTO authors (id, name, country) VALUES
(1, 'J.K. Rowling', 'United Kingdom'),
(2, 'George Orwell', 'United Kingdom'),
(3, 'Mark Twain', 'United States');

INSERT INTO books (id, title, author_id) VALUES
(1, 'Harry Potter', 1),
(2, '1984', 2),
(3, 'The Adventures of Tom Sawyer', 3);


select * from authors
select * from books

select title from books where author_id=any(select id from authors where country='United Kingdom')

--Homework 2
/*Correlated Subquery Question
Scenario:
You have a table employees with the following columns:

id: Employee ID.
name: Employee name.
department_id: Department the employee belongs to.
salary: Employee's salary.
Write a query to find the names of employees whose salaries are higher than the average salary of their respective departments.*/

create table emp_1(id int, name varchar(50), department_id int, salary float)
insert into emp_1 values(1, 'Alisher', 11, 1500), (2, 'Samir', 21, 2700), (3, 'Damir', 21, 2450), (4, 'Husan', 31, 1750), (5, 'Farid', 31, 1980)


select * from emp_1 a where salary>(select AVG(salary) from emp_1 b where a.department_id=b.department_id)

