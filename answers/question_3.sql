SELECT la.name AS language, COUNT(fi.language_id) AS number 
FROM language la
JOIN film fi ON la.language_id = fi.language_id
GROUP BY la.name
ORDER BY number DESC;