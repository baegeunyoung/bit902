<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../../include/baseInclude.jsp" flush="true"></jsp:include>
<title>회원 가입</title>
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

td {
	height: 60px;
}
</style>
</head>
<body>
	<div class="wrapper" style="text-align: center;">
		<nav class="navbar navbar-transparent navbar-absolute">
			<div class="content">
				<div class="container-fluid">
					<a href="${pageContext.request.contextPath}/main/main.do" class="simple-text">
						<img src="/bit902web/img/orderthere.png" width="400px" />
					</a>
				</div>
				<br> <br>
				<div style="font-size: 30px;">회원가입</div>
				<br>
				<form name="mForm" action="${pageContext.request.contextPath}/login/insertSeller.do" method="post" class="navbar-form navbar-center">
					<div class="form-group  is-empty">
						<table style="text-align: left;">
							<tr>
								<td>아이디</td>
								<td>
									<div class="form-group">
										<input type="text" id="id" name="id" placeholder="아이디" class="form-control">
										<input id="search"type="button" value="중복확인" onclick="return selctId()" style="background-color: #9c27b0; border-color: #9c27b0;" class="btn-primary pull-center">
									</div>
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>
									<div class="form-group">
										<input type="password" id="password" name="password" placeholder="비밀번호" class="form-control">
									</div>
								</td>
							</tr>
							<tr>
								<td>비밀번호 확인 &nbsp&nbsp&nbsp</td>
								<td>
									<div class="form-group">
										<input type="password" name="password2" placeholder="비밀번호 확인" class="form-control">
									</div>
								</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>
									<div class="form-group">
										<input type="text" id="name" name="name" placeholder="이름" class="form-control">
									</div>
								</td>
							</tr>
							<tr>
								<td>핸드폰 번호</td>
								<td>
									<div class="form-group">
										<input type="text" id="cellphoneNumber" name="cellphoneNumber" placeholder="핸드폰번호" class="form-control">
									</div>
								</td>
						</table>
						<br>
						<br>
						<input id="reg" type="submit" value="회원가입" onClick="return doAction()" class="btn btn-primary pull-center" />
					</div>
				</form>
			</div>
		</nav>
	</div>
	<c:import url="../../include/footer.jsp" />
	<script>
		function selctId() {
			$.ajax({
				url : "/bit902web/login/searchSeller.do",
				type : "POST",
				dataType : "text",
				data : {
					id : $("#id").val()
				}
			}).done(function(returnId) {
				if (id.value === "") {
					swal("아이디를 입력 해 주세요.");
					id.focus();
					return false;
				} else if (3 > id.value.length || id.value.length > 20) {
					swal("아이디는 최소 3자에서 최대 20자까지 입력이 가능합니다.");
					id.focus();
					return false;
				} else if (returnId === "exist") {
					swal("같은 아이디가 존재합니다.");
					$("#id").val("");
					id.focus();
				} else {
					swal("사용 가능한 아이디 입니다.");
				}
			});
		}

		$(".swa-confirm").click(function doAction() {

			var f = document.mForm;
			var id = f.id;
			var pw = f.password;
			var pw2 = f.password2;
			var name = f.name;
			var cellNo = f.cellphoneNumber;

			if (returnId === "exist") {
				swal("같은 아이디가 존재합니다.");
				$("#id").val("");
				id.focus();
				return false;
			}
			
			if (id.value === "") {
				swal("아이디를 입력 해 주세요.");
				id.focus();
				return false;
			}
			
			if (3 > id.value.length || id.value.length > 20) {
				swal("아이디는 최소 3자에서 최대 20자까지 입력이 가능합니다.");
				id.focus();
				return false;
			}
			
			if (pw.value == "") {
				swal("비밀번호를 입력하세요");
				pw.focus();
				return false;
			}

			if (7 > pw.value.length || pw.value.length > 21) {
				swal("비밀번호는 최소 8자에서 최대 20자까지 입력이 가능합니다.");
				pw.focus();
				return false;
			}

			if (pw2.value == "") {
				swal("비밀번호 확인을 입력하세요");
				pw2.focus();
				return false;
			}

			if (7 > pw2.value.length || pw2.value.length > 21) {
				swal("비밀번호는 최소 8자에서 최대 20자까지 입력이 가능합니다.");
				pw2.focus();
				return false;
			}

			if (pw.value != pw2.value) {
				swal("비밀번호가 일치하지 않습니다");
				pw.focus();
				pw.select();
				return false;
			}

			if (name.value == "") {
				swal("이름을 입력하세요");
				name.focus();
				return false;
			}

			if (1 > name.value.length || name.value.length > 6) {
				swal("이름은 최소 2자에서 최대 5자까지 입력이 가능합니다.");
				name.focus();
				return false;
			}

			if (cellNo.value == "") {
				swal("핸드폰번호를 입력하세요");
				cellNo.focus();
				return false;
			}

			if (cellNo.value.length > 11) {
				swal("핸드폰 번호는 11자까지 입력이 가능합니다.");
				cellNo.focus();
				return false;
			}

			alert("회원 가입이 완료되었습니다.");
			return true;
		})
		
	</script>
</body>
</html>