// Dependencies
const express = require('express');
const mysql = require('mysql');

// Global variables
var server = express();

// Connection to local MySQL db
var db = mysql.createConnection({
  host:     '127.0.0.1',
  user:     'root',
  password: 'root',
  database: 'gear_closet'
});

// For local testing
const TESTPORT = 8080;

server.get('/', function(req, res) {
  res.send('Hello world!');
});

server.listen(process.env.PORT || TESTPORT, function() {
  console.log('Server is listening...')
});
