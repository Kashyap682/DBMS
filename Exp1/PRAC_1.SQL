spool 'D:/Sem 7/DBMS/Exp1/log.txt'
SET echo ON

create table client(clientno varchar2(6),name varchar2(20),city varchar2(15),pincode number(8),state varchar2(15),baldue number(10,5));
create table product(productno varchar2(6),description varchar2(15),profitpercent number(4,2),unitmeasure varchar2(10),qtyonhand number(8),reorderlvl number(8),sellprice number(8,2),costprice number(8,2));
create table salesman(salesmanno varchar2(6),salesmanname varchar2(20),address1 varchar2(30),address2 varchar2(30),city varchar2(20),pincode number(8),state varchar2(20),salamt number(8,2),tgttoget number(6,2),ytdsales number(6,2),remarks varchar2(60));
create table sales_order(orderno varchar2(6),clientno varchar2(6),orderdate date,salesmanno varchar2(6),delaytype char(1),billyn char(1),delaydate date,orderstatus varchar2(10));
create table sales_order_details(orderno varchar2(6),productno varchar2(6),qtyordered number(8),productrate number(10, 2));

insert into client values('C01','Ivan Bayross','Mumbai',400054,'Maharashtra',15000);
insert into client values('C02','Mamta Shah','Chennai',780001,'Tamil Nadu',0);
insert into client values('C03','Chhaya Patel','Mumbai',400057,'Maharashtra',5000);
insert into client values('C04','Ashni Joshi','Bengalore',560001,'Karnataka',0);
insert into client values('C05','Harsh Desai','Mumbai',400060,'Maharashtra',2000);
insert into client values('C06','Deepak Sharma','Mangalore',560050,'Karnataka',0);

desc client
select * from client;

insert into product values('P00001','1.44 Floppies',5,'Piece',100,20,525,500);
insert into product values('P03453','Monitors',6,'Piece',10,3,12000,11200);
insert into product values('P06734','Mouse',5,'Piece',20,5,1050,500);
insert into product values('P07865','1.22 Floppies',5,'Piece',100,20,525,500);
insert into product values('P07868','Keyboards',2,'Piece',10,3,3150,3050);

select * from product;

insert into salesman values('S01','Aman','A/14','Worli','Mumbai',400002,'Maharashtra',3000 ,100,50,'Good');
insert into salesman values('S02','Omkar','65','Nariman','Mumbai',400001,'Maharashtra',3000,200,100,'Good');
insert into salesman values('S03','Raj','P-7','Bandra','Mumbai',400032,'Maharashtra',3000,200,100,'Good');
insert into salesman values('S04','Ashish','A/5','Juhu','Mumbai',400044,'Maharashtra',3500,200,150,'Good');

select * from salesman;

insert into sales_order values('O19001','C01','12-JAN16','S01','F','N','20-JAN-16','In Process');
insert into sales_order values('O19002','C02','25-JAN17','S02','P','N','27-JAN-17','Cancelled');
insert into sales_order values('O46865','C03','18-FEB17','S03','F','Y','20-FEB-17','Fulfilled');
insert into sales_order values('O19003','C01','03-APR16','S01','F','Y','07-APR-16','Fulfilled');
insert into sales_order values('O46866','C04','20-MAY16','S02','P','N','22-MAY-16','Cancelled');
insert into sales_order values('O19008','C05','24-MAY-16','S04','F','N','26-MAY-16','In Process');

select * from sales_order;

insert into sales_order_details values('O19001','P00001',4,525);
insert into sales_order_details values('O19001','P07965',2,8400);
insert into sales_order_details values('O19001','P07885',2,5250);
insert into sales_order_details values('O19002','P00001',10,525);
insert into sales_order_details values('O46865','P07868',3,3150);

select * from sales_order_details;
select * from client where city='Chennai' or city ='Mumbai';
select * from salesman where salamt=3000;
select salesmanname from salesman where salesmanno in (select salesmanno from sales_order);
select * from sales_order where orderstatus IN ('Cancelled','Fulfilled');
select * from product where sellprice > 500 and sellprice<=750;
select * from product where sellprice between 500 and 750;
select * from client where name like '_a%';
select * from product where 1.15 * sellprice > 500;
select name,city,state from client where state!='Maharashtra';
select * from product order by sellprice desc;
select * from sales_order where EXTRACT(YEAR FROM orderdate)=2017;

SET echo OFF
spool off