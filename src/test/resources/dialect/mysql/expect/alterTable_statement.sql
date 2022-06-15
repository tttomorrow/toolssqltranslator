ALTER TABLE "testAlterTable1"
	ADD col0 DECIMAL(4, 2)
-- FIRST
;
ALTER TABLE "testAlterTable2"
	ADD (col4 DECIMAL(4, 2), col5 FLOAT);
-- lack of index name
-- too much Column
ALTER TABLE "testAlterTable5"
	ADD INDEX
-- FULLTEXT
"I4"(col4);
ALTER TABLE "testAlterTable6"
	ADD CONSTRAINT "pk_Index" PRIMARY KEY (col1)
-- USING BTREE
;
ALTER TABLE "testAlterTable7"
	ADD UNIQUE (col2);
ALTER TABLE "testAlterTable8"
	ADD CONSTRAINT "Fk_pid2" FOREIGN KEY (col5) REFERENCES parent (id) MATCH SIMPLE ON DELETE CASCADE;
-- err
ALTER TABLE "testAlterTable10"
	ALTER COLUMN "COL5" SET DEFAULT 4;
ALTER TABLE "testAlterTable11"
	DROP col5 , ADD col6 INTEGER NOT NULL
-- FIRST
;
ALTER TABLE "testAlterTable12"
	DROP col6 ,ADD col6 INTEGER NULL DEFAULT 0;
-- CHARACTER SET
-- convert to character set
-- enable keys
-- disable keys
-- discard tablespace
-- import tablespace
-- drop index
-- drop primary key
-- drop foreign key
-- force
ALTER TABLE "testAlterTable" RENAME TO "testAlterTable2";
ALTER TABLE "testAlterTable23"
	DROP col5 ,ADD col5 INTEGER NULL,
	DROP col3 ,ADD col3 INTEGER NULL;
ALTER TABLE "testAlterTable23"  RENAME TO "testAlterTable2";
ALTER TABLE "testAlterTable2"
	DROP col2 ,ADD col2 DOUBLE PRECISION;
ALTER TABLE "testAlterTable24" RENAME TO "testAlterTable";
ALTER TABLE "testAlterTable"
	DROP col2 ,ADD col2 INTEGER;
-- AUTO_INCREMENT
ALTER TABLE "testAlterTable26"
	SET TABLESPACE "TS1"
-- STORAGE DISK
;
ALTER TABLE t27
	ADD PARTITION p3 VALUES LESS THAN (2002);
ALTER TABLE t28
	ADD PARTITION p3 VALUES (7, 8, 9);
ALTER TABLE t29
	DROP PARTITION p2,DROP PARTITION p3;
-- unknown partition keyword
-- unknown partition keyword
ALTER TABLE "testAlterTableHash32"
	TRUNCATE PARTITION p1,TRUNCATE PARTITION p2;
-- unsupported keyword all
-- unknown partition keyword
-- unknown partition keyword
ALTER TABLE e
	EXCHANGE PARTITION ("P0") WITH TABLE e2;
-- unsupported removing partition
-- unsupported upgrading partition
-- partition by