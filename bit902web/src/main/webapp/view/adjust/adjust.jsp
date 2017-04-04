<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<!-- 							<ul class="nav nav-pills nav-pills-info"> -->
<!-- 								<li id="day" class="active"><a href="#pill1" data-toggle="tab">일별보기</a></li> -->
<!-- 								<li id="month"><a href="#pill2" data-toggle="tab">월별보기</a></li> -->
<!-- 							</ul> -->
							<br>
							<div class="card">
								<div class="card-header" data-background-color="purple">
									<h4 class="title">${retrieveDayAdjust[0].storeName}의 일일 정산 내역</h4>
									<p class="category"><fmt:formatDate value="${retrieveDayAdjust[0].adjustDate}" pattern="yyyy년 MM월 dd일" />
									<a href=#><i class="material-icons text-black">date_range</i></a></p>
								</div>
	                            <div class="card-content table-responsive">
	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>날짜</th>
	                                    	<th>상품명</th>
	                                    	<th>판매수</th>
											<th>매출액</th>
										</thead>
										<tbody>
											<c:forEach var="list" items="${retrieveDayAdjust}">
											<tr>
												<td><fmt:formatDate value="${list.adjustDate}" pattern="yyyy-MM-dd" /></td>
												<td>${list.menuName}</td>
												<td>${list.totalNumber}</td>
												<td><fmt:formatNumber value="${list.totalSales}" pattern="#,###" />원</td>
											</tr>
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
	
	<script>
		
	</script>
</body>
</html>
