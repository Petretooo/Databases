DELIMITER $$
CREATE FUNCTION ufn_get_salary_level(salary DOUBLE(10,4))
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(10);
    IF (salary < 30000) THEN SET result := 'Low';
    ELSEIF (salary BETWEEN 30000 AND 50000) THEN SET result := 'Average';
    ELSEIF (salary > 50000) THEN SET result := 'High';
    END IF;
    
    RETURN result;
END
$$

DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level(level_of_salary VARCHAR(8))
BEGIN
	SELECT first_name, last_name
    FROM employees
    WHERE ufn_get_salary_level(salary) = level_of_salary
    ORDER BY first_name DESC, last_name DESC;
END;
$$

CALL usp_get_employees_by_salary_level('high')