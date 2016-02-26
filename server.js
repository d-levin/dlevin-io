var express = require('express');
var server = express();

var PORT = 3000;

server.get('/', function(req, res) {
  res.send('Hello world!');
});

server.listen(PORT, function() {
  console.log('Server is listening on port ' + PORT)
});
