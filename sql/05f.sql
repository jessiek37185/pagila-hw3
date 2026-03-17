/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */
SELECT title
FROM film 
JOIN film_category USING (film_id)
WHERE category_id IN(
	SELECT category_id
	FROM film_category
	JOIN film USING (film_id)
	WHERE title = 'AMERICAN CIRCUS'
)
GROUP BY title
HAVING COUNT(DISTINCT category_id) >= 2

INTERSECT

SELECT title
FROM film
JOIN film_actor USING (film_id)
WHERE actor_id IN
(
	SELECT actor_id
	FROM film_actor
	JOIN film USING (film_id)
	WHERE title = 'AMERICAN CIRCUS'
)
ORDER BY title
