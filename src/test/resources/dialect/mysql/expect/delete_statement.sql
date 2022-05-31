DELETE
-- LOW_PRIORITY IGNORE QUICK
FROM testFunction PARTITION (p1)
WHERE id > 1
-- ORDER BY id
-- LIMIT 1
;
--  Delete Multiple-Table Syntax
--  Delete Multiple-Table Syntax
-- err