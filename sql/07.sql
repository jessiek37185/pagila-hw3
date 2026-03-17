/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
SELECT (first_name || ' ' || last_name) AS "Actor Name"
FROM actor a
JOIN film_actor fa1 USING (actor_id)
JOIN film_actor fa2 USING (film_id)
WHERE fa2.actor_id IN (
	SELECT DISTINCT fa1.actor_id
	FROM film_actor fa1
	JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
	JOIN actor a2 ON fa2.actor_id = a2.actor_id
	WHERE a2.first_name = 'RUSSELL' AND a2.last_name = 'BACALL'
)
AND a.actor_id NOT IN (
	SELECT DISTINCT fa2.actor_id
	FROM film_actor fa1
	JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
	WHERE fa1.actor_id IN (
		SELECT actor_id
		FROM actor
		WHERE first_name = 'RUSSELL' AND last_name = 'BACALL'
	)
)
GROUP BY "Actor Name"
ORDER BY "Actor Name";
