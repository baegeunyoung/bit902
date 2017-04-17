<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
</head>
<body>



	<%
		if (session.getAttribute("id") == null) {
	%>
	<!-- 메뉴 -->
	<div class="wrapper">
		<div>
			<c:import url="/include/sidebar.jsp" />
		</div>
		<div class="main-panel">

			<!-- 로그인 -->
			<div class="wrapper">
				<div class="main-panel">
					<nav class="navbar navbar-transparent navbar-absolute">
					<div class="container-fluid">
						<div class="collapse navbar-collapse">

							<h4>로그인</h4>

							<div id="success"></div>
							<form name="mForm" action="${pageContext.request.contextPath}/login/login.do" method="post" class="navbar-form navbar-center">
								<div class="form-group  is-empty">
									<input type="text" name="id" placeholder="아이디를 입력하세요"	class="form-control">
									<span class="material-input"></span><br>
									<input type="password" name="password"placeholder="비밀번호를 입력하세요" class="form-control">
									<span class="material-input"></span><br>
									<button id="login" class="btn btn-primary pull-center">로그인</button>
									<br>
								</div>
							</form>

							<form name="Form" action="/bit902web/view/login/insertSeller.jsp" method="post" class="navbar-form navbar-center">
								<button id="reg" class="btn btn-primary pull-center">회원가입</button>
							</form>
						</div>
					</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<%
		} else {
	%>
	<!-- 메뉴 -->
	<div class="wrapper">
		<div>
			<c:import url="/include/sidebar.jsp" />
		</div>
		<div class="main-panel">

			<!-- 로그인 성공 -->
			<%
				out.print(session.getAttribute("id") + " 님 환영합니다");
			%>
			<br>
			
			<button id="logout" type="button" class="btn btn-primary pull-right">로그아웃</button>
			<button id="mod" type="button" class="btn btn-primary pull-right">회원정보수정</button>

			<%
				if (session.getAttribute("id").equals("admin")) {
			%>
			<a href="${pageContext.request.contextPath}/admin/admin.do" class="btn btn-primary btn-round">관리자 페이지</a>
			<%
				}
			%>

			<%
				}
			%>
			
		</div>
	</div>

	<script>
		$("#logout").click(function() {
			location.href = "${pageContext.request.contextPath}/login/logout.do";
		});

		$("#mod").click(function() {
			location.href = "${pageContext.request.contextPath}/view/login/modifySeller.jsp";
		});
	</script>
</body>
</html>