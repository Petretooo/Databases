SELECT c.country_code, COUNT(m.mountain_id) as mountain_range
FROM countries c
INNER JOIN mountains_countries m
ON c.country_code = m.country_code
WHERE c.country_name IN('United States', 'Russia', 'Bulgaria')
GROUP BY c.country_code
ORDER BY mountain_range DESC;
