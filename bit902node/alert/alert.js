var http = require("http");
var fs   = require("fs");
var io   = require("socket.io");

var server = http.createServer(function(request, response) {
  fs.readFile("alert.html", function(err, data) {
    response.writeHead(200, {"Content-Type": "text/html; charset=UTF-8"});
    response.end(data);
  });
})
.listen(8888, function () {
  console.log("서버 구동 시작...");
});

// 소켓 IO 객체 생성 및 구동
var socketIo = io.listen(server);

socketIo.on("connection", function (socket) {
  socket.on("echo", function (data) {
    console.log("클라이언트 전송 데이터 : " + data);
    socket.emit("serverEcho", data);
  });
});
