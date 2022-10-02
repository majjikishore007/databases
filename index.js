const {Client}=require('pg')
const app = require('express')();

const clients = {
    "5432": new Client({
        host: "localhost",
        port: 5432,
        password: "psql",
        user: "postgres",
        database:"postgres"
    }),
    "5433": new Client({
        host: "localhost",
        port: 5433,
        password: "psql",
        user: "postgres",
        database:"postgres"
    }),
    "5434": new Client({
        host: "localhost",
        port: 5434,
        password: "psql",
        user: "postgres",
        database:"postgres"
    })
}

app.get('/', (req,res) => {
    res.send("hello");
})

app.listen(8080, () => {
    console.log("server is up and running");
})