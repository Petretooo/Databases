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
END $$

SELECT ufn_get_salary_level(40000);


/*ERROR 1418 
YOU MUST ADD these lines after RETURNS STATEMENT and before BEGIN
-READS SQL DATA
-DETERMINISTIC
*/
