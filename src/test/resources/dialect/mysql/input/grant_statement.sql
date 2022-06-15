-- *，不适配
grant all on * to 'usr_replica'@'%';

-- *.*，不适配
grant all on *.* to 'usr_replica'@'%';

-- db.*
-- 与OpenGauss适配的
grant all on delphis.* to 'usr_replica'@'%';
grant alter,create,delete,drop,execute,index,insert,references,select,update,usage on delphis.* to 'usr_replica'@'%' with grant option;
-- 与OpenGauss不适配的
grant alter routine,create routine,create temporary tables,create view,event,lock tables,show view,trigger on delphis.* to 'usr_replica'@'%';

-- db.table
-- 与OpenGauss适配的
grant all on delphis.waitCopy to 'usr_replica'@'%';
grant alter ,delete,drop,index,insert,references ,select,update on delphis.waitCopy to 'usr_replica'@'%' with grant option;
-- 与OpenGauss不适配的
grant create,create view,show view,trigger,usage on delphis.waitCopy to 'usr_replica'@'%';

-- db.table列权限，均适配
grant insert (ID),references (id),select (id),update (id) on delphis.waitCopy to 'usr_replica'@'%';

-- table
grant alter ,delete,drop,index,insert,references ,select,update on waitCopy to 'usr_replica'@'%' with grant option;


-- routine
-- 支持某库下所有routine(函数和存储过程)
grant execute on delphis.* to 'usr_replica'@'%' with grant option;
-- 不支持某一特定函数
grant execute on function delphis.addfunction to 'usr_replica'@'%' with grant option;
grant execute on procedure delphis.addprocedure to 'usr_replica'@'%' with grant option;