## To make the docker instance of mysql 
docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password mysql

## to connect to bash
docker exec -it mysql


## to view all the engines
show engines;

## myisam
create table 
emp_myiam(
    id int primary key  auto_increment,
    name text
) engine = myisam;

## innodb
create table  
emp_myinno( 
    id int primary key  auto_increment,
    name text 
) engine = innodb;