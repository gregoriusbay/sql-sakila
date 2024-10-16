SELECT CONCAT(act.first_name, " ", act.last_name) AS actor_name, 
	COUNT(DISTINCT fia.film_id) AS movies
FROM actor act
JOIN film_actor fia ON act.actor_id = fia.actor_id
GROUP BY actor_name
ORDER BY movies DESC