CREATE DATABASE temp;
 show DATABASES;
 USE temp;
 
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
select * from customer;

CREATE table orderDetails(
	orderid INT PRIMARY KEY,
    deliveryDate date,
    customerId INT,
    FOREIGN KEY (customerId) references customer(id) 
);

describe orderDetails;

INSERT into orderDetails VALUES(1,'2019-03-11',245);

select * from orderDetails;

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