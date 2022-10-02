const mysql = require('mysql2/promise');

// create the connection to database

const connect_myisam =async () => {
    try {
        const con =await mysql.createConnection({
            host: 'localhost',
            user: 'root',
            port:3306,
            database: 'test',
            password:"lily"
        });
        await con.beginTransaction();
        await con.query(
            "INSERT INTO emp_myiam (name) values(?)", ["majjikishore"]
        );
        await con.commit()
        await con.close();
    } catch (error) {
        console.log(error);
    }


}
//connect_myisam();

const connect_innodb =async () => {
    try {
        const con =await mysql.createConnection({
            host: 'localhost',
            user: 'root',
            port:3306,
            database: 'test',
            password:"lily"
        });
        await con.beginTransaction();
        await con.query(
            "INSERT INTO emp_myinno (name) values(?)", ["jimmy"]
        );
        const [rows, col] = await con.query("select * from emp_myinno");
        console.log(rows)
        await con.commit()
        await con.close();
    } catch (error) {
        console.log(error);
    }
}
connect_innodb();