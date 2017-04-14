<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
	<div>
		<c:import url="/include/sidebar.jsp"/>
	</div>
	<div class="main-panel">
		<button type="button" onclick="location.href='/bit902web/view/login/login.jsp'" class="btn btn-primary pull-right">로그인</button>
	<a href='buyer/list.do'>구매자확인</a>
	</div>
</div>
</body>
</html>