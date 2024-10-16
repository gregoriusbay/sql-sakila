SELECT CONCAT(sta.first_name, " ", sta.last_name) AS staff_name, co.country, 
	COUNT(co.country) AS customer_served
FROM country co
JOIN city ci ON co.country_id = ci.country_id
JOIN address ad ON ci.city_id = ad.city_id
JOIN customer cu ON ad.address_id = cu.address_id
JOIN payment pa ON cu.customer_id = pa.customer_id
JOIN staff sta ON pa.staff_id = sta.staff_id
WHERE pa.staff_id = 1
GROUP BY co.country
ORDER BY COUNT(co.country) DESC;