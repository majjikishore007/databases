## creating an employee table 

create table 
employee(
    id serial not null,
    name text
);

## population data of 1 million 

insert into
employee(name)
SELECT array_to_string(ARRAY(SELECT chr((48 + round(random() * 59)) :: integer) 
FROM generate_series(1,15)), '')
FROM generate_series(0,1000000);

## creataing indexes 
## refer to the postges docs
/*
CREATE [ UNIQUE ] INDEX [ CONCURRENTLY ] [ [ IF NOT EXISTS ] name ] 
        ON [ ONLY ] table_name [ USING method ]
    ( { column_name | ( expression ) } [ COLLATE collation ]
     [ opclass [ ( opclass_parameter = value [, ... ] ) ] ]
     [ ASC | DESC ] [ NULLS { FIRST | LAST } ] [, ...] )
    [ INCLUDE ( column_name [, ...] ) ]
    [ WITH ( storage_parameter [= value] [, ... ] ) ]
    [ TABLESPACE tablespace_name ]
    [ WHERE predicate ]

*/





