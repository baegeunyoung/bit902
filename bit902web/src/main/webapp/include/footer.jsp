<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="baseInclude.jsp" flush="true"></jsp:include>
</head>
	<footer class="footer">
	<div class="container-fluid">
		<nav class="pull-left">
			<a href="${pageContext.request.contextPath}/main/main.do">Home</a>
		</nav>
		<p class="copyright pull-right">
			&copy;
			<script>
				var date = new Date();
				document.write(date.getFullYear());
			</script>
			<a href="${pageContext.request.contextPath}/main/main.do">2조</a>
			, made with bitcamp bit90 members 
		</p>
	</div>
	</footer>

</html>
