# Write your MySQL query statement below
SELECT p.email Email
FROM Person p
GROUP BY email
HAVING COUNT(DISTINCT id)>1
