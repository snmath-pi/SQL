# Write your MySQL query statement below

SELECT 
CASE WHEN eu.unique_id IS NOT NULL 
THEN eu.unique_id 
ELSE null
END AS unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id
