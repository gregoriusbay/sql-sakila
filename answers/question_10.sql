SELECT fi.title AS movie_title, SUM(pay.amount) AS total_rent_amount
FROM country co
JOIN city ci ON co.country_id = ci.country_id
JOIN address ad ON ci.city_id = ad.city_id
JOIN customer cu ON ad.address_id = cu.address_id
JOIN payment pay ON cu.customer_id = pay.customer_id
JOIN rental re ON pay.rental_id = re.rental_id
JOIN inventory inv ON re.inventory_id = inv.inventory_id
JOIN film fi ON inv.film_id = fi.film_id
WHERE co.country = 'Indonesia'
GROUP BY movie_title
ORDER BY total_rent_amount DESC
LIMIT 10;