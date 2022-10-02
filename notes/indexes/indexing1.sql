## analyze the queryes 

## when the table has no primary keys 

explain analyze select id from employee where id=100;

/*
explain analyze select id from employe where id=100;
                                                      QUERY PLAN                                                      
----------------------------------------------------------------------------------------------------------------------
 Gather  (cost=1000.00..12578.44 rows=1 width=4) (actual time=0.659..57.856 rows=1 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Seq Scan on employe  (cost=0.00..11578.34 rows=1 width=4) (actual time=30.612..47.749 rows=0 loops=3)
         Filter: (id = 100)
         Rows Removed by Filter: 333333
 Planning Time: 0.115 ms
 Execution Time: 57.893 ms
(8 rows)
*/


## when the table is altered with a pk

alter table employe add primary key(id);


explain analyze select id from employe where id=10;
/*
                                                        QUERY PLAN                                                         
---------------------------------------------------------------------------------------------------------------------------
 Index Only Scan using employe_pkey on employe  (cost=0.42..8.44 rows=1 width=4) (actual time=0.062..0.063 rows=1 loops=1)
   Index Cond: (id = 10)
   Heap Fetches: 1
 Planning Time: 0.303 ms
 Execution Time: 0.083 ms
(5 rows)

*/