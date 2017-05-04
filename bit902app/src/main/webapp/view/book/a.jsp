<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="http://14.32.66.123:8888/socket.io/socket.io.js"></script>
	<script>
		
		var socket = io.connect();
		var loginId = ${seller.sellerNo};
	
		socket.emit("login", loginId);
		var recvId = loginId;
		alert("recvId : " + recvId);
		alert("login : " + loginId);
		console.log(loginId);
		console.log(recvId);
		socket.emit("msg", {recvId: recvId, sendId: loginId, msg: $("#msg").val()});
		socket.on("msg", function(data) {
			alert(data);
		});
		
	</script>
</body>
</html>