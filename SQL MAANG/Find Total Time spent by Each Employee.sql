# Write your MySQL query statement below

SELECT event_day as day, emp_id, SUM(out_time)-SUM(in_time) AS total_time
FROM Employees 
GROUP BY emp_id, event_day
