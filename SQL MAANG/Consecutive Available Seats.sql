SELECT w.seat_id
FROM (SELECT *, LEAD(free) OVER(ORDER BY seat_id) AS NextSeat, LAG(free) OVER(ORDER BY seat_id) AS PrevSeat
FROM Cinema) as w
WHERE w.free = 1 AND w.NextSeat = 1 
OR w.free = 1  AND w.PrevSeat = 1
ORDER BY w.seat_id
