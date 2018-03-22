-- client_master tablosunun oluşturulması
CREATE TABLE client_master
(
    client_no bigserial PRIMARY KEY,
    client_name varchar(20),
    client_address1 varchar(30),
    client_address2 varchar(30),
    city varchar(15),
    state varchar(15),
    pincode integer,
    bal_due integer
);

--client_master tablosuna veri girilmesi
INSERT INTO client_master 
VALUES (0001, 'Ivan', '', '', 'Bombay', 'Maharastra', 400054, 15000 ), 
              (0002, 'Vandana', '', '', 'Madras', 'Tamilnadu', 780001, 0 ),
             (0003, 'Pramada', '', '', 'Bombay', 'Maharastra', 400057, 5000 ),
            (0004, 'Basu', '', '', 'Bombay', 'Maharastra', 400056, 0 ),
            (0005, 'Ravi', '', '', 'Delhi', '', 100001, 2000 ),
           (0006, 'Rukumini', '', '', 'Bombay', 'Maharastra', 400050, 0 );
           
--product_master tablosunun oluşturulması
CREATE TABLE product_master(
    product_no varchar(10) PRIMARY KEY,
    description varchar(100),
    profit_percent integer,
    unit_measure varchar(15),
    qty_on_hand integer,
    reorder_ivlnumber integer,
    sell_price numeric,
    cost_price numeric
);

--product_master tablosuna verilerin girilmesi
INSERT INTO client_master 
VALUES ('P00001', '1.44 Floppes', 5, 'piece', 100, 20, 525, 500),
         ('P03453', 'Monitors', 6, 'piece', 10, 3, 12000, 11200),
        ('P06734', 'Mouse', 5, 'piece', 20, 5, 1050, 500),
        ('P07865', '1.22 Floppes', 5, 'piece', 100, 20, 525, 500),
        ('P07868', 'Keyboards', 2, 'piece', 10, 3, 3150, 3050),
        ('P07885', 'CD Drive', 2.5, 'piece', 10, 3, 5250, 5100),
        ('P07965', '550 HDD', 4, 'piece', 10, 3, 8400, 8000),
        ('P07975', '1.44 Drive', 5, 'piece', 10, 3, 1050, 1000),
        ('P08865', '1.22', 5, 'piece', 2, 3, 1050, 1000);
        
--salesman_master tablosunun kısıtlarıyla beraber oluşturulması 
CREATE TABLE salesman_master(
    salesman_no varchar(6) PRIMARY KEY CHECK (salesman_no LIKE '5%'),
    saleman_name varchar(20)NOT NULL,
    address varchar(20) NOT NULL,
    city varchar(20) NOT NULL,
    state varchar(6),
    pincode integer,
    sal_amt integer NOT NULL CHECK(sal_amt != 0),
    tgt_to_get integer NOT NULL CHECK(sal_amt != 0),
    ytd_sales integer NOT NULL CHECK(sal_amt != 0),
    remarks varchar(30)
);


--salesman_master tablosuna verlerin girilmesi
INSERT INTO salesman_master
VALUES ('500001', 'Kren', 'A/14 worli', 'Bombay', 'mah', '400002', 3000, 100, 50, 'goo'),
             ('500002', 'Manish', '65, Nariman', 'Bombay', 'mah', '400001', 3000, 200, 100, 'goo'),
            ('500003', 'Ravi', 'P-7 Bandra', 'Bombay', 'mah', '400032', 3000, 200, 100, 'goo'),
            ('500001', 'Ashish', 'A/5 Juhu', 'Bombay', 'mah', '400044', 3500, 200, 150, 'goo');


--salesman_order  tablosunun kısıtlarıyla beraber oluşturulması 
CREATE TABLE sales_order(
    s_order_no varchar(6) PRIMARY KEY CHECK (s_order_no LIKE '0%'),
    s_order_date date,
    client_no integer REFERENCES client_master(client_no),
    dely_add varchar(6),
    salesman_no varchar(6) REFERENCES salesman_master(salesman_no),
    dely_type char(1) CHECK(dely_type IN ('P','F')) DEFAULT 'F',
    billed_yn char(1),
    dely_date date CHECK(dely_date > s_order_date),
    order_status varchar(10) CHECK(order_status IN ('in process','fullfilled', 'back order', 'cancelled'))
);

--sales_order  tablosuna veri girilmesi
INSERT INTO sales_order
	VALUES ('019001', '12-jan-96', '0001', '', '500001', 'F', 'N', '20-jan-96', 'in process'),
    	             ('019002', '25-jan-96', '0002', '', '500002', 'P', 'N', '27-jan-96', 'cancelled'),
                            ('016865', '18-feb-96', '0003', '', '500003', 'F', 'Y', '20-feb-96', 'fullfilled'),
                           ('019003', '3-apr-96', '0001', '', '500001', 'F', 'Y', '7-apr-96', 'fullfilled'),
                          ('046866', '20-may-96', '0004', '', '500002', 'P', 'N', '22-may-96', 'cancelled'),
                         ('010008', '24-may-96', '0005', '', '500004', 'F', 'N', '26-may-96', 'in process');


--salesman_order_details tablosunun kısıtlarıyla beraber oluşturulması 
CREATE TABLE sales_order_details(
    s_order_no varchar(6) REFERENCES sales_order(s_order_no),
    product_no varchar(10) REFERENCES product_master(product_no),
    qty_order integer,
    qty_disp integer,
    product_rate integer
);


--Sales_order_details  tablosuna veri girilmesi
INSERT INTO sales_order_details
VALUES ('019001', 'P00001', 4, 4, 525),
             ('019001', 'P07965', 2, 1, 8400),
            ('019001', 'P07885', 2, 1, 5250),
            ('019002', 'P00001', 10, 0, 525),
            ('046866', 'P07868', 3, 3, 3150),
            ('046866', 'P07885', 10, 10, 5250),
            ('019003', 'P00001', 4, 4, 1050),
            ('019003', 'P03453', 2, 2, 1050),
            ('046866', 'P06734', 1, 1, 12000),
            ('046866', 'P07965', 1, 0, 8400),
            ('010008', 'P07975', 1, 0, 1050),
            ('010008', 'P00001', 10, 5, 525);


--
CREATE INDEX client_no ON client_master (client_no)

--
CREATE INDEX s_order_no ON sales_order (s_order_no)

--
CREATE INDEX s_order_product_no ON sales_order (s_order_no, salesman_no

--
DROP INDEX s_order_product_no

--
CREATE VIEW sal_amt_bigger_t3000 AS 
SELECT * FROM salesman_master WHERE sal_amt > 3000


--
CREATE VIEW client_view(no, name, add1, add2, city, state, pcode)
AS SELECT  client_no, client_name, client_address1, client_address2, city, state, pincode
FROM client_master


--
SELECT no, name, city FROM client_view  WHERE city = ‘Bombay’

--
DROP INDEX client_view

--
SELECT * FROM sales_order WHERE s_order_date = CURRENT_DATE

--
SELECT * FROM sales_order WHERE dely_date < CURRENT_DATE - INTERVAL '10' DAY;

