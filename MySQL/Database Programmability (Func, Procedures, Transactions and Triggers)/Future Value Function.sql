DELIMITER $$
CREATE FUNCTION ufn_calculate_future_value(init_sum DOUBLE(10,4), rate DOUBLE(10,2), years INT)
RETURNS DOUBLE
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE future_value DOUBLE;
    
    SET future_value := init_sum * POW(1 + rate, years);
    
    RETURN future_value;
END;
$$


SELECT ufn_calculate_future_value(1000,0.1,5);