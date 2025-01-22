[task2]

select * from customer where grade>100

select * from customer where grade>100 and city='New York'

select * from customer where grade>100 or city='New York'

select * from customer where grade<100 or city='New York'

select * from customer where grade<=100 and city!='New York'

select * from orders where ord_date='2012-09-10' and salesman_id>5005 or purch_amt>1000

select * from salesman where comission>0.10 and comission<0.12

select * from orders where purch_amt<200 or ord_date>='2012-02-10' and customer_id<3009

select * from orders where ord_date='2012-08-17' or customer_id>3005 and purch_amt<1000

select ord_no, purch_amt, (purch_amt/60) as 'achieved percentage', 
(6000-purch_amt)/60 as 'unachieved percentage' from orders where purch_amt>=3000

select * from emp_details where EMP_LNAME='Dosni' or EMP_LNAME='Mardy'

select * from emp_details where EMP_DEPT=47 or EMP_DEPT=63

[task3]



select salesman.name, customer.cust_name, salesman.city from 
salesman join customer on salesman.city=customer.city

select orders.ord_no, orders.purch_amt, customer.cust_name, customer.city
from orders join customer on orders.salesman_id=customer.salesman_id
where orders.purch_amt>500 and orders.purch_amt<2000

select customer.cust_name, customer.city, salesman.name as 'salesman', salesman.comission
from customer join salesman on customer.salesman_id=salesman.salesman_id

select customer.cust_name as 'customer name', customer.city as 'customer city', 
salesman.name as 'salesman', salesman.comission from customer join salesman 
on customer.salesman_id=salesman.salesman_id where salesman.comission>0.12


select customer.cust_name as 'customer name', customer.city as 'customer city', 
salesman.name as 'salesman', salesman.city as 'salesman city', salesman.comission 
from customer join salesman on customer.salesman_id=salesman.salesman_id 
where salesman.comission>0.12 and customer.city<>salesman.city

select orders.ord_no, orders.ord_date, orders.purch_amt, customer.cust_name, customer.grade,
salesman.name as 'Salesman', salesman.comission from orders join customer on orders.salesman_id=customer.salesman_id
join salesman on customer.salesman_id=salesman.salesman_id


SELECT * FROM orders JOIN customer on orders.salesman_id=customer.salesman_id 
JOIN salesman on customer.salesman_id=salesman.salesman_id

select customer.cust_name, customer.city as 'customer city', isnull(customer.grade, 0) as grade, 
salesman.name as 'salesman', salesman.city as 'salesman city' from customer
join salesman on customer.salesman_id=salesman.salesman_id
order by customer_id asc

select customer.cust_name, customer.city as 'customer city', coalesce(customer.grade, 0) as grade, 
salesman.name as 'salesman', salesman.city as 'salesman city' from customer
join salesman on customer.salesman_id=salesman.salesman_id where grade<300
order by customer_id asc

select customer.cust_name, customer.city as 'customer city', orders.ord_no, orders.ord_date,
orders.purch_amt from orders join customer on orders.salesman_id=customer.salesman_id
order by orders.ord_date asc


select customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt,
salesman.name as 'salesman name', salesman.comission from customer left join orders on 
orders.salesman_id=customer.salesman_id join salesman 
on orders.salesman_id=salesman.salesman_id

select salesman.name as Salespersons, customer.cust_name as Customers from salesman
full join customer on customer.salesman_id=salesman.salesman_id 

select salesman.name as 'salesman', customer.cust_name, customer.city as 'customer city', 
coalesce(customer.grade, 0) as grade, orders.ord_no, orders.ord_date, orders.purch_amt 
from customer join salesman on customer.salesman_id=salesman.salesman_id join
orders on orders.customer_id=customer.customer_id


select salesman.name as 'salesman', customer.cust_name, customer.city as 'customer city', 
customer.grade, orders.ord_no, orders.ord_date, orders.purch_amt 
from customer join salesman on customer.salesman_id=salesman.salesman_id join
orders on orders.customer_id=customer.customer_id where orders.purch_amt>2000 and customer.grade is not null

select customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt from
customer join orders on customer.customer_id=orders.customer_id

select customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt from
customer join orders on customer.customer_id=orders.customer_id where customer.grade is not null

select * from salesman full join customer on salesman.salesman_id=customer.salesman_id

select * from salesman cross join customer where
salesman.city is not null

select * from salesman cross join customer where
salesman.city is not null and customer.grade is not null

select * from salesman cross join customer where
salesman.city is not null and customer.grade is not null and salesman.city!=customer.city

create table company_mast(com_id int, com_name varchar(20))
insert into company_mast values
	(11, 'Samsung  '),
    (12, 'iBall	   '),
    (13, 'Epsion   '),
    (14, 'Zebronics'),
    (15, 'Asus	   '),
    (16, 'Frontech ')
select * from item_mast join company_mast on item_mast.PRO_COM=company_mast.com_id

select item_mast.PRO_NAME, item_mast.PRO_PRICE, company_mast.com_name from company_mast
join item_mast on item_mast.PRO_COM=company_mast.com_id

select company_mast.com_name, AVG(item_mast.pro_price) as 'average price'
from company_mast join item_mast on item_mast.PRO_COM=company_mast.com_id
group by company_mast.com_name

select company_mast.com_name, AVG(item_mast.pro_price) as 'average price'
from company_mast join item_mast on item_mast.PRO_COM=company_mast.com_id
group by company_mast.com_name having AVG(item_mast.pro_price)>350

create table emp_department(DPT_CODE INT, DPT_NAME VARCHAR(20), DPT_ALLOTMENT FLOAT)
insert into emp_department values
(57, 'IT     ',  65000),
(63, 'Finance',  15000),
(47, 'HR     ', 240000),
(27, 'RD     ',  55000),
(89, 'QC     ',  75000)

select * from emp_department join emp_details on emp_department.DPT_CODE=emp_details.EMP_DEPT

select emp_department.DPT_NAME, emp_details.EMP_FNAME, emp_details.EMP_LNAME, 
emp_department.DPT_ALLOTMENT from emp_department join emp_details 
on emp_department.DPT_CODE=emp_details.EMP_DEPT

select emp_department.DPT_NAME, emp_details.EMP_FNAME, emp_details.EMP_LNAME, 
emp_department.DPT_ALLOTMENT from emp_department join emp_details 
on emp_department.DPT_CODE=emp_details.EMP_DEPT and emp_department.DPT_ALLOTMENT>50000

select emp_department.DPT_NAME, count(emp_details.EMP_DEPT) as 'count_emp' 
from emp_department join emp_details on emp_department.DPT_CODE=emp_details.EMP_DEPT
group by emp_department.DPT_NAME having count(emp_details.EMP_DEPT)>2
