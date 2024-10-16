WITH MovieRentals AS (
    SELECT co.country, fi.title AS movie_title, SUM(pay.amount) AS total_rent_amount
    FROM country co
    JOIN city ci ON co.country_id = ci.country_id
    JOIN address ad ON ci.city_id = ad.city_id
    JOIN customer cu ON ad.address_id = cu.address_id
    JOIN payment pay ON cu.customer_id = pay.customer_id
    JOIN rental re ON pay.rental_id = re.rental_id
    JOIN inventory inv ON re.inventory_id = inv.inventory_id
    JOIN film fi ON inv.film_id = fi.film_id
    WHERE co.country LIKE 'I%'
    GROUP BY co.country, fi.title
),

RankedMovies AS (
    SELECT country, movie_title, total_rent_amount,
        ROW_NUMBER() OVER (PARTITION BY country ORDER BY total_rent_amount DESC) AS rn
    FROM MovieRentals
)

SELECT country, movie_title AS most_popular_movie, total_rent_amount AS rent_amount
FROM RankedMovies
WHERE rn = 1
ORDER BY country;