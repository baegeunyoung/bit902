<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/material-dashboard-free-v1.1.0/assets/css/demo.css">
<title>일일 정산 내역</title>
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
									<h4 class="title">일일 정산 내역</h4>
									<p class="category">
									<span id="cDate"><fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 " var="today"/>${today}</span>
									<i class="material-icons text-black" onclick="javascript:popupOpen();" style="cursor: pointer;">
									date_range</i></p>
								</div>
	                            <div class="card-content table-responsive">
	                                <table id="table" class="table">
	                                    <thead class="text-primary">
	                                    	<tr>
		                                    	<th>날짜</th>
		                                    	<th>상품명</th>
		                                    	<th>판매수</th>
												<th>매출액</th>
											</tr>
										</thead>
											
										<tbody id="tbody">
											<c:set var="sum" value="0" />
 											<c:forEach var="list" items="${retrieveDayAdjust}"> 
											<tr>
												<td><fmt:formatDate value="${list.dayAdjustDate}" pattern="yyyy-MM-dd" /></td>
												<td>${list.menuName}</td>
												<td>${list.dayTotalNumber}</td>
												<td><fmt:formatNumber value="${list.dayTotalSales}" pattern="#,###" />원</td>
												<c:set var="sum" value="${sum + list.dayTotalSales}" />
											</tr>
											<input type="hidden" value="${list.dayTotalSales}"/>
											</c:forEach>
										</tbody>
										<tr>
											<td colspan="3" style="text-align:center">매출액 총 합 :</td>
											<td id="sum"><fmt:formatNumber value="${sum}" pattern="#,###" />원</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						
						
						
						<!-- 상품별 매출 그래프 -->
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-chart" data-background-color="orange">
									<div class="ct-chart" id="emailsSubscriptionChart"></div>
								</div>
								<div class="card-content">
									<h4 class="title">상품별 매출액</h4>
								</div>
								<div class="card-footer">
									<div class="stats">
										일일 정산 그래프
									</div>
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
	
	$(".sidebar-wrapper.nav > li").removeClass();
	$(".sidebar-wrapper.nav:nth-child(6)").addClass('active');
	
	
	// 달력 팝업 띄우기
	function popupOpen() {
		var popUrl = "${pageContext.request.contextPath}/view/adjust/calendar.html";
	    var popOption = "width=400, height=500, resizable=yes, scrollbars=yes, status=no";
		objPopup = window.open(popUrl, "", popOption);
		objPopup.focus();
	}
	
	// 그래프 관련
	drawGraph();
	
	function drawGraph() {
		
		var rowsCount = $('#tbody tr').length;
        var arr1 = new Array(rowsCount);
        var arr2 = new Array(rowsCount);
        var highSales = 0;
        
        for (var i = 0 ; i < rowsCount ; i++) {
			
	       	arr1[i] = document.getElementById("table").rows[i + 1].cells[1].innerHTML;
	       	console.log(arr1[i]);
		    arr2[i] = parseInt(document.getElementById("table").rows[i + 1].cells[3].innerHTML.slice(0, -1).split(',').join(''));
		    console.log(arr2[i]);
        	if (highSales < arr2[i]) {
        		highSales = arr2[i];
        	}
       }
       var dataEmailsSubscriptionChart = {
         labels: arr1,
         series: [arr2]
       };
       var optionsEmailsSubscriptionChart = {
           axisX: {
               showGrid: false
            },
            low: 0,
            high: highSales + (highSales / 20),
            chartPadding: { top: 0, right: 10, bottom: 0, left: 25}
        };
        var responsiveOptions = [
          ['screen and (max-width: 1200px)', {
            seriesBarDistance: 5,
            axisX: {
              labelInterpolationFnc: function (value) {
                return value[0];
              }
            }
          }]
        ];
        var emailsSubscriptionChart = Chartist.Bar('#emailsSubscriptionChart', dataEmailsSubscriptionChart, optionsEmailsSubscriptionChart, responsiveOptions);

        //start animation for the Emails Subscription Chart
        md.startAnimationForBarChart(emailsSubscriptionChart);

	}
	
	</script>
</body>
</html>
