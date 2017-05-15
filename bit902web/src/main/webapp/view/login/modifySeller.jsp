<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../../include/baseInclude.jsp" flush="true"></jsp:include>
<script src="../../js/jquery-3.1.1.js"></script>
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

table {
	border-spacing: 10px;
	border-collapse: separate;
}
</style>
</head>
<body>

	<!--       <div class="content"> -->
	<!-- 	            <div class="container-fluid"> -->
	<!-- 	                <div class="row"> -->
	<!-- 	                    <div class="col-md-8"> -->
	<!-- 	                        <div class="card"> -->
	<!-- 	                            <div class="card-header" data-background-color="purple"> -->
	<!-- 	                                <h4 class="title">회원가입</h4> -->
	<!-- 									<p class="category">회원정보를 입력해주세요</p> -->
	<!-- 	                            </div> -->
	<!-- 	                            <div class="card-content"> -->
	<!-- 	                                <form> -->
	<!-- 	                                    <div class="row"> -->
	<!-- 	                                        <div class="col-md-1"> -->
	<!-- 												<div class="form-group label-floating"> -->
	<!-- 													<label class="control-label">아이디</label> -->
	<!-- 													<input type="text" name="id" placeholder="아이디를 입력하세요" class="form-control"> -->
	<!-- 												</div> -->
	<!-- 	                                        </div> -->
	<!-- 	                                        </div> -->

	<!-- 	                                        <div class="row"> -->
	<!-- 	                                        <div class="col-md-2"> -->
	<!-- 												<div class="form-group label-floating"> -->
	<!-- 													<label class="control-label">비밀번호</label> -->
	<!-- 													<input type="password" name="password" placeholder="비밀번호를 입력하세요" class="form-control"> -->
	<!-- 												</div> -->
	<!-- 	                                        </div> -->
	<!-- 	                                        </div> -->

	<!-- 	                                        <div class="row"> -->
	<!-- 	                                        <div class="col-md-3"> -->
	<!-- 												<div class="form-group label-floating"> -->
	<!-- 													<label class="control-label">비밀번호 확인</label> -->
	<!-- 													<input type="password" name="password2" placeholder="비밀번호를 입력하세요" class="form-control"> -->
	<!-- 												</div> -->
	<!-- 	                                        </div> -->
	<!-- 	                                        </div> -->

	<!-- 	                                        <div class="row"> -->
	<!-- 	                                        <div class="col-md-4"> -->
	<!-- 												<div class="form-group label-floating"> -->
	<!-- 													<label class="control-label">이름</label> -->
	<!-- 													<input type="text" name="name" placeholder="이름을 입력하세요" class="form-control"> -->
	<!-- 												</div> -->
	<!-- 	                                        </div> -->
	<!-- 	                                        </div> -->

	<!-- 	                                        <div class="row"> -->
	<!-- 	                                        <div class="col-md-5"> -->
	<!-- 												<div class="form-group label-floating"> -->
	<!-- 													<label class="control-label">핸드폰번호</label> -->
	<!-- 													<input type="text" name="cellphoneNumber" placeholder="핸드폰번호를 입력하세요" class="form-control"> -->
	<!-- 												</div> -->
	<!-- 	                                        </div> -->
	<!-- 	                                        </div> -->



	<!-- 	                                    </div>	                            -->
	<!-- 	                                    </div> -->
	<!-- 	                                    </div> -->
	<!-- 	                                    </div> -->

	<!-- 	                                    <input type="submit" value="회원가입" onClick="return doAction()" class="btn btn-primary pull-right"/> -->
	<!-- 	                                    <div class="clearfix"></div> -->
	<!-- 	                                </form> -->
	<!-- 	                            </div> -->
	<div class="wrapper" style="text-align: center;">
		<nav class="navbar navbar-transparent navbar-absolute">
			<div class="container-fluid">
				<div class="collapse navbar-collapse">
					<div class="logo">
						<h1>
							<a href="${pageContext.request.contextPath}/main/main.do" class="simple-text">거기서 주문해 </a>
						</h1>
					</div>
					<br><br>
					<h2>회원정보수정</h2>
					<br>
					<form name="mForm" action="${pageContext.request.contextPath}/login/modifySeller.do" method="post" class="navbar-form navbar-center">
						<div class="form-group  is-empty">
							<table style="text-align: left;">
								<tr>
									<td>아이디</td>
									<td>
										<div class="form-group">
											<input type="text" name="id" value="<%out.print(session.getAttribute("id"));%>" readonly class="form-control">
										</div>
									</td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td>
										<div class="form-group">
											<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" class="form-control">
										</div>
									</td>
								</tr>
								<tr>
									<td>비밀번호 확인 &nbsp&nbsp&nbsp</td>
									<td>
										<div class="form-group">
											<input type="password" name="password2" placeholder="비밀번호를 입력하세요" class="form-control">
										</div>
									</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>
										<div class="form-group">
											<input type="text" id="name" name="name" placeholder="이름을 입력하세요" value="<%out.print(session.getAttribute("name"));%>" class="form-control">
										</div>
									</td>
								</tr>
								<tr>
									<td>핸드폰 번호</td>
									<td>
										<div class="form-group">
											<input type="text" id="cellphoneNumber" name="cellphoneNumber" placeholder="핸드폰번호를 입력하세요" value="<%out.print(session.getAttribute("cellphoneNumber"));%>" class="form-control">
										</div>
									</td>
								</tr>
							</table>
							<br><br>
							<input id="mod" type="submit" value="회원정보수정" onClick="return doAction()" class="btn btn-primary pull-center" />
						</div>
					</form>
				</div>
			</div>
		</nav>
	</div>
	<script>

// 	$(document).ready(function() {
// 		$.ajax({
// 			url: "/bit902web/login/searchOneSeller.do",
// 			type: "POST",
// 			dataType: "json",
// 			data: {
// 				id: $("#id").val()
// 			}
// 		}).done(function (result) {
// 	 		$("#name").val(result.staffName);
// 	 		 var strArray = result.juminNo.split('-');
// 	 		 var jumin1 = strArray[0];
// 	 		 var jumin2 = strArray[1];
// 	 		$("#jumin1").val(jumin1);
// 	 		$("#jumin2").val(jumin2);
// 		});
// 	});
	$("#mod").click(function doAction() {
			
			var f = document.mForm;
// 			var id = f.id;
			var pw = f.password;
			var pw2 = f.password2;
			var name = f.name;
			var cellNo = f.cellphoneNumber;
			
// 			var pattern1 = /[0-9]/;
// 			var pattern2 = /[a-zA-Z]/;
			
// 			if (id.value == "") {
// 				alert("insert your id");
// 				id.focus();
// 				return false;
// 			}
						
// 			if (2 > id.value.length || id.value.length > 21){
// 				alert("아이디는 최소 3자에서 최대 20자까지 입력이 가능합니다.");
// 				id.focus();
// 				return false;
// 			}
			
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
			alert("회원 정보 수정이 완료되었습니다.");	
			return true;
		});
		
// 		$.ajax({
// 			url: "/bit902web/login/searchSeller.do",
// 			type: "POST",
// 			dataType: "json",
// 			data: {
// 				id: $("#id").val(),
// 				password: $("#pw").val()
// 			}
// 		}).done(function(result) {
// 			alert("성공")
// 		})
	
// 	$(document).click(function () {
// 		$.ajax({
// 			url: "/bit902web/login/searchSeller.do",
// 			type: "POST",
// 			dataType: "json",
// 			data: {
// 				id: $("#id").val()
// 			}
// 		}).done(function () {
// 		alert("아이디 반환 성공");	
// 		});
// 	});
		
	</script>
</body>
</html>