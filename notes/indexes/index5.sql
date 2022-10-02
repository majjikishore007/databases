create  table piont(
    a int not null,
    b int not null,
    c int not null,
)

## queries to be checked 


explain analyze select a from piont where a=10;

explain analyze select a from piont where a=10 and b=20;

explain analyze select a from piont where a=10 or c=30;


## when there is no index it gone check Parallel all the rows with Workers thereads


## approach  1
create index a_idx on piont(a);
create index b_idx on piont(b);

## approach 2 (composite index)

create index a_and_b on piont(a,b)

## approach 3 composite + normal 

create index a_and_b on piont(a,b)
create index b_idx on piont(b);




The indexes are used form left to right and hece the thrid way is  more optimised 