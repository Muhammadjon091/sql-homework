select floor((datediff(day,'0001-01-01',getdate()) - datediff(day,'0001-01-01','2002-03-03')) / 365.25) as 'year',
floor(((datediff(day,'0001-01-01',getdate()) - datediff(day,'0001-01-01','2002-03-03')) % 365.25)/30.4375) as 'month',
floor(((datediff(day,'0001-01-01',getdate()) - datediff(day,'0001-01-01','2002-03-03')) % 365.25)%30.4375) as 'day'


go
create proc odd_ 
as
begin
if OBJECT_ID('number') is not null
  begin
    drop table odd
  end
  Create table number (number float, Description varchar(100))
  if not exists (select * from number where number%2=0)
    begin
  insert into number values (1, 'odd')
  end
  if exists (select * from number where number%2=0)
  begin 
  insert into number values (2, 'paired')
  end
end



;with cte as(
select 28 number, 1 n
union all
select number, n+1 from cte where number>n
),
cte2 as(select sum(n) as total, number from cte where number%n=0 and number>n group by number)
select iif (total=number, 'perfect', 'simple') as result from cte2



select title from books where author_id=any(select id from authors where country='United Kingdom')


select * from emp_1 a where salary>(select AVG(salary) from emp_1 b where a.department_id=b.department_id)	

