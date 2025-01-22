create database w3SUBQUERIES
use w3SUBQUERIES

select * into w3SUBQUERIES.dbo.company_mast from w3resource1.[dbo].[company_mast]
select * into w3SUBQUERIES.dbo.customer from w3resource1.[dbo].[customer]
select * into w3SUBQUERIES.dbo.salesman from w3resource1.[dbo].[salesman]
select * into w3SUBQUERIES.dbo.emp_department from w3resource1.[dbo].[emp_department]
select * into w3SUBQUERIES.dbo.emp_details from w3resource1.[dbo].[emp_details]
select * into w3SUBQUERIES.dbo.Employee from w3resource1.[dbo].[Employee]
select * into w3SUBQUERIES.dbo.item_mast from w3resource1.[dbo].[item_mast]
select * into w3SUBQUERIES.dbo.nobel_win from w3resource1.[dbo].[nobel_win]
select * into w3SUBQUERIES.dbo.[order] from w3resource1.[dbo].[order]
select * into w3SUBQUERIES.dbo.orders from w3resource1.[dbo].[orders]


select * from orders where salesman_id=
(select salesman_id from salesman where name='Paul Adam')

select * from orders where salesman_id=
(select salesman_id from salesman where city='London')

select * from orders a where salesman_id=
(select salesman_id from orders b where b.customer_id =3007)


select * from orders a where purch_amt>
(select avg(purch_amt) from orders b where b.ord_date='2012-10-10')

select * from orders where salesman_id=
(select salesman_id from salesman where city='New York')


select comission from salesman where salesman_id=
(select salesman_id from customer where city='Paris')


select * from customer where customer_id=
(select salesman_id-2001 from salesman where name='Mc Lyon')

select * from customer a where grade>
(select avg(grade) from customer b where b.city='New York')


select * from orders where salesman_id=
(select salesman_id from salesman where comission=
(select max(comission) from salesman))

select b.*, a.cust_name from orders b, customer a 
where a.customer_id=b.customer_id and b.ord_date='2012-08-17'



select salesman_id, name from salesman a where 1<
(select count(salesman_id) from customer where salesman_id=a.salesman_id)



select * from orders a where purch_amt>
(select avg(purch_amt) from orders where customer_id=a.customer_id)


select * from orders a where purch_amt>=
(select avg(purch_amt) from orders where customer_id=a.customer_id)



select * from orders a where 1000<
(select max(purch_amt) from orders where ord_no=a.ord_no)


select * from customer a where 1<
(select count(city) from customer where a.city='London')


select * from salesman a where 1<
(select count(salesman_id) from customer b where a.salesman_id=b.salesman_id)


select * from salesman a where 1=
(select count(salesman_id) from customer b where a.salesman_id=b.salesman_id)


select * from salesman a where 1<
(select count(salesman_id) from orders b where a.salesman_id=b.salesman_id)

select * from salesman a where 1<=
(select count(salesman_id) from customer b where a.salesman_id=b.salesman_id and a.city!=b.city)


select * from salesman where city in (select city from customer)


select * from salesman a where exists (select city from customer b where a.name<b.cust_name)


select * from customer a where grade>
(select min(grade) from customer b where city='New York') order by cust_name asc


select * from orders a where 1<
(select count(ord_date) from orders b where a.ord_date=b.ord_date and ord_date='2012-09-10')


select * from orders a where a.purch_amt<
any (select b.purch_amt from orders b, customer c where b.customer_id=c.customer_id and c.city='London')


select * from orders a where a.purch_amt<
all (select max(b.purch_amt) from orders b, customer c where b.customer_id=c.customer_id and c.city='London')


select * from customer a where grade>
(select max (b.grade) from customer b where b.city='New York')


select name, city, purch_amt from salesman a, orders b where a.salesman_id=b.salesman_id and
a.city=all(select city from customer where salesman_id=a.salesman_id)

select * from customer a where grade!= any
(select grade from customer b where city = 'London')



select * from customer a where grade!= any
(select grade from customer b ) and a.city = 'Paris'


select * from customer a where grade!= any
(select grade from customer b where b.city = 'Dallas')


select avg(pro_price) as 'Average price', com_name as 'Company' 
from company_mast a, item_mast b where b.PRO_COM=a.com_id group by a.com_name


select avg(pro_price) as 'Average price', com_name as 'Company' 
from company_mast a, item_mast b where 350<=
(select avg(pro_price) from item_mast where b.PRO_COM=PRO_COM) and b.PRO_COM=a.com_id group by a.com_name

select pro_name as 'Product', pro_price as 'Price', com_name as 'Company' from
company_mast a, item_mast b where PRO_PRICE=
(select max(pro_price) from item_mast where b.PRO_COM=PRO_COM) and b.PRO_COM=a.com_id group by a.com_name, b.PRO_NAME, b.PRO_PRICE


select * from emp_details where EMP_LNAME='Gabriel' or EMP_LNAME='Dosio'


select * from emp_details where EMP_DEPT=89 or EMP_DEPT=63


select emp_fname, emp_lname from emp_details a, emp_department b 
where b.DPT_ALLOTMENT>50000 and a.EMP_DEPT=b.DPT_CODE


select dpt_name from emp_department where 2<
(select count(emp_idno) from emp_details where DPT_CODE=EMP_DEPT)


select emp_fname, emp_lname from emp_details, emp_department where DPT_ALLOTMENT=
(select min(DPT_ALLOTMENT) from emp_department where DPT_ALLOTMENT>(select min(DPT_ALLOTMENT) from emp_department)) and DPT_CODE=EMP_DEPT
