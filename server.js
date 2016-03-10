// Dependencies
const express = require('express');
// MySQL
const mysql = require('mysql');
// Logins
const passportLocal = require('passport-local');
const passportFB = require('passport-facebook');
const passportGoogle = require('passport-google-oauth');

// Create app with Express
var app = express();

// Setup the connection string to MySQL
var pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    port: '8889',
    user: 'root',
    password: 'root',
    database: 'mydb'
});

// For local testing
const PORT = process.env.PORT || 3000;

// Test connection to database
// Where should the connection be released?
if (PORT == 3000) {
    pool.getConnection(function(err, connection) {
        if (!err) {
            console.log('MySQL connected! User = ' + connection.threadId);
            connection.query('select * from items', function(err, rows, fields) {
                connection.release();
                console.log('Connection released from query');
                if (!err) {
                    console.log('Listing rows: ', rows);
                } else {
                    console.log('Error when querying');
                }
            });
        } else {
            connection.release();
            console.log('Connection released from failed connection');
            console.log('Connection to MySQL db failed!');
        }
    });
};

// Serve static files
app.use(express.static(__dirname + '/public'));

// Send file on request
app.get('*', function(req, res) {
    res.sendFile('index.html');
});

// Wait for requests
app.listen(PORT, function() {
    console.log('Server is listening on port ' + PORT)
});
