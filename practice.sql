create table student(
  id INT PRIMARY KEY,
    name VARCHAR(255)
);
describe student;
insert into student values(1,'Ankit');
select * from student;

drop table student;

create table worker(
  worker_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(255) ,
    last_name VARCHAR(255),
    salary INT,
    join_date DATE,
    department VARCHAR(255)  
);

describe worker;

insert into worker values(1,'Monika','Arora',100000,TO_DATE('2024-11-13','YYYY-MM-DD'),'HR');
insert into worker values(2,'Nihrika','Verma',80000,TO_DATE('2024-11-13','YYYY-MM-DD'),'Admin');
insert into worker values(3,'Vishal','Singhal',300000,TO_DATE('2024-11-13','YYYY-MM-DD'),'HR');
insert into worker values(4,'Amitabh','Singh',500000,TO_DATE('2024-11-13','YYYY-MM-DD'),'Admin');
insert into worker values(5,'Vivek','Bhati',500000,TO_DATE('2024-11-13','YYYY-MM-DD'),'Admin');
insert into worker values(6,'Vipul','Diwan',200000,TO_DATE('2024-11-13','YYYY-MM-DD'),'Accountant');
insert into worker values(7,'Satish','Kumar',75000,TO_DATE('2024-11-13','YYYY-MM-DD'),'Accountant');
insert into worker values(8,'Geetika','Chauhan',90000,TO_DATE('2024-11-13','YYYY-MM-DD'),'Admin');

select * from worker;

create table bonus(
    worker_id INT,
    bonus_amt INT,
    bonus_date DATE,
    FOREIGN KEY(worker_id) references worker(worker_id) ON DELETE CASCADE
);

describe bonus;

insert into bonus values(1,5000,TO_DATE('2024-10-13','YYYY-MM-DD'));
insert into bonus values(2,3000,TO_DATE('2024-09-13','YYYY-MM-DD'));
insert into bonus values(3,4000,TO_DATE('2024-08-20','YYYY-MM-DD'));
insert into bonus values(1,4500,TO_DATE('2024-09-25','YYYY-MM-DD'));
insert into bonus values(2,3500,TO_DATE('2024-06-08','YYYY-MM-DD'));

select * from bonus;

create table title(
  worker_id INT,
    worker_title varchar(255),
    affected_from DATE,
    FOREIGN KEY (worker_id) references worker(worker_id) ON DELETE CASCADE
);

describe title;

insert into title values (1,'Manager',TO_DATE('2024-11-12','YYYY-MM-DD'));
insert into title values (2,'Executive',TO_DATE('2023-06-11','YYYY-MM-DD'));
insert into title values (8,'Executive',TO_DATE('2024-07-10','YYYY-MM-DD'));
insert into title values (5,'Manager',TO_DATE('2024-08-15','YYYY-MM-DD'));
insert into title values (4,'Asst. Manager',TO_DATE('2024-07-14','YYYY-MM-DD'));
insert into title values (7,'Executive',TO_DATE('2024-04-17','YYYY-MM-DD'));
insert into title values (6,'Lead',TO_DATE('2024-03-20','YYYY-MM-DD'));
insert into title values (3,'Lead',TO_DATE('2022-05-20','YYYY-MM-DD'));

select * from title;