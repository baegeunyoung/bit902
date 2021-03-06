<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../../include/baseInclude.jsp" flush="true"></jsp:include>
<title>회원 정보 수정</title>
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

.form-group {
	margin-bottom: 0px;
	padding-bottom: 0px;
}
</style>
</head>
<body>
	<c:import url="../../include/sidebar.jsp" />
	<div class="wrapper" style="text-align: center;">
		<div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-header"></div>
				</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<%
						int selNo = (int) (session.getAttribute("selNo"));
						request.setAttribute("selNo", selNo);
					%>

					<a href="${pageContext.request.contextPath}/main/main.do" class="simple-text">
					<img src="/bit902web/img/orderthere.png" width="400px"/>
					</a>
					<br><br><br>
					<div style="font-size: 30px;">회원 정보 수정</div>
				</div>
				<form name="mForm" action="${pageContext.request.contextPath}/login/modifySeller.do" method="post" class="navbar-form navbar-center">
					<div class="form-group  is-empty">
						<table style="text-align: left;">
							<tr>
								<td><br>아이디</td>
								<td>
									<div class="form-group">
										<input type="text" name="id" value="<%out.print(session.getAttribute("id"));%>" readonly class="form-control">
									</div>
								</td>
							</tr>
							<tr>
								<td><br>비밀번호</td>
								<td>
									<div class="form-group">
										<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" class="form-control">
									</div>
								</td>
							</tr>
							<tr>
								<td><br>비밀번호 확인 &nbsp&nbsp&nbsp</td>
								<td>
									<div class="form-group">
										<input type="password" name="password2" placeholder="비밀번호를 입력하세요" class="form-control">
									</div>
								</td>
							</tr>
							<tr>
								<td><br>이름</td>
								<td>
									<div class="form-group">
										<input type="text" id="name" name="name" placeholder="이름을 입력하세요"
											value="<%out.print(session.getAttribute("name"));%>" class="form-control">
									</div>
								</td>
							</tr>
							<tr>
								<td><br>핸드폰 번호</td>
								<td>
									<div class="form-group">
										<input type="text" id="cellphoneNumber" name="cellphoneNumber" placeholder="핸드폰번호를 입력하세요"
											value="<%out.print(session.getAttribute("cellphoneNumber"));%>" class="form-control">
									</div>
								</td>
							</tr>
						</table>
						<br>
						<br>
						<input id="mod" type="submit" value="회원정보수정" onClick="return doAction()" class="btn btn-primary pull-center" />
					</div>
				</form>
			</div>
			<c:import url="../../include/footer.jsp" />
		</div>
	</div>
	<script>
		var selNo = '${selNo}';
		
		$(document).ready(function() {
			$.ajax({
				url : "/bit902web/login/searchOneSeller.do",
				type : "POST",
				dataType : "json",
				data : {
					sellerNo : selNo
				}
			}).done(function(result) {
				$("#name").val(result.name);
				$("#cellphoneNumber").val(result.cellphoneNumber);
			});
		});

		$("#mod").click(function doAction() {

			var f = document.mForm;
			var pw = f.password;
			var pw2 = f.password2;
			var name = f.name;
			var cellNo = f.cellphoneNumber;

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

			alert("회원 정보 수정이 완료되었습니다.");
			return true;
		});
	</script>
</body>
</html>