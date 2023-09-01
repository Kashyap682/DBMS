spool 'D:/Github/DBMS/Exp3/logq.txt'
SET echo on

select LOWER(first_name), UPPER(last_name) from employees where employee_id>=80 and employee_id<=150;
Select first_name, last_name, SUBSTR(first_name,1,1)||SUBSTR(last_name,1,3)||'@oracle.com' AS email_id from employees;
Select first_name, last_name, SUBSTR(first_name,1,1)||SUBSTR(last_name,-3)||'@oracle.com' AS email_id from employees;
select (first_name)||(last_name)||(hire_date) from employees;
select last_name from employees where length(last_name)>8;
select first_name, last_name, phone_number, REPLACE(phone_number,515,815) from employees;
select first_name, salary, salary * 1.12 AS raise_12_percent, ROUND(salary * 1.12) AS raise_12_percent_whole, FLOOR(salary * 1.12) AS raise_12_percent_rounded_down FROM employees;
select first_name, hire_date, hire_date-10, ADD_MONTHS(hire_date,1), CURRENT_DATE-hire_date from employees;
select first_name, last_name, hire_date, MONTHS_BETWEEN(CURRENT_DATE, HIRE_DATE), EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM HIRE_DATE) FROM EMPLOYEES;
select first_name, hire_date, hire_date + interval '1' year from employees;
select first_name, hire_date, ROUND(hire_date,'MONTH'), ROUND(hire_date,'YEAR') from employees;
select first_name, EXTRACT(DAY FROM HIRE_DATE) AS HIRE_DATE, EXTRACT(YEAR FROM HIRE_DATE) AS HIRE_YEAR FROM EMPLOYEES;
select UPPER(last_name), TO_CHAR(salary,'9999.999'), TO_CHAR(hire_date,' D/MM/YYYY') FROM employees where SUBSTR(last_name,1,1) IN ('D','K');
select first_name, last_name, salary, coalesce(commission_pct,0) from employees;
select first_name, last_name,salary, NVL(TO_CHAR(commission_pct),'NO Commission') from employees;
select first_name, last_name, salary, case when salary between 0 and 5000 then 'A' when salary between 5001 and 15000 then 'B' when salary between 15001 and 20000 then 'C' ELSE 'D' END as salary_grade from employees;
select first_name, salary, ROUND(salary,-3) from employees;
select first_name from employees where EXTRACT(MONTH FROM hire_date)=5;
select CASE when INSTR(job_id,' ')>0 then SUBSTR(job_id, 1, INSTR(job_id,' ')-1) ELSE job_id END from employees;
select first_name,last_name,LENGTH(first_name) from employees where INSTR(SUBSTR(last_name,4),'b')>0;
select first_name from employees where EXTRACT(YEAR from CURRENT_DATE) - EXTRACT(YEAR FROM hire_date)>0;

SET echo off;
spool off