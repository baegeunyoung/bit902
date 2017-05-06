var http = require("http");
var fs   = require("fs");
var io   = require("socket.io");

var server = http.createServer(function(request, response) {
	  fs.readFile("index.html", function(err, data) {
	    response.writeHead(200, {"Content-Type": "text/html; charset=UTF-8"});
	    response.end(data);
	  });
	})
	.listen(8888, function () {
	  console.log("서버 구동 시작...");
	});

// 소켓 IO 객체 생성 및 구동
var socketIo = io.listen(server);
var idArr = [];
socketIo.on("connection", function (socket) {
	
	// 마지막 접속한 사용자의 소켓 구분 아이디를 저장
	socket.on("login", function (loginId) {
	console.log("접속한 회원 정보 : " + loginId, socket.id);
	// 입력한 아이디와 socket.id를 연결
	idArr[loginId] = socket.id;
	});

	socket.on("msg", function (data) {
		if(data.loginId.length > 10) {
			socketIo.to(idArr[data.recvId])
			.emit("msg", "주문이 들어왔습니다.");
		}
	});
});
