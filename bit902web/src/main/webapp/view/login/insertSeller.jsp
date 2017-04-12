<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../js/jquery-3.1.1.js"></script>
<title>Insert title</title>
</head>
<body>
   <form name="mForm" action="${pageContext.request.contextPath}/login/insertSeller.do" method="post">
		id : <input type="text" name="id" /><br>
		비밀번호 : <input type="text" name="password" /><br>
		비밀번호확인 : <input type="text" name="password2" /><br>
		이름 : <input type="text" name="name" /><br>
		핸드폰번호 : <input type="text" name="cellphoneNumber" /><br>
<!-- 		<button type="button" onclick="doAction();">회원가입</button> -->
<!-- 		<button id="reg">회원가입</button> -->
		<input type="submit" value="회원가입" onClick="doAction()" />
		
	</form>
	
	<script>
	
// 	$("#reg").click(function () {
// 		alert("회원가입이 완료되었습니다.")
// 		location.href="/bit902web/login/loginForm.do"
// 	});
	
		function doAction() {
		
		
			var f = document.mForm;
			var id = f.id;
			var pw = f.password;
			var pw2 = f.password2;
			var cellNo = f.cellphoneNumber;
			
			var pattern1 = /[0-9]/;
			var pattern2 = /[a-zA-Z]/;
			
			if (id.value == "") {
				alert("아이디를 입력하세요");
				id.focus();
				return false;
			}
						
			if (2 > id.value.length || id.value.length > 21){
				alert("아이디는 최소 3자에서 최대 20자까지 입력이 가능합니다.");
				clearText();
				return false;
			}
			
			if (pw.value == "") {
				alert("비밀번호를 입력하세요");
				pw.focus();
				return false;
			}
			
			if ( 7 > pw.value.length || pw.value.length > 21) {
				alert("비밀번호는 영문+숫자+특수기호 포함, 최소 8자에서 최대 20자까지 입력이 가능합니다.");
				clearText();
				return false;
			}
			
			if (pw2.value == "") {
				alert("비밀번호 확인을 입력하세요");
				pw2.focus();
				return false;
			}
			
			if (7 > pw2.value.length || pw2.value.length > 21){
				alert("비밀번호는 최소 8자에서 최대 20자까지 입력이 가능합니다.");
				clearText();
				return false;
			}
			
			if (pw.value != pw2.value) {
				alert("비밀번호가 일치하지 않습니다");
				pw.focus();
				pw.select();
				return false;
			}
			
			if (name.value == "") {
				alert("이름을 입력하세요");
				name.focus();
				return false;
			}
			
			if (1 > name.value.length || name.value.length > 6){
				alert("이름은 최소 2자에서 최대 5자까지 입력이 가능합니다.");
				clearText();
				return false;
			}			
			
			if (cellNo.value == "") {
				alert("핸드폰번호를 입력하세요");
				cellNo.focus();
				return false;	
			}	
			
			if (cellNo.value.length > 11){
				alert("핸드폰 번호는 11자까지 입력이 가능합니다.");
				cellNo.value = cellNo.value.substring(0,11);
				return false;
			} else {
				$("#mForm").submit();
				return true;
			}
				
			$("form[name='mForm']").submit(function () {
				if(!confirm('회원가입이 완료됩니다')) {
				return false;		
			}
			})

			return false;
		}
		
		
		
		
		
		
		
	</script>	
</body>
</html>