var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('hello dummy application root');
});

var server = app.listen(process.env.PORT || 3000, function () {
		console.log('Test App listening on port: ' + server.address().port);
});