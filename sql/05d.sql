/* 
 * In the previous query, the actors could come from any combination of movies.
 * Unfortunately, you've found that if the actors all come from only 1 or 2 of the movies,
 * then there is not enough diversity in the acting talent.
 *
 * Write a SQL query that lists all of the movies where:
 * at least 1 actor was also in AMERICAN CIRCUS,
 * at least 1 actor was also in ACADEMY DINOSAUR,
 * and at least 1 actor was also in AGENT TRUMAN.
 *
 * HINT:
 * There are many ways to solve this problem,
 * but I personally found the INTERSECT operator to make a convenient solution.
 */
SELECT DISTINCT film2.title
FROM film_actor f1
JOIN film film1 ON f1.film_id = film1.film_id
JOIN film_actor f2 USING (actor_id)
JOIN film film2 ON f2.film_id = film2.film_id
WHERE film1.title = 'AMERICAN CIRCUS'

INTERSECT

SELECT DISTINCT film2.title
FROM film_actor f1
JOIN film film1 ON f1.film_id = film1.film_id
JOIN film_actor f2 USING (actor_id)
JOIN film film2 ON f2.film_id = film2.film_id
WHERE film1.title = 'ACADEMY DINOSAUR'

INTERSECT

SELECT DISTINCT film2.title
FROM film_actor f1
JOIN film film1 ON f1.film_id = film1.film_id
JOIN film_actor f2 USING (actor_id)
JOIN film film2 ON f2.film_id = film2.film_id
WHERE film1.title = 'AGENT TRUMAN'

ORDER BY title;
