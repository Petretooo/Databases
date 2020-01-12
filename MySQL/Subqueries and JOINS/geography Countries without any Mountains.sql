SELECT count(cq.country_name)
FROM 
(
	SELECT 
		c.country_code,
        c.country_name,
        mc.mountain_id
	FROM countries c
    LEFT JOIN mountains_countries mc
    ON c.country_code = mc.country_code
    WHERE mc.mountain_id IS NULL
) as cq;