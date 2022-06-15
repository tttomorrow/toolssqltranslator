create table testlike10 like testlike2;
CREATE TABLE t1 (col1 INT, col2 CHAR(5))
    PARTITION BY HASH(col1)(partition p1,partition p2);
CREATE TABLE t2 (col1 INT, col2 CHAR(5), col3 DATETIME)
    PARTITION BY linear HASH ( YEAR(col3) );
CREATE TABLE t3 (col1 INT, col2 CHAR(5), col3 DATETIME)
    PARTITION BY KEY ( col3,col2 )
        PARTITIONS 4;
CREATE TABLE t4 (col1 INT, col2 CHAR(5), col3 DATE)
    PARTITION BY KEY(col3)
        partitions 2(
        partition p1 tablespace ts1,
        partition p2 tablespace ts1
        );
CREATE TABLE t5 (
                    year_col  INT,
                    some_data INT,
                    col3      date
)
    PARTITION BY RANGE (year(col3)) (
        PARTITION p0 VALUES LESS THAN (1991),
        PARTITION p1 VALUES LESS THAN (1995),
        PARTITION p2 VALUES LESS THAN (1999),
        PARTITION p3 VALUES LESS THAN (2002),
        PARTITION p4 VALUES LESS THAN (2006),
        PARTITION p5 VALUES LESS THAN MAXVALUE
        );
CREATE TABLE t6 (
                    a INT NOT NULL,
                    b INT NOT NULL
)
    PARTITION BY RANGE COLUMNS(a,b) (
        PARTITION p0 VALUES LESS THAN (10,5),
        PARTITION p1 VALUES LESS THAN (20,10),
        PARTITION p2 VALUES LESS THAN (50,MAXVALUE),
        PARTITION p3 VALUES LESS THAN (65,MAXVALUE),
        PARTITION p4 VALUES LESS THAN (MAXVALUE,MAXVALUE)
        );
CREATE TABLE t7 (
                    a INT NOT NULL,
                    b INT NOT NULL,
                    c INT NOT NULL,
                    d INT NOT NULL,
                    E INT NOT NULL
)
    PARTITION BY RANGE COLUMNS(a,b,c,d,e) (
        PARTITION p0 VALUES LESS THAN (10,5,MAXVALUE,MAXVALUE,MAXVALUE ),
        PARTITION p1 VALUES LESS THAN (20,10,MAXVALUE,MAXVALUE,MAXVALUE ),
        PARTITION p2 VALUES LESS THAN (50,MAXVALUE,MAXVALUE,MAXVALUE,MAXVALUE ),
        PARTITION p3 VALUES LESS THAN (65,MAXVALUE,MAXVALUE,MAXVALUE,MAXVALUE ),
        PARTITION p4 VALUES LESS THAN (MAXVALUE,MAXVALUE,MAXVALUE,MAXVALUE,MAXVALUE )
        );
CREATE TABLE t8 (
                    id INT NOT NULL PRIMARY KEY,
                    name VARCHAR(20)
)
    PARTITION BY KEY()
        PARTITIONS 2;
CREATE TABLE client_firms (
    id   INT,
    name VARCHAR(35)
)
PARTITION BY LIST (id) (
    PARTITION r0 VALUES IN (1, 5, 9, 13, 17, 21),
    PARTITION r1 VALUES IN (2, 6, 10, 14, 18, 22),
    PARTITION r2 VALUES IN (3, 7, 11, 15, 19, 23),
    PARTITION r3 VALUES IN (4, 8, 12, 16, 20, 24)
);
CREATE TABLE t9 (col1 INT, col2 CHAR(5), col3 DATE)
    PARTITION BY KEY(col3)
        (
        partition p1 tablespace = ts1 comment = 'p1' ,
        partition p2 tablespace = ts1 comment = 'p2'
        );
create table testTableOptions(
    id int,
    name char(2)
)tablespace  ts1,
    password  = 'string',
    AUTO_INCREMENT=1,
    AVG_ROW_LENGTH=1,
    CHARACTER SET='utf8',
    CHECKSUM=0,
    COMMENT='string',
    COMPRESSION ='NONE',
    CONNECTION = 'connect_string',
    data DIRECTORY = 'absolute path to directory',
    DELAY_KEY_WRITE = 0,
    ENCRYPTION ='Y',
    ENGINE = 'engine_name',
    INSERT_METHOD = NO ,
    KEY_BLOCK_SIZE =1,
    MAX_ROWS = 1,
    MIN_ROWS = value,
    PACK_KEYS=0,
    ROW_FORMAT =DEFAULT ,
    STATS_AUTO_RECALC =DEFAULT,
    STATS_PERSISTENT =DEFAULT,
    STATS_SAMPLE_PAGES =1;

create table t10 (
    col1 INT primary key,
    constraint constraint_name  foreign key (col1) references table2 (col1) match partial on update set null,
    constraint constraint_name1 primary key indexname1 (col1) COMMENT 'string',
    constraint constraint_name2 unique  indexname2 using btree(col1),
     INDEX idIndex USING BTREE (col1),
    KEY  nameIndex USING HASH (name),
    fulltext index(col1),
    CONSTRAINT W_CONSTR_KEY2 CHECK(col1 > 0 AND col2 IS NOT NULL),
    col3 char(1))
    tablespace h1 compression='NONE';

create table t11 (
    col1 INT primary key not null default 1,
    col2 int auto_increment unique comment 'string' collate utf8_bin column_format fixed storage disk,
    col3 int generated always as (CONCAT(first_name,' ',last_name)) virtual);

CREATE TABLE t12 (id INT, purchased DATE)
    PARTITION BY RANGE(id)
    SUBPARTITION BY HASH( TO_DAYS(purchased) )
    SUBPARTITIONS 2 (
        PARTITION p0 VALUES LESS THAN (1990)(
            SUBPARTITION s01,
            SUBPARTITION s02
            ),

        PARTITION p1 VALUES LESS THAN (2000)(
            SUBPARTITION s11,
            SUBPARTITION s12
            ),
        PARTITION p2 VALUES LESS THAN MAXVALUE(
            SUBPARTITION s21,
            SUBPARTITION s22
            )
    );

CREATE TABLE t13 (id INT, purchased int )
    PARTITION BY RANGE( id )
    SUBPARTITION BY HASH( purchased )
    SUBPARTITIONS 2 (
        PARTITION p0 VALUES LESS THAN (1990),
        PARTITION p1 VALUES LESS THAN (2000),
        PARTITION p2 VALUES LESS THAN MAXVALUE
    );

CREATE TABLE t14 (id INT, purchased int)
    PARTITION BY RANGE( id )
    SUBPARTITION BY KEY ( id,purchased) (
        PARTITION p0 VALUES LESS THAN (1990) (
            SUBPARTITION s0,
            SUBPARTITION s1
        ),
        PARTITION p1 VALUES LESS THAN (2000) (
            SUBPARTITION s2,
            SUBPARTITION s3
        ),
        PARTITION p2 VALUES LESS THAN MAXVALUE (
            SUBPARTITION s4,
            SUBPARTITION s5
        )
    );

CREATE TABLE t15 (id INT, purchased int)
    ENGINE = MYISAM
    PARTITION BY RANGE( purchased )
        SUBPARTITION BY HASH( purchased) (
        PARTITION p0 VALUES LESS THAN (1990) (
            SUBPARTITION s0
                DATA DIRECTORY = '/disk0/data'
                INDEX DIRECTORY = '/disk0/idx'
                comment = "ts1"
                tablespace = ts1,
            SUBPARTITION s1
                DATA DIRECTORY = '/disk1/data'
                INDEX DIRECTORY = '/disk1/idx'
                tablespace = ts1
            ),
        PARTITION p1 VALUES LESS THAN (2000) (
            SUBPARTITION s2
                DATA DIRECTORY = '/disk2/data'
                INDEX DIRECTORY = '/disk2/idx'
                tablespace = ts1,
            SUBPARTITION s3
                DATA DIRECTORY = '/disk3/data'
                INDEX DIRECTORY = '/disk3/idx'
                tablespace = ts1
            ),
        PARTITION p2 VALUES LESS THAN MAXVALUE (
            SUBPARTITION s4
                DATA DIRECTORY = '/disk4/data'
                INDEX DIRECTORY = '/disk4/idx'
                tablespace = ts1,
            SUBPARTITION s5
                DATA DIRECTORY = '/disk5/data'
                INDEX DIRECTORY = '/disk5/idx'
                tablespace = ts1
            )
        );
