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






