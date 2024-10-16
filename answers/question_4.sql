SELECT CONCAT(act.first_name, ' ', act.last_name) AS actor_name, SUM(pay.amount) AS rent_income from actor act 
JOIN film_actor fia ON act.actor_id = fia.actor_id
JOIN film fi ON fia.film_id = fi.film_id
JOIN inventory inv ON fi.film_id = inv.film_id
JOIN rental re ON inv.inventory_id = re.inventory_id
JOIN payment pay ON re.rental_id = pay.rental_id
GROUP BY act.actor_id
ORDER BY rent_income DESC
LIMIT 10;