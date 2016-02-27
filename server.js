var express = require('express');
var server = express();

const PORT = 8080;

server.get('/', function(req, res) {
  res.send('Hello world!');
});

server.listen(process.env.PORT || PORT, function() {
  console.log('Server is listening...')
});
