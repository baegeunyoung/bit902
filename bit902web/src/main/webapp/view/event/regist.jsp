<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../../include/baseInclude.jsp" flush="true"></jsp:include>
<title>이벤트 관리</title>
</head>
<body>
<script>
	swal({title: "처리되었습니다.", type: "success"}, function() {
		location.href = "/bit902web/event/read.do";
	});
			

</script>
</body>
</html>