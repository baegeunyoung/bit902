<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">

		<div>
			<c:import url="../../include/sidebar.jsp" />
		</div>
		<div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">비콘관리</a>
				</div>
			</div>
			</nav>

			<div class="content">

				<%
					if (session.getAttribute("id") != null) {
						
// 						String id = (String)(session.getAttribute("id"));
						int selNo = (int)(session.getAttribute("selNo"));
					//	int beaconNo = (int)(session.getAttribute("beaconNo"));
						//int serialNo = (int)(session.getAttribute("serialNo"));
						//int tableNo = (int)(session.getAttribute("tableNo"));
						
						
				%>

<script>
console.log(<%=selNo%>);
</script>

				<div class="container-fluid">
					<div class="row">
						<div class="col-md-15">
							<div class="card">
								<div class="card-header" data-background-color="purple">

									<h4 class="title">비콘등록하기</h4>
									<p class="category">상점의 비콘을 등록해주세요</p>
								</div>
								<div class="card-content">
									<form class="form-horizontal"
										action="${pageContext.request.contextPath}/beacon/insertBeacon.do"
										id="form" method="post">
										<div class="row" id="menu">
											<div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">판매자번호</label> <input
														name="sellerNo" type="text" class="form-control"
 														readonly value="<%=selNo%>">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">시리얼번호</label> <input
														id="serialNo" type="text" class="form-control"
														value="<%%>">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">테이블번호</label> <input
														id="tableNo" type="text" class="form-control">
												</div>
											</div>
										</div>
										<button id="reg" type="submit"
											class="btn btn-primary pull-right">비콘등록</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 								<button id="sel" type="submit" onClick="return sel()" class="btn btn-primary pull-right">비콘정보보기</button>   	  	                             -->
				<div class="content">



					<div class="container-fluid">
						<div class="row">
							<div class="col-md-15">
								<div class="card">
									<div class="card-header" data-background-color="purple">

										<h4 class="title">비콘정보수정</h4>
										<p class="category">비콘정보를 수정해주세요</p>
									</div>
									<div class="card-content">
										<form class="form-horizontal"
											<%-- 					action="${pageContext.request.contextPath}/beacon/modifyBeacon.do" --%>
					                        id="wForm"
											method="post">
											<div class="row" id="menu">
												<div class="col-md-3">
													<div class="form-group label-floating">
														<label class="control-label">판매자번호</label> <input
															id="modSellerNo" type="text" class="form-control"
<%-- 															readonly value="<%out.print((int)request.getAttribute("sellerNo"));%>"> --%>
																readonly value="<%=selNo%>">
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group label-floating">
														<label class="control-label">비콘번호</label> <input
															id="modBeaconNo" type="text" class="form-control">
<%-- 															value="<%out.print((int)request.getAttribute("beaconNo"));%>"> --%>
<%-- 																value="<%int beaconNo = (int)session.getAttribute("beaconNo");%>">	 --%>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group label-floating">
														<label class="control-label">시리얼번호</label> <input
															id="modSerialNo" type="text" class="form-control">
<%-- 															value="<%int serialNo = (int)session.getAttribute("serialNo");%>"> --%>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group label-floating">
														<label class="control-label">테이블번호</label> <input
															id="modTableNo" type="text" class="form-control">
<%-- 															value="<%int tableNo = (int)session.getAttribute("tableNo");%>"> --%>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group label-floating">
														<button id="mod" type="submit" onClick="return mod()"
															class="btn btn-primary pull-right">비콘정보수정</button>
														<button id="del" type="submit" onClick="return del()"
															class="btn btn-primary pull-right">비콘삭제</button>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<%
					}

					else {
				%>
				<script>
					location.href = "/bit902web/main/main.do";
				</script>

				<%
					}
				%>


				<script>
// 				$(function() {});
							$(document).ready(function() {
								$.ajax({
									url : "/bit902web/beacon/searchBeacon.do",
									type: "POST",
									dataType : "json",
									data: {
										selNo: $("#sellerNo").val()
										
									}
								
								}).done(function(result) {
								   alert("성공");
								})
							});

					$("#logout")
							.click(
									function() {
										location.href = "${pageContext.request.contextPath}/login/logout.do";
									});

					$("#mod").click(function() {
						$.ajax({
							url : "/bit902web/beacon/modifyBeacon.do",
							type : "POST",
							dataType : "json",
							data : {
								sellerNo: $("#modSellerNo").val(),
								beaconNo: $("#modBeaconNo").val(),
								serialNo: $("#modSerialNo").val(),
								tableNo: $("#modTableNo").val()
							}
						})
					})

					$("#del").click(function() {
						$.ajax({
							url : "/bit902web/beacon/deleteBeacon.do",
							type : "POST",
							dataType : "json",
							data : {
								beaconNo: $("#modBeaconNo").val(),
								sellerNo: $("#modSellerNo").val()
							}
						})
					})
				</script>
</body>
</html>