-- PRIMARY KEY -> 
-- UNIQUE AND NOT NULL
-- ONLY ONE PK PER TABLE
CREATE TABLE transactions (transaction_id INT PRIMARY KEY, amount DECIMAL(5, 2));

SELECT * FROM transactions;

-- ALTER TABLE transactions 
-- ADD CONSTRAINT PRIMARY KEY(transaction_id);

INSERT INTO transactions VALUES(1000, 4.99);
INSERT INTO transactions VALUES(1001, 2.99);
INSERT INTO transactions VALUES(1002, 3.38);

SELECT amount FROM transactions 
WHERE transaction_id = 1002;

DROP TABLE transactions;
CREATE TABLE transactions ( transaction_id INT PRIMARY KEY AUTO_INCREMENT, amount DECIMAL(5, 2));
SELECT * FROM transactions;

INSERT INTO transactions(amount) VALUES(4.99), (3.38), (2.99), (5.60);

SELECT * FROM transactions;

ALTER TABLE transactions
AUTO_INCREMENT = 1000;

DELETE FROM transactions;

INSERT INTO transactions(amount) VALUES(4.99), (3.38), (2.99), (5.60);
SELECT * FROM transactions;

CREATE TABLE customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);
SELECT * FROM customers;
INSERT INTO customers(first_name, last_name) VALUES
('Fred', 'Fish'),
('Larry', 'Lobster'),
('Bubble', 'Bass');

DROP TABLE transactions;

CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

SELECT * FROM transactions;
ALTER TABLE transactions
ADD CONSTRAINT fk_transaction
FOREIGN KEY(customer_id) REFERENCES customers(customer_id);

ALTER TABLE transactions
AUTO_INCREMENT = 1000;

INSERT INTO transactions(amount, customer_id) 
VALUES 
(4.99, 3),
(2.89, 2),
(3.38, 3),
(4.99, 1);

SELECT * FROM transactions;
SELECT * FROM customers;
