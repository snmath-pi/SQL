# Write your MySQL query statement below


SELECT p.product_id, 
CASE WHEN ROUND(SUM(u.units*p.price) / SUM(u.units),2) IS NOT NULL 
THEN 
ROUND(SUM(u.units*p.price) / SUM(u.units),2) ELSE 0 END 
AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON u.purchase_date BETWEEN p.start_date AND p.end_date 
AND p.product_id = u.product_id
GROUP BY p.product_id 
ORDER BY p.product_id
