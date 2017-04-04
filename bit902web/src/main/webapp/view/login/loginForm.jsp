<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../js/jquery-3.1.1.js"></script>
</head>
<body>
   
아이디 : <input type="text" id="id" placeholder="아이디를 입력하세요"/><br>
비밀번호 : <input type="password" id="pw" placeholder="비밀번호를 입력하세요"/><br>

<button id="login">로그인</button>
<button id="reg">회원가입</button>

<script>

$("#login").click(function () {
	$.ajax({
		url: "/bit902web/login/login.do",
		type: "POST",
		dataType: "json",
		data: {
			id: $("#id").val(),
			password: $("#pw").val()                                                                               
		}
	}).done(function(result) {
		alert("성공");
	})
});

</script>
</body>
</html>