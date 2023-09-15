spool 'D:/Github/DBMS/Exp5/log.txt'
SET echo on

select sum(salary) from employees;
select department_id, count(employee_id) from employees group by department_id having count(employee_id) = (select max(count(employee_id)) from employees group by department_id);
select department_id, sum(salary) from employees group by department_id;
select job_id, sum(salary) from employees group by job_id;
select department_id from employees where salary = (select max(salary) from employees);
select department_id from employees where salary = (select min(salary) from employees);
select job_id, AVG(salary) from employees group by job_id HAVING job_id in('CLERK', 'SALES CLERK');
select job_id, AVG(salary) from employees group by job_id HAVING job_id in('FINANCIAL MANAGER', 'SALES CLERK');
select employee_id, first_name, last_name, 12*salary as annual_salary from employees where salary = (select MAX(salary) from employees);
select employee_id, first_name, last_name, salary as monthly_salary from employees where salary = (select MIN(salary) from employees);
select employee_id, first_name, last_name from employees where hire_date > TO_DATE('20140601', 'YYYYMMDD') order by JOB_ID;
select employee_id, first_name, last_name from employees where hire_date > TO_DATE('20140601', 'YYYYMMDD') order by JOB_ID;
select employee_id, ROUND(MONTHS_BETWEEN(CURRENT_DATE, HIRE_DATE)/12) as expereince_in_years, round(salary/30) as daily_sal from employees where salary/30 > 350;
select FIRST_NAME, HIRE_DATE from EMPLOYEES order by HIRE_DATE;
select FIRST_NAME, HIRE_DATE from EMPLOYEES where HIRE_DATE < TO_DATE('01/01/2001','DD/MM/YYYY') OR HIRE_DATE > TO_DATE('31/12/2001','DD/MM/YYYY');
select FIRST_NAME, EXTRACT(YEAR from HIRE_DATE) as JOINING_YEAR from EMPLOYEES where EXTRACT(YEAR from HIRE_DATE) = 1990;
select FIRST_NAME, EXTRACT(YEAR from HIRE_DATE) as JOINING_YEAR from EMPLOYEES where EXTRACT(YEAR from HIRE_DATE) = 2005;
select JOB_ID, CEIL(AVG(EXTRACT(YEAR from CURRENT_DATE) - EXTRACT(YEAR from HIRE_DATE))) as AVG_EXP from EMPLOYEES group by JOB_ID HAVING JOB_ID = 'CLERK' OR JOB_ID = 'SALES CLERK';
select FIRST_NAME, HIRE_DATE from EMPLOYEES where EXTRACT(MONTH from HIRE_DATE) = 1;
select FIRST_NAME, HIRE_DATE from EMPLOYEES where (CURRENT_DATE - HIRE_DATE)/365 >= 10;
select FIRST_NAME, HIRE_DATE from EMPLOYEES where HIRE_DATE < (SELECT MAX(HIRE_DATE) from EMPLOYEES where MANAGER_ID = (select EMPLOYEE_ID from EMPLOYEES where FIRST_NAME = 'Lex'));
select SALESMANNO, SUM(QTYORDERED * PRODUCTRATE) from SALES_ORDER_DETAILS S1 JOIN SALES_ORDER S2 ON S1.ORDERNO = S2.ORDERNO group by S2.SALESMANNO;
select S1.ORDERNO, PRODUCTNO, SALESMANNO, QTYORDERED * PRODUCTRATE as ORDER_AMOUNT from SALES_ORDER S1 JOIN SALES_ORDER_DETAILS S2 ON S1.ORDERNO = S2.ORDERNO where QTYORDERED * PRODUCTRATE > 10000;

SET echo off
spool off