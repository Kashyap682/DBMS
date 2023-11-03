spool 'D:/Github/DBMS/Exp8/log.txt'
SET echo ON

SELECT first_name , employee_id from employees where salary > (select salary from employees where first_name like '%Lex%');
SELECT job_id from (select job_id, avg(salary) as salary from employees group by job_id) where salary = (select max(salary) from (select job_id, avg(salary) as salary from employees group by job_id));
SELECT employee_id, manager_id from employees;
SELECT first_name, salary from employees e where e.salary > (select salary from employees m where m.employee_id = e.manager_id);
SELECT first_name, salary from employees e where e.salary > (select avg(salary) from employees m where m.department_id = e.department_id);
SELECT dname, deptno, count(employee_id) from department d inner join employees e on d.deptno = e.department_id group by deptno, dname having count(employee_id) > 1;
SELECT first_name, salary from employees where salary = (select min(salary) from employees where salary > (select min(salary) from employees ));
SELECT first_name, salary, department_id from employees e where salary = (SELECT min(salary) from employees outter where salary > (SELECT min(salary) from employees ) and e.department_id = outter.department_id);
SELECT employee_id from employees where salary < all (select salary from employees where department_id=30);
SELECT employee_id from employees where salary < (select min(salary) from employees where department_id=60);
SELECT last_name from employees where department_id in(select department_id from Department where dname='Sales');

SET echo OFF
spool OFF