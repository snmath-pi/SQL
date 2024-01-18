CREATE DATABASE temp;

USE temp;

CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(255)
);
INSERT INTO student values(1, 'Saksham');

SELECT * FROM student;

/*

See DataTypes from Notes;

Audio / Video ko bytes mein convert karke store karne ke liye BLOB
 
*/
