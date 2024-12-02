
-- select MAX(salary) from employee where salary < (select MAX(salary) from employee );

-- select departmentId,MAX(salary) from employee as e1 where salary < (select MAX(salary) from employee as e2 where e2.departmentId = e1.departmentId) GROUP BY departmentId

CREATE TABLE worker(
    ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME varchar(255),
    LAST_NAME varchar(255),
    salary INT,
    joiningDate DATE,
    department varchar(255)
);

INSERT INTO WORKER values(001,'Monika','Arora',100000,TO_DATE('14-02-20','DD-MM-YYYY'),'HR');
INSERT INTO WORKER values(002,'Niharika','Verma',80000,TO_DATE('14-06-11','DD-MM-YYYY'),'Admin');
INSERT INTO WORKER values(003,'Vishal','Singhla',300000,TO_DATE('14-02-20','DD-MM-YYYY'),'HR');
INSERT INTO WORKER values(004,'Amitabh','Singh',500000,TO_DATE('14-02-20','DD-MM-YYYY'),'Admin');
INSERT INTO WORKER values(005,'Vivek','Bhati',500000,TO_DATE('14-06-11','DD-MM-YYYY'),'Admin');
INSERT INTO WORKER values(006,'Vipul','Diwan',200000,TO_DATE('14-06-11','DD-MM-YYYY'),'Account');
INSERT INTO WORKER values(007,'Satish','Kumar',75000,TO_DATE('14-01-20','DD-MM-YYYY'),'Account');
INSERT INTO WORKER values(008,'Geetika','Chauhan',90000,TO_DATE('14-04-11','DD-MM-YYYY'),'Admin');

select * from worker;

DELETE FROM WORKER;
CREATE TABLE bonus(
    worker_ref_id INT,
    bonus_amount INT,
    bonus_date DATE,
    FOREIGN KEY(worker_ref_id) references worker(ID) ON DELETE CASCADE
);

INSERT INTO bonus VALUES(001,5000,TO_DATE('16-02-20','DD-MM-YYYY'));
INSERT INTO bonus VALUES(002,3000,TO_DATE('16-06-11','DD-MM-YYYY'));
INSERT INTO bonus VALUES(003,4000,TO_DATE('16-02-20','DD-MM-YYYY'));
INSERT INTO bonus VALUES(001,4500,TO_DATE('16-02-20','DD-MM-YYYY'));
INSERT INTO bonus VALUES(002,3500,TO_DATE('16-06-11','DD-MM-YYYY'));

select * from bonus;

CREATE TABLE title(
	worker_ref_id INT,
    worker_title varchar(255),
    accepted_from DATE,
    FOREIGN KEY (worker_ref_id) references worker(id) ON DELETE CASCADE
);

INSERT INTO TITLE VALUES(001,'Manager',TO_DATE('20-02-2020','DD-MM-YYYY'));
INSERT INTO TITLE VALUES(002,'Executive',TO_DATE('11-06-2016','DD-MM-YYYY'));
INSERT INTO TITLE VALUES(008,'Executive',TO_DATE('11-06-2016','DD-MM-YYYY'));
INSERT INTO TITLE VALUES(005,'Manager',TO_DATE('11-06-2016','DD-MM-YYYY'));
INSERT INTO TITLE VALUES(004,'Asst. Manager',TO_DATE('11-06-2016','DD-MM-YYYY'));
INSERT INTO TITLE VALUES(007,'Executive',TO_DATE('11-06-2016','DD-MM-YYYY'));
INSERT INTO TITLE VALUES(006,'Lead',TO_DATE('11-06-2016','DD-MM-YYYY'));
INSERT INTO TITLE VALUES(003,'Lead',TO_DATE('11-06-2016','DD-MM-YYYY'));

select * from title;

select * from title;

-- Ques 1 
select UPPER(FIRST_NAME) AS WorkerName from worker;

-- Ques 3
select department from worker group by department;
-- OR
select distinct department from worker;

-- Ques 4
select substr(first_name,0,3) from worker;

-- positon of b in amitabh Ques 5
select instr(first_name,'b') from worker where first_name = 'Amitabh';

-- white spaces from the right
select RTRIM(first_name) from worker;

-- white spaces from the left
select ltrim(first_name) from worker;

-- unique values of department
select department,COUNT(department) from worker group by department;

-- first name after repalcing a to A in first name
select REPLACE(first_name,'a','A') from worker ;

-- Complete Name as first_name last_name
select CONCAT(first_name,CONCAT(' ',last_name))AS Complete_Name from worker;

-- ALL DETAILS BY FIRST NAME ASCENDING
select * from worker order by first_name;

-- ALL DETAILS BY FIRST NAME ASCENDING AND THEN DEPARTMENT DESCENDING
select * from worker order by first_name, department desc;

-- PRINT DETAILS OF VIPUL AND SATISH
select * from worker where first_name IN ('Vipul','Satish');

-- details of everyone except vipul and satish
select * from worker where first_name NOT IN ('Vipul','Satish');

-- workers with department as admin
select * from worker where department = 'Admin';

-- workers where first name contains 'a'
select * from worker where first_name like '%a%';

-- first name ends with 'a'
select * from worker where first_name like '%a';

-- name with h and contains six letters
select * from worker where LENGTH(first_name) = 6 AND first_name like '%h';
--OR
select * from worker where first_name like '_____h';

-- salary between 100000 AND 500000
select * from worker where salary between 100000 AND 500000;

-- joined in feb 2014
SELECT * FROM worker  WHERE joiningDate BETWEEN TO_DATE('01-02-2020', 'DD-MM-YYYY') AND TO_DATE('29-02-2020', 'DD-MM-YYYY');

-- salary between 50000 and 100000
select CONCAT(first_name,concat(' ',last_name)) from worker where salary between 50000 and 100000;

-- sort the count of department by number of employees
select department,count(department) from worker group by department order by count(department) desc;

-- print details of workers whose titles are managers
select * from worker where id IN (select worker_ref_id from title where worker_title like 'Manager');
-- OR join
SELECT w.*, t.* 
FROM worker w 
INNER JOIN title t 
ON w.id = t.worker_ref_id 
WHERE worker_title LIKE '%Manager';

-- number of people of same title in the org of different types
select worker_title,COUNT(worker_title) from title group by worker_title having count(worker_title) > 1;

-- print odd rows
select * from worker where MOD(id,2) = 1;

-- print even rows
select * from worker where MOD(id,2) = 0;

-- create a clone of a table
create table worker_clone like worker;
insert into worker_clone select * from worker;
select * from worker_clone;

-- current time and date
select TO_CHAR(SYSDATE,'DD-MM-YYYY HH24:MI:SS') FROM DUAL;

-- TOP 5 SALARY RECORDS BY DESCENDING ORDER
select * from (select * from worker order by salary desc) where rownum <= 5;

-- 5th highest salary
select * from (select salary,id,first_name,last_name,row_number() over (order by salary desc) as rnk from worker) where rnk = 5;

-- list of employees with same salary
select w1.* from worker w1 INNER JOIN worker w2 ON w1.salary = w2.salary AND w1.id != w2.id;

-- second highest salary
select MAX(salary) from worker where salary < (select MAX(salary) from worker );
-- or
-- 2 top most salary
select * from (select * from worker order by salary desc) where rownum <= 2;
-- or
select * from (select first_name,last_name,id,salary,row_number() over (order by salary desc) as rnk from worker) where rnk = 2;

-- worker id who did not got bonus
select * from worker where id not in (select w.id from worker w INNER JOIN bonus b ON w.id = b.worker_ref_id);

-- print 50% of the employees
select * from worker where id <= (select count(*)/2 from worker )

-- departments with less than 4 people
select department,COUNT(department) from worker group by department having COUNT(department) < 4;

-- departments with number people
select department,COUNT(department) from worker group by department ;

-- highest salary in each department
select * from worker where salary in(select MAX(salary) from worker group by department);