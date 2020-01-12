DELETE FROM repositories
WHERE (
SELECT COUNT(*) 
FROM issues
WHERE issues.repository_id = repositories.id
) = 0;