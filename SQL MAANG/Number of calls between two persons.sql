
WITH CTE AS (
  SELECT 
  CASE WHEN 
  from_id > to_id
  THEN to_id
  ELSE from_id
  END AS from_idx,
  CASE WHEN from_id > to_id
  THEN from_id
  ELSE to_id
  END AS to_idx,
  duration
  FROM Calls
), CTE2 AS (
  SELECT CONCAT(from_idx, to_idx) AS combined, duration
  FROM CTE

)


SELECT SUBSTR(combined, 1, 1) AS player1, 
    SUBSTR(combined, 2, 2)AS player2, SUM(duration) AS duration
FROM CTE2
GROUP BY combined
