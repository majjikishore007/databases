## incuding the non-key coulum for making index only serarch 

create table students (
id serial primary key, 
 g int,
 firstname text, 
lastname text, 
middlename text,
address text,
 bio text,
dob date,
id1 int,
id2 int,
id3 int,
id4 int,
id5 int,
id6 int,
id7 int,
id8 int,
id9 int
); 
s

vacuum (analyze, verbose, full);
/*
explain (analyze,buffers)  select * from students where g >20   and g < 30;
                                                         QUERY PLAN                                                         
----------------------------------------------------------------------------------------------------------------------------
 Bitmap Heap Scan on students  (cost=107.67..18238.68 rows=5000 width=208) (actual time=24.427..198.822 rows=89563 loops=1)
   Recheck Cond: ((g > 20) AND (g < 30))
   Heap Blocks: exact=18920
   Buffers: shared read=19168 written=12988
   ->  Bitmap Index Scan on g_ind  (cost=0.00..106.42 rows=5000 width=0) (actual time=17.952..17.953 rows=89563 loops=1)
         Index Cond: ((g > 20) AND (g < 30))
         Buffers: shared read=248
 Planning Time: 0.194 ms
 Execution Time: 203.926 ms
(9 rows)


explain (analyze,buffer)  select id,g from students where g > 80 and g < 95 order by g;
*/