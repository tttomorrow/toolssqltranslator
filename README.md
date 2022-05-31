# 问题记录

## 13.2.9 SELECT Statement
>1. SELECT ... INTO Statement无法兼容，MySQL的into_option有OUTFILE、DUMPFILE、var_name,而openGauss是 new_table
>2. openGauss不支持DISTINCTROW、HIGH_PRIORITY、STRAIGHT_JOIN、SQL_SMALL_RESULT、SQL_BIG_RESULT、SQL_BUFFER_RESULT、SQL_CACHE、 SQL_NO_CACHE、 SQL_CALC_FOUND_ROWS、PROCEDURE procedure_name(argument_list)字段
>3. druid不解析PARTITION partition_list字段
>4. 在字段table_references中，MySQL 支持 INNER、CROSS、LEFT [OUTER]、RIGHT [OUTER]、NATURAL、STRAIGHT_JOIN六种join类型，openGauss 不支持 STRAIGHT_JOIN 这种类型，STRAIGHT_JOIN 功能同 JOIN 类似，使用 JOIN 替代

## 13.2.11 UPDATE Statement
> 1. Mysql:ignore关键词  opengauss：无同义词
> 2. Mysql：low_priority关键词 opengauss:无同义词
> 3. index hint转换，需求后置
> 4. optimizer hint转换，需求后置
> 5. MySQL:order by ,limit。 opengauss：无

## 13.1.12 CREATE FUNCTION Statement
> 1. druid不支持解析create function语句中的iterate关键词
> 2. MySQL:DEFINER;openGauss:无
> 3. MySQL:DETERMINISTIC;openGauss：该关键词无效，仅语法兼容 用IMMUTABLE替换
> 4. MySQL:COMMENT;openGauss：无
> 5. MySQL:LANGUAGE SQL;openGauss:无
> 6. druid不支持解析CONTAINS SQL|NO SQL|READS SQL DATA|MODIFIES SQL DATA、SECURITY字段

## 13.1.16 CREATE PROCEDURE Statement 
>1. MySQL存在DEFINER、COMMENT、LANGUAGE SQL、CONTAINS SQL|NO SQL|READS SQL DATA|MODIFIES SQL 字段，openGauss不支持该字段
>2. druid不支持解析SECURITY字段
>3. 用IMMUTABLE替换MySQL的DETERMINISTIC

## 13.1.14 create index
> 1. openGauss 不支持对字符列的前缀建立索引
> 2. 索引类型hash不支持 asc/desc选项
> 3. openGauss 不支持mysql的大部分index options
> 4. 当lock=none，或者algorithm=inplace并且lock=default时，openGauss会指定concurrently关键字。

## 13.1.18 create table
> 1. 数据类型: openGauss 不支持YEAR类型，ENUM和SET类型
> 2. 列定义: 
>   * openGauss 不支持浮点数和大于八个字节的整数自增，可以用bigserial达到整数自增的效果
>   * openGauss 不支持unsigned，目前解决方法是和chameleon一样直接去掉unsigned。
>   * openGauss 不支持指定character set
>   * openGauss 不支持zerofill 和 visible，storage，column format 关键字
>   * openGauss 不支持在建表的时候使用comment和index，只支持单独create comment和index,需要一条sql语句生成多条sql语句来实现。
>   * openGauss 不支持使用as 自动生成的列的值 
>   * openGauss 的collation和MySql 的 collation不兼容
>   * druid 无法识别unique 约束的约束名symbol
>   * openGauss 不支持在建表的时候指定index name，index type和index option
>   * openGauss 不支持enforced关键字
>   * druid 无法识别create procedure 时characteristic中的大部分关键字
> 3. openGauss的根据查询结果创建表和mysql有本质不同，不翻译
> 4. 分区(partition)
>   * 不翻译partition by hash(methodInvokeExpr),hash by list(methodInvokeExpr),hash by range(methodInvokeExpr),generated always as (methodInvokeExpr),openGauss 无法确保expr能够被正确解析.
>   * partition by key(column) 翻译成 partition by hash(column);
>   * openGauss 不支持partition definition 除了tablespace以外的所有关键字 
>   * openGauss partition by 的某些数据类型和mysql有冲突，该需求比较复杂，先后置
>   * openGauss partition name不可以省略,如果省略会报错。 
>   * openGauss 2.1.0版本似乎不满足子分区语法
>   * 对于从句是VALUES LESS THAN的语法格式，openGauss范围分区策略的分区键最多支持4列

## 13.2.2 Delete Statement
> 1. <span style="color:red">OpenGauss不支持多表删除语法，多表删除的SQL无法翻译</span>
> 2. low_priority、quick、ignore关键词不支持
> 3. order by、limit不支持
> 4. optimizer/index hint暂不支持

## 13.2.3 Do Statement
> 1. druid不支持解析此语句
 
## 13.2.5 Insert Statement
> 1. low_priority,delayed,high_priority,ignore关键词不支持
> 2. OpenGauss insert不支持分区

## 13.6.5.6 REPEAT Statement
>1. `end repeat begin_lable;`语句，当有lable时会吞掉行末的分号;

## 13.6.5.3 ITERATE Statement
>1. druid不支持解析此语句；

## 13.1.23 CREATE VIEW Statement
>1. Create View Statement 语句中不能包含 SELECT_INTO 子句，但 druid 无法检测该种错误
>2. druid 无法解析带 FOR_UPDATE_OF 子句的 Select Statement 语句

## 13.1.31 DROP TRIGGER Statement
>1. 该语句在openGauss中需要有ON table_name，而druid的drop trigger无法获取该字段

## 13.1.1 ALTER DATABASE Statement
>1. 该语句openGauss和MySQL无法兼容,MySQL一定要有alter_option才能alter database，openGuass没有任何一个对应的alter_option

## 13.1.10 CREATE DATABASE Statement
>1. 对应openGauss的SCHEMA，MySQL的create_option有 CHARACTER SET或 COLLATE字段，openGauss不支持
## 13.1.3 ALTER FUNCTION Statement
>1. 无法支持，在openGauss中该字段的argtype是必须的，而druid的alter function无法获取该字段。就算可以获取，MySQL的characteristic也只能翻译SECURITY字段

## 13.1.6 ALTER PROCEDURE Statement
>1. openGauss不存在该语句，同时druid也没有该语句的解析

## 13.2.8 REPLACE Statement
>1. openGauss不存在该语句,与其同义的INSERT IGNORE也不存在

## 13.1.5 ALTER LOGFILE GROUP Statement、13.1.14 CREATE LOGFILE GROUP Statement、13.1.25 DROP LOGFILE GROUP Statement
>1. openGauss不存在该语句

## 13.1.2 ALTER EVENT Statement、13.1.12 CREATE EVENT Statement、13.1.23 DROP EVENT Statement
>1. openGauss不存在该语句

## 13.7.6.3 FLUSH Statement
>1. openGauss不存在该语句

## 13.7.1.2 CREATE USER Statement
>1. druid不解析REQUIRE、WITH resource_option、password_option、lock_option字段且openGauss也不支持
>2. openGauss不支持IF EXISTS、auth_plugin字段
>3. openGauss的Account names不需要单引号，且没有host_name的部分，目前解决方法是截取user_name的部分并去除双引号

## 13.7.1.1 ALTER USER Statement
>1. druid不解析REQUIRE、WITH resource_option、lock_option字段，其中lock_option字段openGauss中存在
>2. openGauss不支持IF NOT EXISTS、user()、auth_plugin字段
>3. openGauss的Account names不需要单引号，且没有host_name的部分，目前解决方法是截取user_name的部分并去除双引号
>4. openGauss的password_option字段仅支持 PASSWORD EXPIRE

## 13.1.8 ALTER TABLE STATEMENT
>1. alter add index index_name (key),无法在openGauss上执行，已在openGauss仓库提出issue
>2. alter table 的 change和modify 关键字都翻译成先drop后add的形式
>3. druid 无法识别alter table testAlterTable DEFAULT CHARSET=latin1;
>4. openGauss 不支持 {DISABLE | ENABLE} KEYS  | {DISCARD | IMPORT} TABLESPACE
>5. openGauss 不支持 drop index,primary key,foreign key 以及force，lock,order by,关键字
>6. openGauss 不支持 rename index，支持重名表名字，但是需要分开成两个语句编写。
>7. openGauss 不支持analyze,alterTable,reorganize,rebuild,repair,optimize coalesce,discard,import,removing, upgrading partition
>8. openGauss 不支持alter table .. partition by ..
>9. mysql alter table 指定分区名时，没有表名该分区是分区还是子分区，暂时都默认为分区名。 

## 13.7.1.5 RENAME USER Statement
>1. druid无法解析该语句多个用户同时重命名

## 13.7.2 Table Maintenance Statements
>1. 13.7.2.1 ANALYZE TABLE Statement:openGuass的ANALYZE非临时表不能在一个匿名块、事务块、函数或存储过程内被执行。而MySQL没有此限制。
>2. 其余语句openGauss都不支持
## 13.3.1 START TRANSACTION, COMMIT, and ROLLBACK Statements、13.3.6 SET TRANSACTION Statement
>1. openGauss不支持[AND [NO] CHAIN] [[NO] RELEASE]
>2. openGuass不支持WITH CONSISTENT SNAPSHOT
>3. openGuass不支持GLOBAL、READ UNCOMMITTED

## 13.6.6.3 Cursor FETCH Statement
>1. 不能兼容，MySQL的FETCH有INTO var_name字段，openGauss没有，无法提取的列存储在命名变量中

## 13.6.6.4 Cursor OPEN Statement
>1. openGauss不存在该语句
## 13.6.7 Condition Handling
>1. openGauss不存在该语句

## 13.7.6.6 RESET Statement
>1. 不能兼容

## 13.7.3 Plugin and Loadable Function Statements
>1. openGauss不存在这些语句且druid不解析

## 13.1.16 CREATE SERVER Statement
>1. openGuass 不支持来自 mysql 的create server语句：openGauss仅支持oracle_fdw，mysql_fdw，postgres_fdw，mot_fdw范围内的foreign data wrapper，而mysql端目前来看仅支持名为mysql的foreign data wrapper。因此无法完成迁移。
>2. openGauss 不支持user,password,client_encoding和application_name这些参数。
>3. 翻译后的语句为空句+分号。

## 13.1.6 ALTER SERVER Statement
>1. druid仅支持解析mysql端相关语句中的user这一个参数。如果传入其他参数会报错。
>2. 因openGauss无法支持来自mysql侧的server语句，故取消alter server statment语句的支持。
>3. 翻译后的语句为空句+分号。

## 13.1.27 DROP SERVER Statement
>1. 因openGauss无法支持来自mysql侧的server语句，故取消alter server statment语句的支持。
>2. 翻译后的语句为空句+分号。

## 13.7.1.7 SET PASSWORD Statement、13.7.4.2 SET CHARACTER SET Statement、13.7.4.3 SET NAMES Statement
>1. openGauss不存在语句

## 13.1.21 CREATE TABLESPACE Statement
>1. 无法兼容。且durid代码存在无法解析add datafile的bug，已找到bug原因，考虑向durid仓库提出issue和pull_request修复。

## 13.1.9 ALTER TABLESPACE Statement
>1. 无法兼容。{ADD | DROP} DATAFILE 'file_name' 无法翻译，所以整个语句不支持翻译。

## 13.1.30 DROP TABLESPACE Statement
>1. 不支持指定 engine

## 13.5 Prepared Statements
>1. MySQL通过使用字符串文字来提供语句的文本或将语句文本作为用户变量提供来创建PREPARE语句，两种方式openGauss都不支持，openGauss的PREPARE语句直接指明参数类型
>2. MySQL的EXECUTE语句也需要用到用户变量，openGauss不支持