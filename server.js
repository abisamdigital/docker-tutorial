var http = require('http');

http.createServer(function (req, res) {
  res.write("Hi The Bureau!");
  res.end();
}).listen(8000);
