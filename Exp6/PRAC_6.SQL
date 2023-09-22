spool 'D:/Github/DBMS/Exp6/log5.txt'
SET echo on

ALTER TABLE client ADD CONSTRAINT c_id PRIMARY KEY (clientno);
ALTER TABLE client ADD CONSTRAINT chk_id CHECK (clientno like 'C%');
ALTER TABLE client MODIFY name NOT NULL;


ALTER TABLE product MODIFY description NOT NULL;
ALTER TABLE product MODIFY profitpercent NOT NULL;
ALTER TABLE product MODIFY unitmeasure NOT NULL;
ALTER TABLE product MODIFY qtyonhand NOT NULL;
ALTER TABLE product MODIFY reorderlvl NOT NULL;
ALTER TABLE product MODIFY sellprice NOT NULL;
ALTER TABLE product MODIFY costprice NOT NULL;
ALTER TABLE product ADD CONSTRAINT chk_p CHECK (sellprice>0 AND costprice>0);


ALTER TABLE salesman ADD CONSTRAINT s_id PRIMARY KEY (salesmanno);
ALTER TABLE salesman MODIFY salesmanname NOT NULL;
ALTER TABLE salesman MODIFY address1 NOT NULL;
ALTER TABLE salesman MODIFY salamt NOT NULL;
ALTER TABLE salesman MODIFY tgttoget NOT NULL;
ALTER TABLE salesman MODIFY ytdsales NOT NULL;
ALTER TABLE salesman ADD CONSTRAINT chk_amt CHECK (salamt>0 AND tgttoget>0);


ALTER TABLE sales_order ADD CONSTRAINT so_id PRIMARY KEY (orderno);
ALTER TABLE sales_order ADD CONSTRAINT c_no FOREIGN KEY (clientno) REFERENCES client(clientno);
ALTER TABLE sales_order MODIFY orderdate NOT NULL;
ALTER TABLE sales_order ADD CONSTRAINT s_no FOREIGN KEY (salesmanno) REFERENCES salesman(salesmanno);
ALTER TABLE sales_order ADD CONSTRAINT chk_pk CHECK (orderno like 'O%');
ALTER TABLE sales_order ADD CONSTRAINT chk_ord CHECK (delaydate>=orderdate);
ALTER TABLE sales_order MODIFY delaytype DEFAULT 'F';
ALTER TABLE sales_order ADD CONSTRAINT chk_dt CHECK (delaytype like 'P' OR delaytype like 'F');


ALTER TABLE sales_order_details ADD CONSTRAINT o_no FOREIGN KEY (orderno) REFERENCES sales_order(orderno);
ALTER TABLE sales_order_details ADD CONSTRAINT p_no FOREIGN KEY (productno) REFERENCES product(productno);

SET echo off
spool off