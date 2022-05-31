revoke all on *.* from 'mysql_test'@'%';

revoke all on mysql_database.* from 'mysql_test'@'%';

revoke alter,create,delete,drop,execute,index,insert,references,select,update,usage on mysql_database.* from 'mysql_test'@'%';

revoke alter routine,create routine,create temporary tables,create view,event,lock tables,show view,trigger on mysql_database.* from 'mysql_test'@'%';

revoke alter routine,create routine,create temporary tables,create view,event,lock tables,show view,trigger on mysql_database.* from 'mysql_test'@'%';

revoke all on mysql_database.testRevoke from 'mysql_test'@'%';

revoke alter ,delete,drop,index,insert,references ,select,update on mysql_database.testRevoke from 'mysql_test'@'%';

revoke insert (id),references (id),select (id),update (id) on mysql_database.testRevoke from 'mysql_test'@'%';

revoke alter ,delete,drop,index,insert,references ,select,update on testRevoke from 'mysql_test'@'%';

revoke execute on mysql_database.* from 'mysql_test'@'%' ;

revoke execute on function mysql_database.hello from 'mysql_test'@'%';
revoke execute on procedure mysql_database.hello from 'mysql_test'@'%';

REVOKE ALL , GRANT OPTION FROM 'mysql_test'@'%';