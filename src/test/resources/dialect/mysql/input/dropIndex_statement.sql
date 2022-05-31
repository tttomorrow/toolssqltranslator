drop index i5 on testDropIndex algorithm = INPLACE  lock = default;
drop index i5 on testDropIndex lock = none;
drop index `PRIMARY` on testDropIndex;
drop index i5 on testDropIndex algorithm = default lock = default;
drop index i5 on testDropIndex algorithm = COPY lock = shared;