SELECT "c"."name" AS "category", sum("p"."amount") AS "total_sales"
FROM "sakila"."payment" "p"
	JOIN "sakila"."rental" "r" ON "p"."rental_id" = "r"."rental_id"
	JOIN "sakila"."inventory" "i" ON "r"."inventory_id" = "i"."inventory_id"
	JOIN "sakila"."film" "f" ON "i"."film_id" = "f"."film_id"
	JOIN "sakila"."film_category" "fc" ON "f"."film_id" = "fc"."film_id"
	JOIN "sakila"."category" "c" ON "fc"."category_id" = "c"."category_id"
GROUP BY "c"."name"
ORDER BY "total_sales" DESC;
SELECT DISTINCT
-- HIGH_PRIORITY
-- STRAIGHT_JOIN
-- SQL_BIG_RESULT
-- SQL_CACHE
-- SQL_CALC_FOUND_ROWS
concat("c"."city", '', '', "cy"."country") AS "store"
	, concat("m"."first_name", '', "m"."last_name") AS "manager"
	, sum("p"."amount") AS "total_sales"
FROM "sakila"."payment" "p"
	JOIN "sakila"."rental" "r" ON "p"."rental_id" = "r"."rental_id"
	JOIN "sakila"."inventory" "i" ON "r"."inventory_id" = "i"."inventory_id"
	JOIN "sakila"."store" "s" ON "i"."store_id" = "s"."store_id"
	JOIN "sakila"."address" "a" ON "s"."address_id" = "a"."address_id"
	JOIN "sakila"."city" "c" ON "a"."city_id" = "c"."city_id"
	JOIN "sakila"."country" "cy" ON "c"."country_id" = "cy"."country_id"
	JOIN "sakila"."staff" "m" ON "s"."manager_staff_id" = "m"."staff_id"
WHERE "sakila"."staff"."staff_id" = 1
	OR "sakila"."staff"."staff_id" = 2
GROUP BY "sakila"."store"."store_id", "sakila"."country"."country", "sakila"."city"."city"
HAVING "sakila"."store"."store_id" = 1
ORDER BY "sakila"."country"."country", "sakila"."city"."city"
LIMIT 4 OFFSET 3
FOR SHARE;
SELECT a."Id", "B"."Id"
FROM hello.tb1 a
	JOIN hello.tb1_1 "B"
FOR UPDATE NOWAIT;
SELECT *
FROM "Sakila".actor
FOR SHARE;