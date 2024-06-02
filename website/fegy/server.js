"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express = require("express");
var fs = require("fs");
var app = express();
var port = 3000;
function ipLoggingCallback() {
}
function handleRootRequest(req, res) {
    var ip = req.ip; // Get the IP address from the request object
    // Append the IP address to a file
    fs.appendFile('ip_log.txt', ip + '\n', ipLoggingCallback);
    res.sendFile(__dirname + "/index.html");
}
function serverIsRunning() {
    console.log("Server is running on port ".concat(port));
}
app.listen(port, serverIsRunning);
app.get('/', handleRootRequest);
