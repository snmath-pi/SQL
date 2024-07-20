-- CREATE TABLE Submissions(sub_id INT, parent_id INT);

--INSERT INTO Submissions(sub_id) VALUES
--(1), (2), (1), (12);

--INSERT INTO Submissions VALUES
--(3,1),(5,2),(3,1), (4,1), (9,1), (10,2),(6,7);

WITH CTE AS(
  SELECT DISTINCT sub_id
  FROM Submissions
  WHERE parent_id IS NULL
),

COM AS
(SELECT parent_id, COUNT(DISTINCT(sub_id)) AS number_of_comments
FROM Submissions
WHERE parent_id IS NOT NULL
GROUP BY parent_id)

SELECT sub_id AS post_id, CASE WHEN number_of_comments IS NOT NULL THEN number_of_comments ELSE 0 END
FROM CTE c1
LEFT JOIN COM c2
ON c1.sub_id = c2.parent_id
ORDER BY post_id

