-- update multi-table
UPDATE items
SET items.retail = items.retail * 0.9
WHERE items.id > 10
	AND EXISTS (
		SELECT 1
		FROM waitCopy
	);