// Dependencies
const express = require('express');
// MongoDB
const mongoose = require('mongoose');

// Create app with Express
var app = express();

// Database connection
// var database = require('./config/database');
// mongoose.connect(database.url);

// For local testing
const PORT = process.env.PORT || 8080;

// Serve static files
app.use(express.static(__dirname + '/public'));

// Send file on request
app.get('*', function(req, res) {
  res.sendFile('index.html');
});

// Wait for requests
app.listen(PORT, function() {
  console.log('Server is listening...')
});
