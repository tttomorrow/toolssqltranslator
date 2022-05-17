create  
definer = 'root'@'%' 
FUNCTION doIterate(p int,q int) 
returns int 
deterministic 
begin 
    declare x INT default 5; 
 
    label1: LOOP 
        set p=p-1;
        insert into testFunction values( 
                                           default,concat('a',p) 
                                       ); 

        if p<10 then 
            leave label1; 
        end if; 
    end loop label1; 
 
 
    while x>0 do 
        set x=x-1; 
    end while; 
 
    repeat 
        set x=x-1;
    until  x>10 end repeat; 
 
    case x 
    when 10 then set x=100; 
    when 11 then set x=110; 
    else 
        set x=120; 
        end case; 
 
    return x; 
end;