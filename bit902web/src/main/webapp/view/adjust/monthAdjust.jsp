<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<br>
							<div class="card">
								<div class="card-header" data-background-color="purple">
									<h4 class="title">월별 정산 내역</h4>
									<p class="category">
										<i class="material-icons text-black" onclick="" style="cursor: pointer;">navigate_before</i>
										<span id="cDate"></span>
										<i class="material-icons text-black" onclick="" style="cursor: pointer;">navigate_next</i>
									</p>
								</div>
	                            <div class="card-content table-responsive">
	                                <table id="table" class="table">
	                                    <thead class="text-primary">
	                                    	<tr>
	                                    	<th>날짜</th>
											<th>매출액</th>
											</tr>
										</thead>
										<tbody id="tbody">
 											<c:forEach var="list" items="${retrieveDayAdjust}"> 
											<tr>
												<td><fmt:formatDate value="${list.adjustDate}" pattern="yyyy-MM-dd" /></td>
												<td><fmt:formatNumber value="${list.totalSales}" pattern="#,###" />원</td>
											</tr>
											</c:forEach>
										</tbody>
										<tr>
											<td colspan="3" style="text-align:center">매출액 총 합 :</td>
											<td id="sum"></td>
										</tr>
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
		
	// 첫화면에 오늘 월 출력
	var date = new Date();
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var currentDate = y + "년 " + (m < 10 ? "0" + m : m) + "월 ";
	document.getElementById('cDate').innerHTML = currentDate;
	
	</script>
</body>
</html>