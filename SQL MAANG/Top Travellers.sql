# Write your MySQL query statement below

SELECT u.name, 
CASE WHEN SUM(r.distance) IS NULL 
THEN 0
ELSE SUM(r.distance) 
END AS travelled_distance
FROM Users u
LEFT JOIN Rides r
ON r.user_id = u.id
GROUP BY r.user_id
ORDER BY travelled_distance DESC, u.name ASC
