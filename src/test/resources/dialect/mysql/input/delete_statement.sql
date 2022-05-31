delete low_priority quick ignore 
from testFunction partition (p1) 
where id>1 
order by id 
limit 1;
delete t1,t2 
from t1 left join t2 on t1.id=t2.id 
where t1.id<5; 

delete t1,t2 
from t1 join t2 using(`id`) 
where t1.id<5;

delete from  t1,t2 
using t1 join t2 using(`id`) 
where t1.id<5;