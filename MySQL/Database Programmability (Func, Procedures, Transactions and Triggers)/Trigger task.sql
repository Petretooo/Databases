CREATE TABLE logs(
log_id INT(11) PRIMARY KEY AUTO_INCREMENT,
account_id INT(11),
old_sum DECIMAL(19,4),
new_sum DECIMAL(19,4)
);


DELIMITER $$
CREATE TRIGGER tr_logs
AFTER UPDATE
ON accounts
FOR EACH ROW
BEGIN
	INSERT INTO logs(account_id, old_sum, new_sum) 
    VALUES(OLD.id, OLD.balance, NEW.balance);
END;
$$

UPDATE accounts
SET balance = balance + 10
WHERE id = 1;


SELECT * FROM logs;