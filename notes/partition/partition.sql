## creating a table grades 
create  table 
grades(
    id serial not null,
    g int not null
);
## inserting 1m  rows into it 

insert into grades(g)
select floor(random()*100) 
from generate_series(0,1000000);

## creating table grades and making it partition 
create table 
grades_p(
    id serial not null,
    g int not null
) 
partition by range(g)

## creating parts
##00- 35
create table g0035 
(like grades_p including indexes)
##35-60
create table g3560 
(like grades_p including indexes)
##60-80
create table g6080 
(like grades_p including indexes)
##80-100
create table g80100 
(like grades_p including indexes)


## attaching the partition to main table

alter table grades_p attach partition g0035 for values from (0) to (35)
alter table grades_p attach partition g3506 for values from (35) to (60)
alter table grades_p attach partition g6080 for values from (60) to (80)
alter table grades_p attach partition g80100 for values from (80) to (100)


## inserting form the grades to grades_p

insert into grades_p select * from grades;

## creating the index for all the tabes 

create index grades_p_idx on grades_p(g);

## quering the indexes 

explain analyze select count(*) from grades_p where g=30;


select pg_relation_size(oid), relname from pg_class order by pg_relation_size(oid) desc;
##
show ENABLE_PARTITION_PRUNING;

## if this is off then the making partition is useless