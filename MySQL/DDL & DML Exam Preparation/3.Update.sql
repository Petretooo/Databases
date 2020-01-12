UPDATE repositories_contributors
SET repository_id = (
SELECT id
FROM repositories
LEFT JOIN repositories_contributors rc
ON repositories.id = rc.repository_id
WHERE rc.repository_id IS NULL
ORDER BY id ASC
LIMIT 1
)
WHERE contributor_id = repository_id