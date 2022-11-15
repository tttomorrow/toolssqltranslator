CREATE PROCEDURE test_chameleon_procedure (
	IN "number" INTEGER
)
AS
BEGIN
	INSERT
	INTO test_chameleon_table_1
	VALUES ("number", 'test');
END;
/
CREATE PROCEDURE test_chameleon_procedure (
	IN "NUMBER" INTEGER
)
AS
BEGIN
	INSERT
	INTO test_chameleon_table_1
	VALUES ("NUMBER", 'test');
END;
/