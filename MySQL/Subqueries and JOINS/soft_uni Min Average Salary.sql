SELECT MIN(avg_s.avg_sal) AS min_avarage_salary
FROM (
SELECT e.department_id, AVG(e.salary) AS avg_sal
FROM employees AS e
GROUP BY e.department_id
) AS avg_s;

SELECT AVG(e.salary) AS min_avarage_salary
FROM employees AS e
GROUP BY e.department_id
ORDER BY min_avarage_salary
LIMIT 1;