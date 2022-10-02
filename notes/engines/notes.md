This is nothing but a library that takes care of all the storage of curd operations on the disc

It acts as a backend to the DBMS 

- Mysql and MariaDB allow changing the engine
- Postgres  doesn't allow to change the engine

1. MyISAM
    - This stands for Indexed sequential access method
    - The B-tree indexes point directly to the row  itself
    - No transaction support
    - owned by oracle
    - Inserts and reads are fast
    - updates and deletes are problematic (fragments )
        - if the database crashes then the disc gets corrupted, this needs a disc  repair
    - table level locking
    - MySQL, MariaDB, and Percona (Mysql forks ) all support MyISAM
    - used to be the default engine for MySQL till v5
2. Inno DB
    - B+tree  with indexes pointing to the primary key and the pk points to a row
    - The primary key is mandatory
    - Transactions support
    - The default for MariaDB and MySQL
    - ACID support
    - foreign key support
    - table space (kind of memory management )
    - supports row leave locking
    - spatial operations
    - owned by oracle
3. XtaDB
    - fork of InnoDB
    - was the default engine of MariaDB until 10.1
    - This could not keep up with updates and was unable to compete with Innodb
4. SQLite 
    - Designed by Richard Hipp in 2000
    - It is mainly popular for its use in embedded systems and local database
    - B-tree(LSM as extension )
    - Postgres like syntax
    - Full Acid
    - table locking (no row-level lock )
    - supports concurrent read and writes
    - web  SQL in browsers  use it
    - it is the default database for many OS
    
     
    
5. Aria 
    - created by Michael widens( he started MariaDB and MySQL and after that, he made this Ariya.  my and Mariya are his two daughters’ names )
    - very similar to MyISAM
    - it crashes safe and this is only the difference
    - not owned by Oracle
    - designed for MariaDB (which is a MySQL fork )
    - in MariaDB 10.4 all systems tables are aria
6. Berkeley DB
    - developed by sleepy cat software in 1994 (owned by Oracle)
    - key-value embedded database
    - supports acid transactions, locks replications etc
    - was used in bitcoin core and later switched to level DB
7. level DB
    - written by jeff and Sanjay from google in 2011
    - log-structured merge tree (LSM )(great for SSD inserts )
    - No transactions
    - Inspired by google big table
    - levels of files
        - Memtable
        - Level 0
        - Level 1-6
    - As files grow large levels are merged
    - used in bitcoin core blockchain, AutoCAD, Minecraft
8. Rocks DB 
    - facebook forked it from googles leveldb
    - supports transactional
    - High-performance, multi-threading compaction
    - Provides many features which are not in level db
    - Myrocks for MySQL MariaDB and percona
    - mongorocks for MongoDB
    
     
    
    demo
    
    ```bash
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
    ```