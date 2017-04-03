<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="baseInclude.jsp" flush="true"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	
<!-- 		사이드바 선택시 색과 배경 그림 설정 -->
	    <div class="sidebar" data-color="purple" data-image="${pageContext.request.contextPath}/material-dashboard-free-v1.1.0/assets/img/SmartPay1.gif">
			<div class="logo">
				<a href="#" class="simple-text">
					Smart Pay
				</a>
			</div>

	    	<div class="sidebar-wrapper">
				<ul class="nav">
	                <li>
	                    <a href="${pageContext.request.contextPath}/view/store/writeform.jsp">
	                        <p>상점정보등록</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath}/view/store/writeform.jsp">
	                        <p>메뉴등록</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="#">
	                        <p>비콘등록</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="#">
	                        <p>쿠폰관리</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="#">
	                        <p>주문현황</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="#">
	                        <p>일일정산</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="#">
	                        <p>월 누적 판매량</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
		</div>
	
</body>
</html>