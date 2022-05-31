CREATE TABLE test1 (
	id BIGSERIAL PRIMARY KEY,
	name CHAR(2) NOT NULL UNIQUE DEFAULT 'GA'
-- COMMENT 'char'
-- COLUMN_FORMAT fixed
-- STORAGE DISK

);
CREATE TABLE testIndexKey (
	id INTEGER,
	name CHAR(2)
-- INDEX idIndex USING BTREE()

-- KEY nameIndex USING HASH (name)

);
CREATE TABLE testIndexKey (
	id INTEGER,

-- INDEX idIndex USING BTREE()
name CHAR(2)
-- KEY nameIndex USING HASH (name)

);
CREATE TABLE testPrimaryUniqueKey (
	id INTEGER,
	name CHAR(2),
	parent_id INTEGER,
	CONSTRAINT pk_id PRIMARY KEY (id)
-- USING BTREE
,
	col3 INTEGER,
	UNIQUE
-- UNIQUE_CONSTRAINT
(name),
	col4 INTEGER,
	CONSTRAINT fk_pid FOREIGN KEY (parent_id) REFERENCES parent (id) MATCH SIMPLE ON DELETE CASCADE,
	col5 INTEGER,
	CONSTRAINT ck_con CHECK (id > 0)
--  NOT ENFORCED

);
CREATE TABLE testIndexKey (
	id INTEGER,
	name CHAR(2),
	t TEXT,

-- INDEX id_index USING btree()

-- KEY name_key USING hash (name)
col4 INTEGER
-- FULLTEXT INDEX test_index()

);