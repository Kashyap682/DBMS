spool 'D:/Sem 7/DBMS/Exp3/log.txt'
SET echo on

CREATE TABLE employees
    ( employee_id    NUMBER(6),
      first_name     VARCHAR2(20),
      last_name      VARCHAR2(25) 	 CONSTRAINT     emp_last_name_nn  NOT NULL, 
      email          VARCHAR2(25)        CONSTRAINT     emp_email_nn  NOT NULL,
      phone_number   VARCHAR2(20),
      hire_date      DATE         	 CONSTRAINT     emp_hire_date_nn  NOT NULL,
      job_id         VARCHAR2(40)   	 CONSTRAINT     emp_job_nn  NOT NULL,
      salary         NUMBER(8,2),
      commission_pct NUMBER(2,2),
      manager_id     NUMBER(6),
      department_id  NUMBER(4),
      CONSTRAINT     emp_salary_min  CHECK (salary > 0),
      CONSTRAINT     emp_email_uk UNIQUE (email)
    );

INSERT INTO employees VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', TO_DATE('2000-06-17','YYYY-MM-DD'), 'PRESIDENT', 24000.00, NULL, 103, 90);
INSERT INTO employees VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', TO_DATE('2012-06-18','YYYY-MM-DD'), 'VICE PRESIDENT', 17000.00, 0.00, 100, 90);
INSERT INTO employees VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '123.515.4569', TO_DATE('2017-06-19','YYYY-MM-DD'), 'VICE PRESIDENT', 17000.00, NULL, 100, 90);
INSERT INTO employees VALUES(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', TO_DATE('2016-05-20','YYYY-MM-DD'), 'IT PROG', 9000.00, NULL, 102, 60);
INSERT INTO employees VALUES(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', TO_DATE('2014-05-20','YYYY-MM-DD'), 'FINANCIAL MANAGER', 6000.00, 0.00, 103, 60);
INSERT INTO employees VALUES(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', TO_DATE('2001-09-17','YYYY-MM-DD'), 'IT PROG', 4800.00, 0.00, 103, 60);
INSERT INTO employees VALUES(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', TO_DATE('2001-09-20','YYYY-MM-DD'), 'FINANCE ACCOUNTANT', 4800.00, 0.00, 103, 60);
INSERT INTO employees VALUES(114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561',TO_DATE('1990-09-01','YYYY-MM-DD'), 'SALES CLERK', 11000.00, 0.00, 100, 30);
INSERT INTO employees VALUES(119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', TO_DATE('1987-07-06','YYYY-MM-DD'), 'CLERK', 2500.00, NULL, 114, 30);
INSERT INTO employees VALUES(206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', TO_DATE('2005-07-06','YYYY-MM-DD'), 'ACCOUNTANT', 8300.00, NULL, 205, 110);

SELECT * FROM employees;

commit;
SET echo off
spool off