<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../../include/baseInclude.jsp" flush="true"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
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
</head>
<body>
	<!-- 로그인 -->
	<%
		if (session.getAttribute("id") == null) {
	%>
	<div class="wrapper" style="text-align: center;">
		<div class="container-fluid">
			<br>
			<br>
			<img src="/bit902web/img/orderthere.png" width="400px"/>
			<br>

			<div id="success"></div>
			<form name="mForm" action="${pageContext.request.contextPath}/login/login.do" method="post" class="navbar-form navbar-center">
				<div class="form-group is-empty">
					<div class="form-group">
						<input type="text" name="id" placeholder="아이디를 입력하세요" class="form-control" style="margin-bottom: 10px;">
						<span class="material-input"></span><br>
					</div>
					<br>
					<div class="form-group">
						<input type="password" name="password" placeholder="비밀번호를 입력하세요" class="form-control"><br>
						<span class="material-input"></span><br>
					</div>
					<br>
					<button id="login" class="btn btn-primary pull-center">로그인</button>
					<a href="/bit902web/view/login/insertSeller.jsp" role='button' class="btn btn-primary pull-center">회원가입</a>
				</div>
			</form>
		</div>
	</div>
	<c:import url="../../include/footer.jsp" />
	<%
		} else {
	%>
	<div class="wrapper">
		<%
			if (session.getAttribute("permitYn").equals("y")) {
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
						int selNo = (int)session.getAttribute("sellerNo");	
	//					for(int i=0; i<=beaconList.size(); i++) {
		//					session.getAttribute("beacon"+ i, beaconList.get(i));
			//			}
						
						session.setAttribute("selNo", selNo);
				//		session.setAttribute("beacon", beacon);
						%>
					</h3>
				</div>
			</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<br>
							<!-- 로그인 성공 -->
							<br>
							<%
								if (session.getAttribute("permitYn").equals("n") || session.getAttribute("permitYn").equals("r")) {
							%>
							<h3>관리자 승인 후 이용하실 수 있습니다.</h3>
							<a href="${pageContext.request.contextPath}/login/logout.do">
							<i class="material-icons">power_settings_new</i>
							로그아웃
							</a>
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
</body>
</html>
