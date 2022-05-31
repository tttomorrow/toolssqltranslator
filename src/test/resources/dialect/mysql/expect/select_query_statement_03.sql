SELECT a.id, b.id
FROM hello.tb1 a
	JOIN hello.tb1_1 b
FOR UPDATE NOWAIT;