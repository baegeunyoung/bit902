<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../../include/baseInclude.jsp" flush="true"></jsp:include>
<script src="../../js/jquery-3.1.1.js"></script>
</head>
<body>

	<div class="wrapper" style="text-align: center;">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="collapse navbar-collapse">

						<h1>Smart Pay</h1><br><br>
						<h2>판매자 페이지</h2>
						<h2>로그인</h2>
						<br>
						
						<div id="success"></div>
						<form name="mForm" action="${pageContext.request.contextPath}/login/login.do" 
							method="post" class="navbar-form navbar-center">
							<div class="form-group  is-empty">
								<input type="text" name="id" placeholder="아이디를 입력하세요" class="form-control">
								<span class="material-input"></span><br>
								<input type="password" name="password" placeholder="비밀번호를 입력하세요" class="form-control"><br>
								<span class="material-input"></span><br>
								<button id="login" class="btn btn-primary pull-center">로그인</button><br>
							</div>
						</form>
						<br>
						<form name="Form" action="/bit902web/view/login/insertSeller.jsp" method="post" class="navbar-form navbar-center">
							<button id="reg" class="btn btn-primary pull-center">회원가입</button>
						</form>
					</div>
				</div>
			</nav>
	</div>

	<%-- <form action="${pageContext.request.contextPath}/login/logout.do" method="post"> --%>
	<!-- <button id="logout">로그아웃</button> -->
	<!-- </form> -->



	<script>
	alert("입력하신 회원정보가 일치하지 않습니다");
// 	$(document).ready(function () {
// 		alert("입력하신 회원정보가 일치하지 않습니다");
// 	})
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