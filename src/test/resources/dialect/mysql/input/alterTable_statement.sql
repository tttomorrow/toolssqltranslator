alter table testAlterTable1 ADD COLUMN col0 decimal(4,2) first;

alter table testAlterTable2 ADD COLUMN (col4 decimal(4,2),col5 float);

alter table testAlterTable3 add index (col1) using btree comment 'col1' key_block_size = 128 with parser  p;

alter table testAlterTable4 add key  Index_name (col1,col2);

alter table testAlterTable5 add fulltext index I4 (col4);

alter table testAlterTable6 add  constraint  pk_Id primary key pk_Index using btree (col1);

alter table testAlterTable7 add constraint  unique_constraint  unique index   (col2);

alter table testAlterTable8 add constraint  Fk_pid2 foreign key  (col5) references parent(id) match simple  on delete  cascade;

alter table testAlterTable9 add check(col5 > 0),algorithm = inplace;

alter table testAlterTable10 alter COL5 set default 4;

alter table testAlterTable11 change col5 col6 int not null first;

alter table testAlterTable12 modify col6 int null default 0;

alter table testAlterTable13 default CHARACTER SET=latin1;

alter table testAlterTable14 convert to CHARACTER SET latin1;

alter table testAlterTable15 enable KEYS  ;

alter table testAlterTable16 disable keys ;

alter table testAlterTable17 discard tablespace ;

alter table testAlterTable18 import tablespace ;

alter table testAlterTable19 drop index index_name;

alter table testAlterTable20 drop primary key;

alter table testAlterTable21 drop foreign key fk_pid2;

alter table testAlterTable22 force ;

alter table testAlterTable rename to testAlterTable2;

alter table testAlterTable23 modify col5 int null,modify col3 int null, rename to testAlterTable2, modify col2 double;

alter table testAlterTable24 rename to testAlterTable, modify col2 int;

alter table testAlterTable25 auto_increment = 1;

alter table testAlterTable26 TABLESPACE TS1 storage  disk;

ALTER TABLE t27 ADD PARTITION (PARTITION p3 VALUES LESS THAN (2002));

alter table t28 add partition (partition p3 values in (7,8,9));

alter table t29 drop partition p2,p3;

alter table t30 discard partition all tablespace ;

alter table t31 import partition  all tablespace ;

alter table testAlterTableHash32 truncate partition p1,p2;

alter table testAlterTableHash33 truncate partition all;

ALTER TABLE t34 COALESCE PARTITION 2;

alter table db.table
    reorganize partition pMax
        into (partition p20150201 values less than ('2015-03-01'),
              partition p20150301 values less than ('2015-04-01'),
              partition pMax values less than (maxvalue));

ALTER TABLE e EXCHANGE PARTITION P0 WITH TABLE e2;

ALTER TABLE e remove partitioning ;

ALTER TABLE e upgrade partitioning ;

alter table p1 PARTITION BY RANGE (year_col) (
    PARTITION p0 VALUES LESS THAN (1991),
    PARTITION p1 VALUES LESS THAN (1995),
    PARTITION p2 VALUES LESS THAN (1999)
    );
