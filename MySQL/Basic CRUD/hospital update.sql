UPDATE `employees`
SET `salary` = `salary` * 1.10
WHERE `job_title` = 'Therapist' AND `id` > 0;


SELECT `salary`
FROM `employees`
ORDER BY `salary`;
