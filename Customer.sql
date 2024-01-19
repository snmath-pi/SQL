CREATE DATABASE ORG;

SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO WORKER 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (001, 'Monika', 'Arora', 1000000, '14-02-20 09.00.00', 'HR'),
	(002, 'Niharika', 'Verma', 800000, '14-06-11 09.00.00', 'Admin'),
	(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
    (004, 'Amitabh', 'Singh', 1000000, '14-02-20 09.00.00', 'Admin'),
    (005, 'Vivek', 'Bharti', 1000000, '14-02-20 09.00.00', 'Admin'),
    (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
    (007, 'Saitsh', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
    (008, 'Gretika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');


SELECT * FROM WORKER;




CREATE TABLE BONUS(
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    foreign key (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE

);



insert into BONUS 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (001, 5000, '16-02-20'), (002, 3000, '16-06-11'), (003, 4000, '16-02-20'), (001, 4500, '16-02-20'),
    (002, 3500, '16-06-11');
    
    
    
create table Title (WORKER_REF_ID INT, WORKER_TITLE CHAR(25), AFFECTED_FROM DATETIME, FOREIGN KEY(WORKER_REF_ID)
REFERENCES Worker(WORKER_ID) ON DELETE CASCADE);

insert into Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES (001, 'Manager', '2016-02-20 00:00:00'), 
(002, 'Executive', '2016-02-20 00:00:00'), 
(008, 'Executive', '2016-06-11 00:00:00'), 
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Ass. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),

(003, 'Lead', '2016-06-11 00:00:00');




select * from worker;
select first_name, salary from worker;
/*select statement mein order of execution right to left hota hai pehle table 
can we use select keyword without using from clause?
yes use dual tables
dual tables are dummy tables made by sql
*/

select now();

select 44 + 11;

select lcase('SAKSHAM');

select ucase('saksahmamamam');


/*where clause*/


select * from worker where department = 'hr';
select * from worker where salary > 80000;

/*between clause [x, y] both are inclusive in between*/

select * from worker where salary between 90000 and 300000;



/*in reduces or conditions bahut sare or nahi dalne padte*/
select * from worker where department  = 'hr' or department = 'account';
select * from worker where department in('hr', 'account');

select * from worker;

select * from worker where worker_id between 3 and 7;


select * from worker where worker_id in(3, 4, 6);

select * from worker where first_name in ('Vishal');

select * from worker where worker_id not in(3, 4, 6);

select * from worker where department not in ('hr');


-- wildcar
select * from worker where first_name like '_i%';
select * from worker where first_name like '%i%';


-- sorting using order by

select * from worker order by salary;
select * from worker order by salary desc;
-- asc default hota hai


-- distinct keyword in sql
/*
suppose mujhe chaiye distinct departments matlab total distinct dep
*/
select department from worker;
SELECT DISTINCT DEPARTMENT FROM WORKER;

-- DATA KI GROUPING KARNI HAI
-- FIND NUMBER OF EMPLOYEESS WORKING IN DIFFERENT DEPARTMENT MATLAB FREQUENCY OF WORKERS IN EACH DEPT.
-- FIND NUMBER OF CUSTOMERS IN EACH COUNTRY
-- BASICALLY GROUPING KARNA CHAHTA BECAUSE AGGREGATION KARNI
-- GROUP BY IS USED WITH SOME AGGREGATION FUNCTION COUNT, SUM, AVG, MIN, MAX

-- GROUP BY

SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT;
--     YAHA PAR JO DIYA                SAME YAHA PAR HONA CHAIYE

-- FARK YE HUA AGAR AGGREGATION FUNC USE NAHI KIYA TOH SQL ISE DISTINCT KI TARAH TREAT KAREGA

-- THEREFORE AGGREGATION IS A MUST

SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT;

--     NAME | DEPT
--     	A 	| HR
-- 		B	| ADMIN .... VEGERA
-- CONCEPT: INTERNALLY TABLE REARRAGE HO GAYA WITH AGGREATION HR, HR ,,,,, ADMIN, ADMIN.... BLA BLA
-- AUR AB REARRANGE KE BAAD USNE COUNT MAR DIYA 

-- AVG SALARY PER DEPARTMENT
SELECT DEPARTMENT, AVG(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- MIN SALARY PER DEPT

SELECT DEPARTMENT, MIN(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- MAX 

SELECT DEPARTMENT, MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- PER DEPARTMENT TOTAL SALRY
SELECT DEPARTMENT, SUM(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- KEYWORD :: HAVING

-- BASICALLY USE LIKE WHERE TO APPLY FILTERING IN GROUP BY [SAME KAAM BAS KOI FILTERING CONDITION]

-- CATEGORIES MADE BY DEPT AUR UNME FILTERING KARNI

-- DEPARTMENTS AND COUNTS HAVING MORE THAN TWO WORKER

SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 2;

SELECT DEPARTMENT, AVG(SALARY) FROM WORKER GROUP BY DEPARTMENT HAVING AVG(SALARY) < MAX(SALARY);

-- DDB CONSTRAINTS

-- PRIMARY KEY CONSTRAINTS
-- NOT NULL, ONLY ONE PRIMARY KEY PER TABLE, UNIQUE, [GOOD PRACTICE: PRIMARY KEY SHOULD BE INT]
/*
CREATE TABLE x (
	ID INT PRIMARY KEY;
    NAME.... BLAB 
    
    OR OTHER WAY TO DO THIS
    PRIMARY KEY(ID);
);
*/
-- FOREIGN KEY CONSTRATINT
-- REFERS TO PRIMARY KEY OF OTHER TABLE
/*
CREATE TABLE ORDER (
	ID INT PRIMARY KEY;
    ... BLA BLA
    FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(ID)
    -- MATLAB CUSTOMER TABLE SE REFERENCE LELI USKI PRIMARY KEY AUR USE ISKI FOREIGN KEY SET
    CUSTOMER -> PARENT TABLE, ORDER -> CHILD(TABLE) 
);
*/









