CREATE
-- DEFINER 'root'@'%'
FUNCTION doIterate(
		p INTEGER,
		q INTEGER
	)
	RETURNS INTEGER IMMUTABLE
	AS $$
	DECLARE x INTEGER DEFAULT 5;
	BEGIN
		<<label1>>LOOP
			p := p - 1;
			INSERT
			INTO testFunction
			VALUES (DEFAULT, concat('a', p));
			IF p < 10 THEN
				EXIT label1;
			END IF;
		END LOOP label1;
		WHILE x > 0 LOOP
			x := x - 1;
		END LOOP;
		LOOP
			x := x - 1;
			IF x > 10 THEN
				EXIT;
			END IF;
		END LOOP;
		CASE x
		WHEN 10 THEN
			x := 100;
		WHEN 11 THEN
			x := 110;
		ELSE
			x := 120;
		END CASE;
	RETURN x;
END;
$$language plpgsql;