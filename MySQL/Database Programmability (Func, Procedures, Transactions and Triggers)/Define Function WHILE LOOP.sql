DELIMITER $$
CREATE FUNCTION ufn_is_word_comprised(letters VARCHAR(50), word VARCHAR(50))
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN 
	DECLARE indx INT;
    DECLARE symbol VARCHAR(1);
    SET indx := 1;
    WHILE indx <= CHAR_LENGTH(word)  DO
		SET symbol := SUBSTRING(word, indx, 1);
        IF LOCATE(symbol, letters) = 0 THEN
			RETURN 0;
		END IF;
        SET indx := indx + 1;
	END WHILE;
    RETURN 1;
END;
$$



SELECT ufn_is_word_comprised('petarfaohjfa', 'Peter');

