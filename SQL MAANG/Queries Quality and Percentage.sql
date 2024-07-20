# Write your MySQL query statement below

SELECT query_name, 
ROUND(SUM(rating / position) / COUNT(query_name), 2) AS quality,
ROUND(100*COUNT(CASE WHEN rating < 3 THEN 1 END) / COUNT(query_name),2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name
