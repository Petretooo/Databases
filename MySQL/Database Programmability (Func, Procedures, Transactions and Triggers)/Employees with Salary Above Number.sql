DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above(num_salary DOUBLE)
BEGIN
	SELECT first_name, last_name
    FROM employees
    WHERE salary >= num_salary
    ORDER BY first_name, last_name, employee_id DESC;
END;
$$

CALL usp_get_employees_salary_above(4800)