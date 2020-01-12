DELIMITER $$
CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(20))
BEGIN
	SELECT e.first_name, e.last_name
    FROM towns AS t
    INNER JOIN addresses AS a
    ON t.town_id = a.town_id
    INNER JOIN employees AS e
    ON a.address_id = e.address_id
    WHERE t.name = town_name
    ORDER BY e.first_name, e.last_name;
END;
$$

CALL usp_get_employees_from_town('Sofia');