var http = require('http');
var fs = require('fs');
var io   = require("socket.io");
var socketIo = io.listen(server);

var server = http.createServer(function(request, response) {
	fs.readFile("index.html", function(err, data) {
		response.writeHead(200, {"Content-Type": "text/html; charset=UTF-8"});
		response.end(data);
	});
})
.listen(8888, function () {
  console.log("서버 구동 시작...");
});

function send404Response(response) {
	response.writeHead(404, {"Content-Type" : "text/plain"});
	response.write("404 Error : oppps!!!");
	response.end();
}

function onRequest(request, response) {
	if(request.method == 'GET' && request.url == '/') {
		response.writeHead(200, {"Content-Type" : "text/html"});
		fs.createReadStream("./index.html").pipe(response);
	} else {
		send404Response(response);
	}
}

	socketIo.sockets.on("connection", function (socket) {
		  alert("d");
		});