
SELECT c.country_name, CASE 
WHEN AVG(ct.weather_state) <= 15 THEN "Cold" 
WHEN AVG(ct.weather_state)>=25 THEN "Hot"
ELSE "Warm"
END AS weather_type
FROM Weather ct 
LEFT JOIN Countries c
ON c.country_id = ct.country_id
WHERE day BETWEEN '2019-11-01' AND '2019-11-30'
GROUP BY c.country_name
