 UPDATE low_priority ignore 
 /* NO_MERGE(discounted) */ items use index for order by (idx_name) partition (p0),
                
    (SELECT id FROM items 
    WHERE retail / wholesale >= 1.3 AND quantity < 100) 
    AS discounted 
    SET items.retail = items.retail * 0.9 
    WHERE items.id = discounted.id 
    and  exists (select 1 from waitCopy) 
    order by item.id 
    limit 6;

 UPDATE items
 SET items.retail = items.retail * 0.9
 WHERE items.id > 10
   and  exists (select 1 from waitCopy);