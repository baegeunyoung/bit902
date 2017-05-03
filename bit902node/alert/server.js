var http = require("http");
var fs   = require("fs");
var io   = require("socket.io");

var server = http.createServer(function(request, response) {

})
.listen(8888, function () {
	console.log("서버 구동 시작...");
});

// 소켓 IO 객체 생성 및 구동
var socketIo = io.listen(server);
var idArr = [];
socketIo.on("connection", function (socket) {
	
	// 마지막 접속한 사용자의 소켓 구분 아이디를 저장
	socket.on("login", function (sNo) {
	console.log("접속한 회원 정보 : " + sNo, socket.id);
	// 입력한 아이디와 socket.id를 연결
	idArr[loginId] = socket.id;
	});

	socket.on("sNo", function (sNo) {
		socketIo.to(idArr[sNo.recvId])
		.emit("sNo", sNo.sendId + sNo.sNo);
	});
});
