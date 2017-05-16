<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 현황</title>
<style>
	.navbar-header {
		font-size: 30px;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<c:import url="../../include/sidebar.jsp" />
		<div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
			<div class="container-fluid">
				<div class="navbar-header">
					<br>
					${storeName}
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
										<span id="cDate">현재 주문 현황입니다.</span>
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
													<td>
														<c:choose>
															<c:when test="${list.tableNo == 9999}">
																PICK UP
															</c:when>
															<c:otherwise>
																${list.tableNo}
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<c:forEach var="result" items="${list.orderMenuList}" varStatus="stat">
															${result.name} - ${result.quantity}개<br>
														</c:forEach>
													</td>
													<td>
														&nbsp&nbsp&nbsp&nbsp<fmt:formatDate value="${list.orderDate}" pattern="MM월 dd일" />
														<br>
														<fmt:formatDate value="${list.orderDate}" pattern="hh시 mm분 ss초" />
													</td>
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
																&nbsp&nbsp&nbsp접수확인완료&nbsp
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
			swal({title: data, type: "success"}, function() {
				location.href = "/bit902web/order/state.do";				
			});
		});
	
	</script>
</body>
</html>
