SELECT cat.name AS movie_category, COUNT(fic.category_id) AS number FROM category cat
JOIN film_category fic ON cat.category_id = fic.category_id
JOIN film fi ON fic.film_id = fi.film_id
GROUP BY cat.name
ORDER BY number DESC
LIMIT 10;