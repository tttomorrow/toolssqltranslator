create procedure test_chameleon_procedure(in number int)
begin
insert into test_chameleon_table_1 values(number,"test");
end;
create procedure test_chameleon_procedure(in NUMBER int)
begin
insert into test_chameleon_table_1 values(NUMBER,"test");
end;