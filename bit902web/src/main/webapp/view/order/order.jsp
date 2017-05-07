<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 현황</title>
</head>
<body>
	<div class="wrapper">
		<c:import url="../../include/sidebar.jsp" />
		<div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
			<div class="container-fluid">
				<div class="navbar-header">
				</div>
			</div>
			</nav>

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<br>
							<div class="card">
								<div class="card-header" data-background-color="purple">
									<h4 class="title">주문 현황</h4>
									<p class="category">
										<span id="cDate">하하하</span>
									</p>
								</div>
								<div class="card-content table-responsive">
									<table id="table" class="table">
										<thead class="text-primary">
											<tr>
												<th>주문번호</th>
												<th>테이블 번호</th>
												<th>주문 사항</th>
												<th>주문 시각</th>
												<th>주문 특이사항</th>
												<th>접수확인/조리완료</th>
											</tr>
										</thead>

										<tbody id="tbody">
											<c:set var="count" value="1" />
											<c:forEach var="list" items="${orderList}">
												<tr>
													<td>${count}</td>
													<td>${list.tableNo}</td>
													<td>
														<c:forEach var="result" items="${list.orderMenuList}" varStatus="stat">
															${result.name} - ${result.quantity}개<br>
														</c:forEach>
													</td>
													<td><fmt:formatDate value="${list.orderDate}" pattern="hh:mm:ss" /></td>
													<td>${list.orderContent}</td>
													<td>
														<c:choose>
															<c:when test="${list.orderState == '0'}">
																<form name="receive" action="${pageContext.request.contextPath}/order/receive.do" method="post">
																	<input type="hidden" name="orderNo" id="orderNo" value="${list.orderNo}" />
																	<input type="hidden" name="deviceToken" id="deviceToken" value="${list.deviceToken}" />
																	<input type="hidden" name="orderContent" id="orderContent" value="주문이 접수되었습니다." />
																	<button type="submit" class="btn btn-primary">접수확인</button>
																</form>
															</c:when>
															<c:when test="${list.orderState == '1'}">
																&nbsp&nbsp접수확인완료 &nbsp/ &nbsp
															</c:when>
														</c:choose>
															<form name="complete" action="${pageContext.request.contextPath}/order/complete.do" method="post">
																<input type="hidden" name="orderNo" id="orderNo" value="${list.orderNo}" />
																<input type="hidden" name="deviceToken" id="deviceToken" value="${list.deviceToken}" />
																<input type="hidden" name="orderContent" id="orderContent" value="요리가 완료되었습니다." />
																<button type="submit" class="btn btn-primary">조리완료</button>
															</form>
													</td>
												</tr>
												<c:set var="count" value="${count + 1}" />
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:import url="../../include/footer.jsp" />
		</div>
	</div>

	<script src="http://14.32.66.123:8888/socket.io/socket.io.js"></script>
	<script>
		
		var socket = io.connect("http://14.32.66.123:8888");
		var loginId = ${seller.sellerNo};
		var recvId = ${seller.sellerNo};
	
		socket.emit("login", loginId);
		socket.emit("msg", {recvId: recvId, sendId: loginId, msg: $("#msg").val()});
		socket.on("msg", function(data) {
			alert(data);
			updateData();
		});
		
		function updateData() {
			$.ajax({
				url: "${pageContext.request.contextPath}/order/state.do",
				type: "POST",
				dataType : "JSON"
			}).done( function (result){
				var html = "";
				var count = 1;
				console.log(result.length);
				for (var i = 0 ; i < result.length ; i++) {
					html += '<tr>';
					html += '<td>' + count + '</td>';
					html += '<td>' + result[i].tableNo + '</td>';
					html += '<td>';
					for (var j ; j < result[i].orderMenuList.length ; j++) {
						html += result[i].orderMenuList[j].name + '-' + result[i].orderMenuList[j].quantity + '개<br>';
						console.log(result[i].orderMenuList[j].name);
					}							
					html += '</td>';
					
					var myDate = new Date(result[i].orderDate);
					var myHours = myDate.getHours();
					var myMinutes = myDate.getMinutes();
					var mySeconds = myDate.getSeconds();
					
					html += '<td>' + myHours + ':' + myMinutes + ':' + mySeconds + '</td>'; 
					html += '<td>' + result[i].orderContent + '</td>';
					html += '<td>';
					
					if (result[i].orderState == 0) {
						html += '<form name="receive" action="${pageContext.request.contextPath}/order/receive.do" method="post">';
						html += '<input type="hidden" name="receiveNo" id="receiveNo" value="' + result[i].orderNo + '" />';
						html += '<button type="submit" class="btn btn-primary">접수확인</button>';
					} else if (result[i].orderState == 1) {
						html += '&nbsp&nbsp접수확인완료 &nbsp/ &nbsp';
					} 
					html += '<form name="complete" action="${pageContext.request.contextPath}/order/complete.do" method="post">';
					html += '<input type="hidden" name="completeNo" id="completeNo" value="' + result[i].orderNo + '" />';
					html += '<button type="submit" class="btn btn-primary">조리완료</button>';
					html += '</form>';
					html += '</td>';
					html += '</tr>';
					count++;
				}
				$("#tbody").html(html);
			}).fail(function(jqXhr, testStatus, errorText) {
				alert("에러발생 : " + errorText);
			});
		}
	</script>
</body>
</html>
