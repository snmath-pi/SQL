# Write your MySQL query statement below

WITH CTE AS (
    SELECT * 
    FROM Students 
    CROSS JOIN Subjects
),
CTE2 AS (
    SELECT student_id, subject_name, COUNT(subject_name) AS count
    FROM Examinations 
    GROUP BY student_id, subject_name
)

SELECT CTE.student_id, CTE.student_name, CTE.subject_name, 
CASE WHEN count IS NOT NULL THEN CTE2.count 
ELSE 0 END AS attended_exams
FROM CTE 
LEFT JOIN CTE2
ON CTE.student_id = CTE2.student_id AND CTE.subject_name = CTE2.subject_name
ORDER BY CTE.student_id,CTE.subject_name
