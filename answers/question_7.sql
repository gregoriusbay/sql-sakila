SELECT co.country, COUNT(DISTINCT cu.customer_id) AS customer_number
FROM country co
JOIN city ci ON co.country_id = ci.country_id
JOIN address ad ON ci.city_id = ad.city_id
JOIN customer cu ON ad.address_id = cu.address_id
GROUP BY co.country
ORDER BY COUNT(DISTINCT cu.customer_id) DESC