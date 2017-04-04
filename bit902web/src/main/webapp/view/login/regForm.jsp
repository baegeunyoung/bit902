<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title</title>
</head>
<body>
   <form name="mForm" action="insertSeller.do" onsubmit="return doAction();">
		id : <input type="text" name="id" /><br>
		비밀번호 : <input type="password" name="password" /><br>
		비밀번호 확인 : <input type="password" name="password" /><br>
		이름 : <input type="text" name="name" /><br>
		핸드폰번호 : <input type="text" name="cellNo" /><br>
		<button type="button" onclick="doAction();">회원가입</button>
	</form>
	
	<script>
		function doAction() {
			var f = document.mForm;
			var id = f.id;
			var password = f.password;
			var password2 = f.password2;
			
			if (id.value == "") {
				alert("아이디를 입력하세요");
				id.focus();
				return false;
			}
			
			if (password.value == "") {
				alert("패스워드를 입력하세요");
				password.focus();
				return false;
			}
			
			if (password2.value == "") {
				alert("패스워드 확인을 입력하세요");
				password2.focus();
				return false;
			}
			
			if (password.value != password2.value) {
				alert("입력된 패스워드를 확인하세요");
				password.focus();
				password.select();
				return false;
			}
			
			return true;	
		}
	</script>	
</body>
</html>