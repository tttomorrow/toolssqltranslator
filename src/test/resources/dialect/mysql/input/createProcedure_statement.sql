create  definer = root procedure p1 (in id int,out res int,inout a int) deterministic
    language sql contains sql sql security INVOKER
begin
    select count(id) into res from data where data.id > id;

end;

create   definer = root procedure p2 ()
    language sql contains sql sql security DEFINER
begin
   create table data2(id int);
end;

create   procedure p3 () deterministic
    language sql contains sql
begin
DROP TABLE IF EXISTS data1 RESTRICT;
end;

create   procedure p4 () deterministic
    language sql contains sql
begin
ALTER TABLE testAlterTable1
	ADD col0 decimal(4, 2);
end;

create   procedure p5 () deterministic
    comment 'good'
begin
update  data
set data.id = data.id*1.2;
end;
