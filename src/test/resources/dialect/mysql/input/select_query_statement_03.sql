-- hello
select a.id, b.id
from hello.tb1 as a straight_join hello.tb1_1 as b for
update nowait;