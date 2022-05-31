create table testDataType( 
    id1 TINYINT auto_increment primary key , 
    id2 SMALLINT, 
    id3 MEDIUMINT, 
    id4 INT,
    id5 bigint(15),
    id6 int(15), 
 
    id7 FLOAT, 
    id8 DOUBLE, 
    id9 FLOAT(4,2) ,
    id10 DOUBLE(4,2), 
    id11 REAL(4,2), 
 
    id12 TIME, 
    id13 TIME(4), 
    id14 DATE, 
    id15 DATETIME, 
    id16 DATETIME(4), 
    id17 TIMESTAMP, 
 
    id18 CHAR(20) CHARACTER SET utf8 COLLATE utf8_bin, 
    id19 varchar(5), 
 
    id20 BINARY(5), 
    id21 VARBINARY(5), 
 
    id22 TINYTEXT, 
    id23 TEXT, 
    id24 MEDIUMTEXT, 
    id25 LONGTEXT, 
 
    id26 TINYBLOB, 
    id27 BLOB, 
    id28 MEDIUMBLOB, 
    id29 LONGBLOB,

    id30 bit(4),
    id31 year(4),
    id32 bool,
    id33 boolean,

    id34 geometry,
    id35 point,
    id36 linestring,
    id37 polygon,
    id38 multipoint,
    id39 geometrycollection,
    id40 multilinestring,
    id41 multipolygon,
    id42 json
    );

create table testDataType2(
    id1 float(4,2) auto_increment primary key
);