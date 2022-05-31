create unique index i1 using btree  on t9(col1,col2,col3) ;
create index i2 on t10(col2(10)ASC) using hash comment 'i2' algorithm = inplace lock = default ;

create index i3 on t10(col2(10)DESC)using btree algorithm = inplace;
create index i4 on t10(col2) lock = none;