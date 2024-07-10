USE myDB;

UPDATE employees
SET hourly_pay = 10.25
WHERE employee_id = 6;

SELECT * FROM employees;
DELETE FROM employees WHERE employee_id = 6;

-- auto commit, commit and rollback

SET AUTOCOMMIT = OFF; -- creates a safepoint
COMMIT;
SELECT * FROM employees;
DELETE FROM employees;
ROLLBACK;
SELECT * FROM employees; -- it is recovered
COMMIT;

CREATE TABLE test (
	my_date DATE,
    my_time TIME,
    my_date_time DATETIME
);


SELECT * FROM test;
INSERT INTO test VALUES
(CURRENT_DATE(), CURRENT_TIME(), NOW());

INSERT INTO test VALUES
(CURRENT_DATE() + 1, NULL, NULL);

DROP TABLE test;

COMMIT;

CREATE TABLE products( product_id INT, product_name VARCHAR(25) UNIQUE, price DECIMAL(4, 2));

INSERT INTO products VALUES (1, 'SweatPants', 45.67);

ALTER TABLE products 
ADD CONSTRAINT
UNIQUE (product_id);

SELECT * FROM products;
INSERT INTO products VALUES
(2, 'Uniqlo', 10.56),
(3, 'Jockey', 12.12),
(4, 'USpolo', 56.70);

-- INSERT INTO products VALUES (2, 'Uniqlo', 12.09); 
-- Error Code: 1062. Duplicate entry 'Uniqlo' for key 'products.product_name'

ALTER TABLE products 
MODIFY price DECIMAL(4, 2) NOT NULL;

-- INSERT INTO products VALUES (5, 'JAJA', NULL);
-- Error Code: 1048. Column 'price' cannot be null

ALTER TABLE employees
ADD CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10.00);

-- INSERT INTO employees VALUES(6, 'Jojo','Siwa', 4.50, '2024-05-02');
-- Error Code: 3819. Check constraint 'chk_hourly_pay' is violated.

ALTER TABLE employees
DROP CHECK chk_hourly_pay;

SELECT * FROM products;

INSERT INTO products VALUES 
(5, 'Hanger', 0.00),
(6, 'Paper Bag', 0.00);
DELETE FROM products WHERE product_id > 4;

ALTER TABLE products
ALTER price SET DEFAULT 0;

INSERT INTO products(product_id, product_name) 
VALUES
(5, 'Hanger'),
(6, 'Paper Bag');

CREATE TABLE transactions (transaction_id INT, amount DECIMAL(5, 2), transaction_date DATETIME DEFAULT NOW());

INSERT INTO transactions(transaction_id, amount)
VALUES
(1, 576.60);

SELECT * FROM transactions;


