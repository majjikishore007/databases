## creating the table 
create table 
student(
    id serial primary key not null,
    name text,
    grade int
)

## inserting 1m records into the table 

insert into 
student (
    name,
    grade 
) 
select 
substring(md5(random()::text ),0,floor(random()*31)::int),
random()*100 
from generate_series(0, 1000000);;


## indexing the table and including a no-key column_name

create index grade_index_new on student(grade) include (id);


## seq scan 

/*
explain select name from student where id > 100;
                           QUERY PLAN                            
-----------------------------------------------------------------
 Seq Scan on student  (cost=0.00..19238.01 rows=999900 width=15)
   Filter: (id > 100)
(2 rows)
*/

## index scan
/*
explain select name from student where id =100;
                                 QUERY PLAN                                  
-----------------------------------------------------------------------------
 Index Scan using student_pkey on student  (cost=0.42..8.44 rows=1 width=15)
   Index Cond: (id = 100)
(2 rows)
*/



## bitmap scan 


/*
explain select name from student where grade > 84;
                                      QUERY PLAN                                      
--------------------------------------------------------------------------------------
 Bitmap Heap Scan on student  (cost=2882.14..11539.04 rows=153512 width=15)
   Recheck Cond: (grade > 84)
   ->  Bitmap Index Scan on grade_index_new  (cost=0.00..2843.77 rows=153512 width=0)
         Index Cond: (grade > 84)
(4 rows)
*/