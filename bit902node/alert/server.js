var http = require('http');
var fs = require('fs');

function send404Response(response) {
	response.writeHead(404, {"Content-Type" : "text/plain"});
	response.write("404 Error : oppps!!!");
	response.end();
}

function onRequest(request, response) {
	if(request.method == 'GET' && request.url == '/') {
		fs.readFile("data/Ring05.wav", function (err, data) {
			response.writeHead(200, {"Content-Type" : "audio/mp3"});
			response.end(data);
		});
		response.writeHead(200, {"Content-Type" : "text/html"});
		fs.createReadStream("./index.html").pipe(response);
	} else {
		send404Response(response);
	}
}

http.createServer(onRequest).listen(8888);
console.log("서버가 돕니다");