var http = require("http");
var fs   = require("fs");
var io   = require("socket.io");

var server = http.createServer(function(request, response) {
	fs.readFile("alert.html", function(err, data) {
		response.writeHead(200, {"Content-Type" : "text/html; charset=UTF-8"});
		response.end(data);
	});
}).listen(8888, function() {
	console.log("서버 구동 시작");
});

var socketIo = io.listen(server);

socketIo.on("connection", function (socket) {
	socket.on("msg", function (data) {
		socketIo.sockets.emit("msg", data);
	});
});
