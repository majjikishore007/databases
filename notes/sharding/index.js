const { Client } = require('pg')
const ConsistentHash=require('consistent-hash')
const app = require('express')();
const crypto = require('crypto');
const cors = require('cors')


const PORT = 8081;
const hr=new ConsistentHash()
hr.add("5432")
hr.add("5433")
hr.add("5434")

app.use(cors({
    origin: "*"
}))

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

const connnect = async() => {
    await clients[5432].connect();
    await clients[5433].connect();
    await clients[5434].connect();
}

app.get('/', (req,res) => {
    res.send("hello");
})
app.post('/post', async(req, res) => {
    
   try {
    const url = req.query.url;
    const hash = crypto.createHash("sha256").update(url).digest('base64');
    // getting the first 5 char of the string to use it as  key 
    // the key is used to get the server name to query by constient-hashing 
    const urlID = hash.substring(0, 5);
    
    //hr gives the server to query by doing all the constient-hashing 
    const server = hr.get(urlID);
    const result =await clients[server].query("INSERT INTO url_table (url,url_id) VALUES ($1,$2)", [url, urlID]);
    console.log(result);
       res.send({
        "hash": hash,
        "urlID": urlID,
        "server":server
    })
   } catch (error) {
    console.log(error);
   } 
})
app.listen(PORT, () => {
    console.log("server is up and running on port :",PORT);
})