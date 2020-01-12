USE hospital;
CREATE VIEW `v_top_paid_employee2` AS
SELECT * 
FROM hospital.employees
ORDER BY `salary` DESC
LIMIT 1;

CREATE VIEW v_top_paid_employee3 AS
SELECT *
FROM hospital.employees
WHERE salary = MAX(salary);

SELECT * FROM hospital.v_top_paid_employee2;