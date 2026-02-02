use sqlclass
select * from employee
select * from department
select * from sales
--Basiclevel--
--Asnwer1--
select name from employee where salary>(select avg(salary) from employee)
--Answer2--
select name from employee where department_id in(select department_id from employee  group by department_id having avg(salary)= (select max(average) from (select avg(salary) as average from employee group by department_id) as maxaverage))
--Asnwer3--
select name from employee where emp_id in(select emp_id from sales)
--Answer4--
select name from employee where emp_id in (select emp_id from sales where sale_amount=(select max(sale_amount) from sales))
--Answer5--
select name from employee where salary>(select salary from employee where name='Shubham')
--Intermediatelevel--
--Answer1--
select name from employee where department_id=(select department_id from employee where name='Abhishek') and name<>'Abhishek'
--Answer2--
select department_id,department_name from department where department_id in (select department_id from employee where salary>60000)
--Answer3--
select department_name from department where department_id in(select department_id from employee where emp_id in(select emp_id from sales where sale_amount in(select max(sale_amount)from sales)))
--Answer4--
select emp_id, name from employee where emp_id in(select emp_id from sales where sale_amount>(select avg(sale_amount) from sales))
--Answer5--
select sum(sale_amount) from sales where emp_id in(select emp_id from employee where salary> (select avg(salary) from employee))
--Advancedlevel--
--Answer1--
select emp_id,name from employee where emp_id not in(select emp_id from sales where emp_id is not null)
-Answer2--
select department_name from department where department_id in(select department_id from employee group by department_id having avg(salary)>55000)
--Answer3--
select department_id,department_name from department where department_id in (select e.department_id from employee as e join sales as s on e.emp_id=s.emp_id group by e.department_id having sum(s.sale_amount)>10000)
--Answer4--
select emp_id,name from employee where emp_id in(select emp_id from sales where sale_amount in(select max(sale_amount) from sales where sale_amount<(select max(sale_amount) from sales)))
--Answer5--
select name, salary from employee where salary>(select max(sale_amount) from sales where sale_amount is not null)





