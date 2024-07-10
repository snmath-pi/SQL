CREATE DATABASE myDB;
USE myDB;
-- DROP DATABASE myDB; 
-- ALTER DATABASE myDB READ ONLY = 1;
-- DROP DATABASE myDB; Error Code: 3989. Schema 'mydb' is in read only mode.
-- ALTER DATABASE myDB READ ONLY = 0; 

CREATE TABLE employees (
	employee_id INT AUTO_INCREMENT ,
    first_name VARCHAR(50),
    last_name varchar(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE
);

SELECT * FROM employees;

RENAME TABLE employees TO workers;
RENAME TABLE workers TO employees;

-- DROP TABLE employees

ALTER TABLE employees
ADD phone_number VARCHAR(15);

SELECT * FROM employees;
ALTER TABLE employees
RENAME COLUMN phone_number to email;

ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100);

-- MOVING COLUMNS POSITION
-- ALTER TABLE employees
-- MODIFY email VARCHAR(100)
-- AFTER last_name;
-- ALTER TABLE employees
-- MODIFY email VARCHAR(100)
-- FIRST

SELECT * FROM employees;
ALTER TABLE employees DROP email;

INSERT INTO employees VALUES (1, "Eugene", "Krabs", 25.50, "2023-01-02");

INSERT INTO employees VALUES
(2, "Squidward", "Tentacles", 15, "2023-01-03"), 
(3, "Spongebob", "SqaurePants", 12.50, "2023-01-04"), 
(4, "Patrick", "Start", 12.50, "2023-01-05"), 
(5, "Sandy", "Cheeks", 17.25, "2023-01-06");

SELECT * FROM employees;

INSERT INTO employees(employee_id, first_name, last_name)
VALUES (6, "Sheldon", "Plankton");

UPDATE employees 
SET hourly_pay = 10.25
WHERE employee_id = 6;

DELETE FROM employees 
WHERE employee_id = 1;

INSERT INTO employees VALUES (1, 'Krusty', 'Crabs', 25.50, '2023-01-01');

SELECT * FROM employees
ORDER BY employee_id;

