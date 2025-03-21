-- **************************** JOINS *********************** --
-- FK RELATIONS KA USE KARKE DATA FETCH KARNE KE LIYE JOINS ARE USED --

-- TO APPLY  JOIN THERE SHOULD BE COMMON ATTRIBUTES BETWEEN BOTH THE TABLES

CREATE DATABASE JOINS_;
USE JOINS_;

CREATE TABLE PROJECT(
	ID INT PRIMARY KEY,
    EMP_ID INT,
    EMP_NAME VARCHAR(225),
    STARTDATE DATE,
    CLIENT_ID INT
);

CREATE TABLE EMPLOYEE(
	ID INT PRIMARY KEY,
    FNAME VARCHAR(225),
    LNAME VARCHAR(225),
    AGE INT,
    EMAIL_ID VARCHAR(225),
    PH_NO INT,
    CITY VARCHAR(225)
);

CREATE TABLE CLIENT(
	ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(225),
    LAST_NAME VARCHAR(225),
    AGE INT,
    EMAIL_ID VARCHAR(225),
    PH_NO INT,
    CITY VARCHAR(225),
    EMP_ID INT
);

INSERT INTO PROJECT 
VALUES (1, 1, 'A', '2021-04-21', 3), (2, 2, 'B', '2021-04-15', 1), (3, 3, 'C', '2021-01-16', 5), 
(4, 3, 'D', '2021-04-26', 2),
(5, 5, 'E', '2021-05-01', 4);



INSERT INTO EMPLOYEE 
VALUES
(1, 'AMAN', 'PROTO', 32, 'AMAN@GMAIL.COM', 898, 'DELHI'),
(2, 'YAGYA', 'NARAYAN', 44, 'YAGYA@GMAIL.COM', 222, 'PALAM'),
(3, 'RAHUL', 'BD', 22, 'RAHUL@GMAIL.COM', 444, 'KOLKATA'),
(4, 'JATIN', 'HERMIT', 31, 'JATIN@GMAIL.COM', 666, 'RAIPUR'),
(5, 'PK', 'PANDEY', 21, 'PK@GMAIL.COM', 555, 'JAIPUR');

INSERT INTO CLIENT
VALUES
(1, 'MAC', 'ROGERS', 47, 'MAX@HOTMAIL.COM', 333, 'KOLKATA', 3),
(2, 'MAX', 'POIRIER', 27, 'MAX@GMAIL.COM', 222, 'KOLKATA', 3),
(3, 'PETER', 'JAIN', 24, 'PETER@ABC.COM', 111, 'DELHI', 1),
(4, 'SUSHANT', 'AGGARWAL', 23, 'SUSHANT@YAHOO.COM', 45454, 'HYDERABAD', 5),
(5, 'PRATAP', 'SINGH', 36, 'P@XYZ.COM', 77767, 'MUMBAI', 2);

-- INNER JOIN 
-- ENLIST ALL THE EMPLOYEES IDS, NAMES ALONG WITH THE PROJECT ALLOCATED TO THEM

SELECT E.ID, E.FNAME, E.LNAME, P.ID, P.EMP_NAME FROM EMPLOYEE AS E 
INNER JOIN PROJECT AS P
ON E.ID = P.EMP_ID;



SELECT * FROM EMPLOYEE AS E 
INNER JOIN PROJECT AS P
ON E.ID = P.EMP_ID;



-- FETCH OUT ALL THE EMPLOYEE IDS AND THEIR CONTACT DETAIL WHO HAVE BEEN WORKING
-- FROM JAIPUR WITH THE CLIENTS NAME WORKING IN HYDERABAD

SELECT * FROM EMPLOYEE;
SELECT * FROM CLIENT;
SELECT E.ID, E.PH_NO, E.EMAIL_ID, C.FIRST_NAME, C.LAST_NAME FROM EMPLOYEE AS E
INNER JOIN CLIENT AS C ON E.ID = C.EMP_ID WHERE E.CITY = 'JAIPUR' AND C.CITY = 'HYDERABAD';


-- left join
-- FETCH OUT EACH PROJECT ALLOCATED TO EACH EMPLOYEE
SELECT * FROM EMPLOYEE;
SELECT * FROM PROJECT;
SELECT * FROM EMPLOYEE AS E 
LEFT JOIN PROJECT AS p
ON P.EMP_ID = E.ID;


-- RIGHT JOIN 
-- LIST OUT ALL THE PROJECTS WITH THEIR EMPLOYEE NAMES AND THEIR RESPECTIVE ALLOCATED EMAIL ID
SELECT P.ID, P.EMP_NAME, E.FNAME, E.LNAME, E.EMAIL_ID FROM EMPLOYEE AS E
RIGHT JOIN PROJECT AS P
ON P.EMP_ID = E.ID;


-- CROSS JOIN
-- LIST OUT ALL THE POSSIBLE COMBINATIONS POSSIBLE FOR THE EMPLOYEE NAME AND PROJECTS THAT CAN EXIST
SELECT E.FNAME, E.LNAME, P.ID, P.EMP_NAME FROM EMPLOYEE AS E CROSS JOIN PROJECT AS P;





-- CAN WE USE INNER JOIN WITHOUT USING  JOIN KEYWORD??

-- YES, SELECT * FROM [LEFT TABLE], [RIGHT TABLE] WHERE LEFTTABLE.ID = RIGHTTABLE.ID

SELECT * FROM EMPLOYEE AS E, PROJECT AS P WHERE E.ID = P.EMP_ID;


