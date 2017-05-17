<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<style>
input:-ms-input-placeholder {
	opacity: 0.3;
}

input::-webkit-input-placeholder {
	opacity: 0.3;
}

input::-moz-placeholder {
	opacity: 0.3;
}

input::-moz-placeholder {
	opacity: 0.3;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../../include/baseInclude.jsp" flush="true"></jsp:include>
</head>
<body>
	<div class="wrapper" style="text-align: center;">
		<div class="container-fluid">
			<br>
			<br>
			<a href="${pageContext.request.contextPath}/main/main.do" class="simple-text">
				<img src="/bit902web/img/orderthere.png" width="400px"/>
			</a>
			<br>

			<div id="success"></div>
			<form name="mForm" action="${pageContext.request.contextPath}/login/login.do" method="post" class="navbar-form navbar-center">
				<div class="form-group is-empty">
					<div class="form-group">
						<input type="text" name="id" placeholder="아이디를 입력하세요"class="form-control" style="margin-bottom: 10px;">
						<span class="material-input"></span><br>
					</div>
					<br>
					<div class="form-group">
						<input type="password" name="password" placeholder="비밀번호를 입력하세요" class="form-control" style="margin-bottom: 10px;">
						<span class="material-input"></span><br>
					</div>
					<br>
					<button id="login" class="btn btn-primary pull-center">로그인</button>
					<a href="${pageContext.request.contextPath}/login/joinForm.do" role='button' class="btn btn-primary pull-center">회원가입</a>
				</div>
			</form>
		</div>
	</div>
	<script>
		swal("로그인 정보가 잘못되었습니다.");
	</script>
</body>
</html>
