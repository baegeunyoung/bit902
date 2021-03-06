<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="baseInclude.jsp" flush="true"></jsp:include>
<style>
	body {
		overflow: hidden;
	}
</style>
</head>
<body>

	<!-- 		사이드바 선택시 색과 배경 그림 설정 -->
	<div class="sidebar" data-color="purple" data-image="${pageContext.request.contextPath}/img/SmartPay1.gif">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/main/main.do" class="simple-text"><img src="/bit902web/img/orderthere.png" width="190px"/></a>
		</div>

		<div class="sidebar-wrapper">
			<ul class="nav">
				<li>
					<a href="${pageContext.request.contextPath}/store/storeread.do">
					<i class="material-icons text-gray">store</i>
					<p>상점정보관리</p>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/menu/firstPage.do">
					<i class="material-icons text-gray">menu</i>
					<p>메뉴관리</p>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/beacon/beacon.do">
						<i class="material-icons text-gray">settings_input_svideo</i>
						<p>비콘관리</p>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/event/read.do">
						<i class="material-icons text-gray">wifi_tethering</i>
						<p>이벤트관리</p>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/order/state.do">
						<i class="material-icons text-gray">notifications</i>
						<p>주문현황</p>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/adjust/dayAdjust.do">
						<i class="material-icons text-gray">content_paste</i>
						<p>일일정산</p>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/adjust/monthAdjust.do">
						<i class="material-icons text-gray">library_books</i>
						<p>월 누적 판매량</p>
					</a>
				</li>
				<%
					if (session.getAttribute("id") != null) {
				%>
				<li class="active-pro">
					<%
						if (!session.getAttribute("id").equals("admin")) {
					%>
					<a href="${pageContext.request.contextPath}/view/login/modifySeller.jsp">
						<i class="material-icons">info</i>
						<p>회원 정보 수정</p>
					</a>
					<%
						} else if (session.getAttribute("id").equals("admin")) {
					%>
					<a href="${pageContext.request.contextPath}/admin/admin.do">
						<i class="material-icons">settings</i>
						<p>관리자 페이지</p>
					</a>
					<%
						}
					%>
					<a href="${pageContext.request.contextPath}/login/logout.do">
						<i class="material-icons">power_settings_new</i>
						<p>로그아웃</p>
					</a>
				</li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</body>
</html>