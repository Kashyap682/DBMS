spool 'D:/Github/DBMS/Exp4/log.txt'
SET echo on

select first_name from employees where first_name like '_____';
select first_name from employees where first_name like 'K____';
select first_name from employees where first_name like '___i_' or first_name like '___e_';
select first_name, last_name, salary from employees where salary like '___0';
select first_name, last_name from employees where first_name like '%ll%' or last_name like '%ll%';
select * from employees where salary > (select salary from employees where first_name='William');
select * from employees where DEPARTMENT_ID=90 and JOB_ID not in (select JOB_ID from employees where DEPARTMENT_ID=60);
select first_name,salary from employees where salary*1.2>10000;
select first_name,salary from employees where salary*12 > 70000 and salary*12 <90000;
select employee_id,first_name,salary,job_id,department_id from employees where job_id = 'IT PROG' and salary*12>80000 order by (department_id) asc;
select employee_id,first_name,salary,job_id,department_id,salary*12 as anual_salary from employees where department_id= 90 or department_id= 60;
select salesmanno, qtyordered FROM sales_order INNER JOIN sales_order_details ON sales_order.orderno = sales_order_details.orderno;
select salesmanno,qtyordered,productrate FROM sales_order INNER JOIN sales_order_details ON sales_order.orderno = sales_order_details.orderno where qtyordered*productrate>10000;

SET echo off
spool off