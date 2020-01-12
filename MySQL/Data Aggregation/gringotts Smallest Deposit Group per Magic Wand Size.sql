SELECT aws.`deposit_group`
FROM 
	(SELECT wd.`deposit_group`, AVG(`magic_wand_size`) AS 'avarage_wand_size'
	FROM `wizzard_deposits` as wd
	GROUP BY wd.`deposit_group`
    ORDER BY `avarage_wand_size`) AS aws
LIMIT 1;