spool 'D:/Github/DBMS/Exp7/log.txt'
SET echo ON

CREATE TABLE Department(deptno number(6), dname varchar2(20), locations varchar2(25));
INSERT INTO Department VALUES (30, 'Accounting', 'New York');
INSERT INTO Department VALUES (60, 'Research', 'Dallas');
INSERT INTO Department VALUES (90, 'Sales', 'Chicago');
INSERT INTO Department VALUES (110, 'Marketing', 'Boston');
select * from Department;

SELECT deptno, employee_id, job_id, locations, first_name FROM Department INNER JOIN employees ON Department.deptno = employees.department_id where deptno = 60 or deptno = 90;
SELECT distinct job_id FROM Department INNER JOIN employees ON Department.deptno=employees.department_id where deptno =60 or deptno=90;

SELECT job_id FROM Department INNER JOIN employees ON Department.deptno=employees.department_id
where job_id in(SELECT job_id FROM Department INNER JOIN employees ON Department.deptno=employees.department_id where deptno=90)
and job_id not in(SELECT job_id FROM Department INNER JOIN employees ON Department.deptno=employees.department_id where deptno=30);

SELECT M.first_name,E.first_name,M.EMPLOYEE_ID,M.MANAGER_ID,M.DEPARTMENT_ID,E.DEPARTMENT_ID FROM employees E INNER JOIN employees M ON E.employee_id=M.manager_id where M.DEPARTMENT_ID=E.DEPARTMENT_ID;
SELECT * from employees where job_id in ('ACCOUNTANT' , 'IT PROG') and extract (year from (hire_date))<2015;

SELECT dname,employee_id,job_id,location,first_name FROM Department INNER JOIN employees ON Department.deptno=employees.department_id where employee_id in (select manager_id from employees);
SELECT dname,employee_id,job_id,location,first_name FROM Department INNER JOIN employees ON Department.deptno=employees.department_id where manager_id=100;

SELECT employee_id,salary from employees where first_name = 'Steven' and salary>=(SELECT max(salary) FROM employees GROUP BY department_id having department_id=(select department_id from employees where first_name='Steven'));
SELECT first_name,job_id,salary from employees  where job_id != 'CLERK' order by salary desc;
SELECT first_name,employee_id,manager_id from employees where manager_id is NULL;
SELECT first_name, last_name from employees where salary = (SELECT MAX(salary) from employees);

SELECT first_name, last_name FROM employees WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees));
SELECT first_name, last_name,salary FROM employees WHERE salary = (SELECT (MAX(salary) + MIN(salary)) / 2 FROM employees);

SELECT d.dname AS department_name, COUNT(e.EMPLOYEE_ID) AS employee_count FROM Department d JOIN employees e ON d.deptno = e.department_id GROUP BY d.dname HAVING COUNT(e.EMPLOYEE_ID) >= 3;
SELECT d.dname AS department_name FROM Department d JOIN employees e ON d.deptno = e.department_id GROUP BY d.dname HAVING COUNT(e.EMPLOYEE_ID) >= 2;
SELECT first_name, last_name,employee_id,salary FROM employees WHERE employee_id IN (SELECT DISTINCT manager_id FROM employees) and salary>=(select avg(salary) from employees);

SELECT first_name, last_name, salary FROM (SELECT first_name, last_name, salary FROM employees ORDER BY salary DESC) WHERE ROWNUM <= 3;
SELECT first_name, last_name, salary FROM (SELECT first_name, last_name, salary FROM employees ORDER BY salary ASC) WHERE ROWNUM <= 3;

SELECT e.first_name AS "Employee First Name", e.job_id AS "Job", d.dname AS "Department Name", m.first_name AS "Manager First Name", e.salary AS "Salary" FROM employees e JOIN Department d ON e.department_id = d.deptno LEFT JOIN employees m ON e.manager_id = m.employee_id ORDER BY e.salary;
SELECT first_name,dname from employees inner join Department on employees.department_id=Department.deptno where not dname='Sales';
SELECT job_id, AVG(salary) FROM employees GROUP BY job_id;
SELECT dname FROM Department JOIN employees ON Department.deptno = employees.department_id WHERE employees.salary = (SELECT MAX(salary) FROM employees);
SELECT dname FROM Department JOIN employees ON Department.deptno = employees.department_id WHERE employees.salary = (SELECT min(salary) FROM employees);

SET echo OFF
spool OFF