## Generate a random string using MD5():


SELECT MD5(random()::text);
 
/* Result:
md5
text
-------------------------------------
5815789cc68c2c4a8a46e31c72f0a327
*/
## Generate a Capital Latter random string, size of 15:


SELECT array_to_string(ARRAY(SELECT chr((65 + round(random() * 25)) :: integer) 
FROM generate_series(1,15)), '');
 
/* Result:
array_to_string
text
-------------------
ZPGVXSNNTWFBMDY
*/
## Generate a Small Latter random string, size of 15:


SELECT array_to_string(ARRAY(SELECT chr((97 + round(random() * 25)) :: integer) 
FROM generate_series(1,15)), '');
 
/* Result:
array_to_string
text
-----------------
ohmqjtxxqbtqinq
*/
##Generate a Numerical random string, size of 15:


SELECT array_to_string(ARRAY(SELECT chr((48 + round(random() * 9)) :: integer) 
FROM generate_series(1,15)), '');
 
/* Result:
array_to_string
text
-----------------
132443402808481
*/
##Generate a random string with all combinations, size of 15:


SELECT array_to_string(ARRAY(SELECT chr((48 + round(random() * 59)) :: integer) 
FROM generate_series(1,15)), '');
 
/* Result:
array_to_string
text
-----------------
`E07
*/


insert into grades (g,
name  ) 
select 
random()*100,
substring(md5(random()::text ),0,floor(random()*31)::int)
 from generate_series(0, 500);