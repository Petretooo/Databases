SELECT e.first_name, e.last_name, t.name AS town, a.address_text
FROM employees e
INNER JOIN addresses a
ON e.address_id = a.address_id
INNER JOIN towns t
ON a.town_id = t.town_id
ORDER BY e.first_name ASC, last_name ASC
LIMIT 5;