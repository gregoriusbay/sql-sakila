SELECT fi.title, SUM(pay.amount) AS rent_amount FROM film fi
JOIN film_actor fia ON fi.film_id = fia.film_id
JOIN actor act ON fia.actor_id = act.actor_id
JOIN inventory inv ON fi.film_id = inv.film_id
JOIN rental re ON inv.inventory_id = re.inventory_id
JOIN payment pay ON re.rental_id = pay.rental_id
WHERE CONCAT(act.first_name, ' ', act.last_name) = 'SUSAN DAVIS'
GROUP BY fi.title
ORDER BY rent_amount DESC
LIMIT 5;