 
 CREATE TABLE customer(
	id INT PRIMARY KEY,
    name varchar(255),
    address varchar(255),
    gender varchar(255),
    city varchar(255),
    pincode int
 );
 
 DESCRIBE customer;
 
 INSERT INTO customer VALUES(1251,'Ram Kumar','DILBAGH NAGAR','M','Jalandhar',144002);
 INSERT INTO customer VALUES(1300,'Shayam Singh','Ludhiana H.O','M','Ludhiana',141001);
 INSERT INTO customer VALUES(245,'Neelabh Shukla','Ashok Nagar','M','Jalandhar',144003);
 INSERT INTO customer VALUES(210,'Barkha Singh','Dilbagh Nagar','F','Jalandhar',144002);
 INSERT INTO customer VALUES (500,'Rohan Arora','Ludhiana H.O','M','Ludhiana',141001);

insert into customer(id,name) values(121,'Bob');
select * from customer;
-- Update already present data
update customer set Address = 'Mumbai',gender = 'M' where id = 121;

-- update multiple rows
update customer set pincode = 143001 ;
update customer set pincode = pincode + 1;

-- delete 
delete from customer where id=121;

CREATE table orderDetails(
	orderid INT PRIMARY KEY,
    deliveryDate date,
    customerId INT,
    FOREIGN KEY (customerId) references customer(id) ON DELETE CASCADE 
);

describe orderDetails;

INSERT into orderDetails VALUES(1,TO_DATE('2019-03-11','YYYY-MM-DD'),1251);
INSERT into orderDetails values(2,TO_DATE('2019-04-15','YYYY-MM-DD'),1251);

select * from orderDetails;
delete from customer where id =1251;

CREATE table account(
	id INT PRIMARY KEY,
    name varchar(255) UNIQUE,
    balance INT DEFAULT 0 NOT NULL	
);
DESCRIBE account;

INSERT into account values(1,'Aaryan',100000);
INSERT into account(id,name) values(2,'Colola');

select * from account;
DROP TABLE ACCOUNT;

delete from account;

-- alter table 
-- ADD a Column 
ALTER table account add interest_rate INT ;

-- MODIFY TABLE CHANGE DATATYPE AND ADDING COLUMN LEVEL CONSTRINTS LIKE NOT NULL AND DEFAULT 0
ALTER table account MODIFY interest_rate BINARY_DOUBLE;
ALTER table account MODIFY interest_rate INT;

-- MODIFYING TABLE TO DEFAULT TO BE ZERO AND NOT NULL
ALTER table account MODIFY INTEREST_RATE DEFAULT 0 NOT NULL;
-- REMOVING THE ABOVE STATEMENT
ALTER table account MODIFY DEFAULT NULL NULL;


-- CHANGE THE NAME OF THE COLUMN
ALTER table account RENAME COLUMN interest_rate TO Saving_account_rate ;
ALTER table account RENAME COLUMN SAVING_ACCOUNT_RATE TO INTEREST_RATE;

-- DROP COLUMN
ALTER table account DROP COLUMN interest_rate;

-- CHANGE NAME OF THE TABLE
ALTER table account RENAME TO ACCOUNT_DETAILS;
ALTER table account_details RENAME TO account;

-- ADD AND DROP OF PRIMARY KEY
ALTER table account DROP PRIMARY KEY;
ALTER table account ADD CONSTRAINT primary_key PRIMARY KEY(ID);
select * from user_constraints;

-- DML (DATA MODIFICATION LANGUAGE)
-- INSERT UPDATE DELETE

