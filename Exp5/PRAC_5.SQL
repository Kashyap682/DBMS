select sum(salary) from employees;
select department_id, count(employee_id) from employees group by department_id having count(employee_id) = (select max(count(employee_id)) from employees group by department_id);
select department_id, sum(salary) from employees group by department_id;
select job_id, sum(salary) from employees group by job_id;
select department_id from employees where salary = (select max(salary) from employees);
select department_id from employees where salary = (select min(salary) from employees);
