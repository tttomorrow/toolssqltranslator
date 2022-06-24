SELECT "c"."name" AS "category", sum("p"."amount") AS "total_sales"
FROM "sakila"."payment" "p"
	JOIN "sakila"."rental" "r" ON "p"."rental_id" = "r"."rental_id"
	JOIN "sakila"."inventory" "i" ON "r"."inventory_id" = "i"."inventory_id"
	JOIN "sakila"."film" "f" ON "i"."film_id" = "f"."film_id"
	JOIN "sakila"."film_category" "fc" ON "f"."film_id" = "fc"."film_id"
	JOIN "sakila"."category" "c" ON "fc"."category_id" = "c"."category_id"
GROUP BY "c"."name"
ORDER BY "total_sales" DESC
