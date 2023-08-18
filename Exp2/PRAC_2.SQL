spool 'D:/Sem 7/DBMS/Exp2/log.txt'
SET echo ON;

UPDATE client SET city = 'Bangalore' WHERE name = 'Harsh Desai';
SELECT * FROM client;

DELETE FROM sman WHERE salamt = 3500;
SELECT * FROM sman;

DELETE FROM client WHERE state = 'Tamil Nadu';
SELECT * FROM client;

ALTER TABLE client ADD Telephone NUMBER(10);
DESC client;

ALTER TABLE product MODIFY sellprice NUMBER(6,2);

ALTER TABLE sman RENAME TO salesman;
DESC salesman;

CREATE TABLE sales_order_new AS SELECT * FROM sales_order;
SELECT * FROM sales_order_new;

CREATE TABLE order_details AS SELECT * FROM sales_order_details WHERE 1 = 2;
SELECT * FROM order_details;
DESC order_details;

COMMIT;

SET echo OFF;
spool off