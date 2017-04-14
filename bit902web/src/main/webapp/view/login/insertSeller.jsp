<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../../include/baseInclude.jsp" flush="true"></jsp:include>
<script src="../../js/jquery-3.1.1.js"></script>
<title>Insert title</title>
</head>
<body>
<div class="wrapper">
<div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
				<div class="collapse navbar-collapse">
		
   <form name="mForm" action="${pageContext.request.contextPath}/login/insertSeller.do" method="post" class="navbar-form navbar-center">
   <div class="form-group  is-empty">
   
		<input type="text" name="id" placeholder="아이디를 입력하세요" class="form-control">
		<span class="material-input"></span><br>
		<input type="password" name="password" placeholder="비밀번호를 입력하세요" class="form-control">
		<span class="material-input"></span><br>
		<input type="password" name="password2" placeholder="비밀번호를 입력하세요" class="form-control">
		<span class="material-input"></span><br>
		<input type="text" name="name" placeholder="이름을 입력하세요" class="form-control">
		<span class="material-input"></span><br>
		<input type="text" name="cellphoneNumber" placeholder="핸드폰번호를 입력하세요" class="form-control">
		<span class="material-input"></span><br>
<!-- 		<button type="button" onclick="doAction();">회원가입</button> -->
<!-- 		<button id="reg">회원가입</button> -->
		<input type="submit" value="회원가입" onClick="return doAction()" class="btn btn-primary pull-center"/>
	</form>
	</div>
	</div>
	</div>
	</nav>
	</div>
	</div>	
	
	
</div>
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
			var name = f.name;
			var cellNo = f.cellphoneNumber;
			
// 			var pattern1 = /[0-9]/;
// 			var pattern2 = /[a-zA-Z]/;
			
			if (id.value == "") {
				alert("insert your id");
				id.focus();
				return false;
			}
						
			if (2 > id.value.length || id.value.length > 21){
				alert("아이디는 최소 3자에서 최대 20자까지 입력이 가능합니다.");
				id.focus();
				return false;
			}
			
			if (pw.value == "") {
				alert("비밀번호를 입력하세요");
				pw.focus();
				return false;
			}
			
			if ( 7 > pw.value.length || pw.value.length > 21) {
				alert("비밀번호는 최소 8자에서 최대 20자까지 입력이 가능합니다.");
				pw.focus();
				return false;
			}
			
			if (pw2.value == "") {
				alert("비밀번호 확인을 입력하세요");
				pw2.focus();
				return false;
			}
			
			if (7 > pw2.value.length || pw2.value.length > 21){
				alert("비밀번호는 최소 8자에서 최대 20자까지 입력이 가능합니다.");
				pw2.focus();
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
				name.focus();
				return false;
			}			
			
			if (cellNo.value == "") {
				alert("핸드폰번호를 입력하세요");
				cellNo.focus();
				return false;	
			}	
			
			if (cellNo.value.length > 11){
				alert("핸드폰 번호는 11자까지 입력이 가능합니다.");
				cellNo.focus();
				return false;
			}
				
// 			$("form[name='mForm']").submit(function () {
// 				if(!confirm('회원가입이 완료됩니다')) {
// 				return false;		
// 			}
// 			})
				
			return true;
		}
		
		
		
		
		
		
		
	</script>	
</body>
</html>