SELECT `first_name` FROM `employees`
WHERE `department_id` in(3,10) AND YEAR(`hire_date`) >=1995 AND YEAR(`hire_date`)<=2005 /*BETWEEN 1995 AND 2005*/
ORDER BY `employee_id`;