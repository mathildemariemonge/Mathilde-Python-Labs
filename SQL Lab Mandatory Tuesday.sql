SELECT first_name, last_name, count(fa.film_id)
FROM sakila.actor AS a
JOIN sakila.film_actor AS fa
ON a.actor_id=fa.actor_id
GROUP BY a.actor_id
ORDER BY count(fa.film_id) DESC
LIMIT 1;

SELECT first_name, last_name, count(r.rental_id)
FROM sakila.customer AS c
JOIN sakila.rental AS r
ON c.customer_id=r.customer_id
GROUP BY c.customer_id
ORDER BY count(r.rental_id) DESC
LIMIT 1;

SELECT c.name, count(r.film_id)
FROM sakila.category AS c
JOIN sakila.film_category AS r
ON c.category_id=r.category_id
GROUP BY c.name
ORDER BY c.name;

SELECT s.first_name, s.last_name, a.address
FROM sakila.staff AS s
JOIN sakila.address AS a
ON s.address_id=a.address_id
GROUP BY s.staff_id;

SELECT f.title AS title, l.name AS language
FROM sakila.film AS f
JOIN sakila.language AS l
ON f.language_id=l.language_id
WHERE f.title like 'M%';

SELECT s.first_name, s.last_name, sum(p.amount) 
FROM sakila.staff AS s
JOIN sakila.payment AS p
ON s.staff_id=p.staff_id
WHERE p.payment_date LIKE '2005-08%'
GROUP BY s.staff_id;

SELECT f.title, count(fa.actor_id)
FROM sakila.film AS f
JOIN sakila.film_actor AS fa
ON f.film_id=fa.film_id
GROUP BY f.film_id
ORDER BY count(fa.actor_id) DESC;

SELECT c.first_name, c.last_name, sum(p.amount)
FROM sakila.customer AS c
JOIN sakila.payment AS p
ON c.customer_id=p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;

SELECT a.actor_id
FROM sakila.film_actor AS a
LEFT JOIN sakila.film AS f
ON a.film_id=f.film_id
WHERE a.film_id IS NULL;

SELECT a.address
FROM sakila.address AS a
LEFT JOIN sakila.customer AS c
ON a.address_id=c.address_id
WHERE c.customer_id IS NULL
HAVING a.address LIKE '%e';

SELECT f.title, count(r.rental_id)
FROM sakila.rental AS r
JOIN sakila.inventory AS i
ON r.inventory_id=i.inventory_id
JOIN sakila.film AS f
ON f.film_id=i.film_id
GROUP BY f.film_id
ORDER BY count(r.rental_id) DESC
LIMIT 1;