DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(str_start VARCHAR(10))
BEGIN
	SELECT name AS town_name
    FROM towns
    WHERE name LIKE CONCAT(str_start, '%')
    ORDER BY town_name;
END $$


CALL usp_get_towns_starting_with('b');