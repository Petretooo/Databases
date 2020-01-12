DELIMITER $$
CREATE PROCEDURE udp_commit(username VARCHAR(30), password VARCHAR(30),
					message VARCHAR(255), issue_id INT)
BEGIN
	IF((SELECT COUNT(*) FROM users WHERE username = username) = 0) 
    THEN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No such user';
    ELSE IF((SELECT COUNT(*)
			FROM users
            WHERE username = username AND password = password) = 0)
	THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password is incorrect';
        ELSE IF((SELECT COUNT(*)
			FROM issues
            WHERE id = issue_id) = 0)
	THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password is incorrect';
END;
$$