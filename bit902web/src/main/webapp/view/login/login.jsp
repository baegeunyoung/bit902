<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div id="success"></div>   
<form name="mForm" action="${pageContext.request.contextPath}/login/login.do" method="post">
아이디 : <input type="text" name="id" placeholder="아이디를 입력하세요"/><br>
비밀번호 : <input type="password" name="password" placeholder="비밀번호를 입력하세요"/><br>
<button id="login">로그인</button>
</form>

<form name="Form" action="/bit902web/view/login/insertSeller.jsp" method="post">
<button id="reg">회원가입</button>
</form>


<%-- <form action="${pageContext.request.contextPath}/login/logout.do" method="post"> --%>
<!-- <button id="logout">로그아웃</button> -->
<!-- </form> -->



<script>

// $("#login").click(function () {
// 	$.ajax({
// 		url: "/bit902web/login/login.do",
// 		type: "POST"
		
// 	}).done(function (msg) {
// 		alert(msg);
// 	})
// })

// $("#login").on("click", function () {
// 	$.ajax({
// 		url: "/bit902web/login/login.do",
// 		type: "POST",
// 		dataType: "json",
// 		data: {
// 			id: $("#id").val(),
// 			password: $("#pw").val()                                                                               
// 		}
	
// 	}).done(function (result) {
// 		alert(result.msg);
// 		location.href="/bit902web/index.jsp";
// 	})
// });

</script>
</body>
</html>