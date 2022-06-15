select `c`.`name` AS `category`, sum(`p`.`amount`) AS `total_sales`
from (((((`sakila`.`payment` `p`
    join `sakila`.`rental` `r` on ((`p`.`rental_id` = `r`.`rental_id`)))
    join `sakila`.`inventory` `i` on ((`r`.`inventory_id` = `i`.`inventory_id`)))
    join `sakila`.`film` `f` on ((`i`.`film_id` = `f`.`film_id`)))
    join `sakila`.`film_category` `fc` on ((`f`.`film_id` = `fc`.`film_id`)))
         join `sakila`.`category` `c` on ((`fc`.`category_id` = `c`.`category_id`)))
group by `c`.`name`
order by `total_sales` desc;

select distinct high_priority        straight_join sql_big_result sql_cache sql_calc_found_rows concat(`c`.`city`, '','', `cy`.`country`)        AS `store`,
 concat(`m`.`first_name`, '' '', `m`.`last_name`) AS `manager`,
                sum(`p`.`amount`) AS `total_sales`
from (((((((`sakila`.`payment` `p`
    join `sakila`.`rental` `r` on ((`p`.`rental_id` = `r`.`rental_id`)))
    join `sakila`.`inventory` `i` on ((`r`.`inventory_id` = `i`.`inventory_id`)))
    join `sakila`.`store` `s` on ((`i`.`store_id` = `s`.`store_id`)))
    join `sakila`.`address` `a` on ((`s`.`address_id` = `a`.`address_id`)))
    join `sakila`.`city` `c` on ((`a`.`city_id` = `c`.`city_id`)))
    join `sakila`.`country` `cy` on ((`c`.`country_id` = `cy`.`country_id`)))
         join `sakila`.`staff` `m` on ((`s`.`manager_staff_id` = `m`.`staff_id`)))
where `sakila`.`staff`.`staff_id` = 1
   or `sakila`.`staff`.`staff_id` = 2
group by `sakila`.`store`.`store_id`, `sakila`.`country`.`country`, `sakila`.`city`.`city`
having `sakila`.`store`.`store_id` = 1
order by `sakila`.`country`.`country`, `sakila`.`city`.`city` 
limit 4 offset 3
 LOCK IN SHARE MODE;

-- hello
select a.Id, B.Id
from hello.tb1 as a
 straight_join hello.tb1_1 as B
for
update nowait;


select *
from Sakila.actor lock in share mode;
