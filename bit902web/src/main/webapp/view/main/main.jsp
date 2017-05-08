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
	<!-- 로그인 -->
	<%
		if (session.getAttribute("id") == null) {
	%>
	<div class="wrapper" style="text-align: center;">
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<br>
							<h4>로그인</h4>
							<div id="success"></div>
							<br>
							<form name="mForm" action="${pageContext.request.contextPath}/login/login.do" method="post" class="navbar-form navbar-center">
								<div class="form-group is-empty">
									<input type="text" name="id" placeholder="아이디를 입력하세요" class="form-control">
									<span class="material-input"></span><br>
									<input type="password" name="password" placeholder="비밀번호를 입력하세요" class="form-control">
									<span class="material-input"></span><br>
									<button id="login" class="btn btn-primary pull-center">로그인</button>
								</div>
							</form>
							<form name="Form" action="/bit902web/view/login/insertSeller.jsp" method="post" class="navbar-form navbar-center">
								<button id="reg" class="btn btn-primary pull-center">회원가입</button>
							</form>
						</div>
					</div>
				</div>
			</div>

	</div>
			<c:import url="../../include/footer.jsp" />
	<%
		} else {
	%>
	<div class="wrapper">
	<%
		if (session.getAttribute("permitYn").equals("y")){
	%>
		<c:import url="../../include/sidebar.jsp" />
	<%
		}
	%>
		<div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
			<div class="container-fluid">
				<div class="navbar-header">
					<h3>
						<%
							out.print(session.getAttribute("id") + " 님 환영합니다");
						%>
					</h3>
				</div>
			</div>
			</nav>
			<div class="content">
				<div class="container-fluid" style="text-align: center;">
					<div class="row">
						<div class="col-md-12">
							<br>
							<!-- 로그인 성공 -->
							<br>
							<button id="logout" type="button" class="btn btn-primary pull-right">로그아웃</button>
							<button id="mod" type="button" class="btn btn-primary pull-right">회원정보수정</button>
							<%
								if (session.getAttribute("id").equals("admin")) {
							%>
							<a href="${pageContext.request.contextPath}/admin/admin.do" class="btn btn-primary">관리자 페이지</a>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
			<c:import url="../../include/footer.jsp" />
		</div>
	</div>
	<%
		}
	%>
	<script>
		$("#logout").click(	function() {
			location.href = "${pageContext.request.contextPath}/login/logout.do";
		});

		$("#mod").click( function() {
			location.href = "${pageContext.request.contextPath}/view/login/modifySeller.jsp";
		});
	</script>
</body>
</html>
