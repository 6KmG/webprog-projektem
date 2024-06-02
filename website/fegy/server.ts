import express = require('express');
import fs = require('fs')

const app = express();  
const port = 3000;

function ipLoggingCallback(){

}

function handleRootRequest(req: express.Request, res: express.Response) {
    const ip = req.ip; // Get the IP address from the request object

    // Append the IP address to a file
    fs.appendFile('ip_log.txt', ip + '\n', ipLoggingCallback);
    
    res.sendFile(__dirname + "/index.html")
} 

function serverIsRunning(){
    console.log(`Server is running on port ${port}`);
} 


app.listen(port, serverIsRunning);
app.get('/', handleRootRequest);    















