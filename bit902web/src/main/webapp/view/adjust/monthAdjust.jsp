<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
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
										<i class="material-icons text-black" onclick="javascript:preMonth()" style="cursor: pointer;">navigate_before</i>
										<span id="cDate"><fmt:formatDate value="${now}" pattern="yyyy년 MM월 " var="today"/>${today}</span>
										<i class="material-icons text-black" onclick="javascript:nextMonth()" style="cursor: pointer;">navigate_next</i>
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
											<c:set var="sum" value="0" />
 											<c:forEach var="list" items="${retrieveMonthAdjust}"> 
											<tr>
												<td><fmt:formatDate value="${list.monthAdjustDate}" pattern="yyyy-MM-dd" /></td>
												<td><fmt:formatNumber value="${list.monthTotalSales}" pattern="#,###" />원</td>
												<c:set var="sum" value="${sum + list.monthTotalSales}" />
											</tr>
											</c:forEach>
										</tbody>
										<tr>
											<td>월 매출액 총 합 :</td>
											<td id="sum"><fmt:formatNumber value="${sum}" pattern="#,###" />원</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						
						
						
						
						<!-- 월 누적 매출 그래프 -->
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-chart" data-background-color="orange" style="height:300px">
									<div class="ct-chart" id="emailsSubscriptionChart" style="height:300px"></div>
								</div>
								<div class="card-content">
									<h4 class="title">일별 매출액</h4>
								</div>
								<div class="card-footer">
									<div class="stats">
										월별 정산 그래프
									</div>
								</div>
							</div>
						</div>
						
						<!-- 상품별 월 매출 추이 그래프 -->
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-chart" data-background-color="green" style="height:300px">
									<div class="ct-chart" id="completedTasksChart" style="height:300px"></div>
								</div>
								<div class="card-content">
									<h4 class="title">상품별 일일 판매량 변화</h4>
								</div>
								<div class="card-footer">
									<div class="stats">
										판매 갯수 변화 추이
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
	
	// 선택되어 있는 연도와 월 추출
	var cDateText = $("#cDate").text()
	var cYear = cDateText.split("년")[0];
	var cMonth = cDateText.split("년")[1].substring(1, 3);
	
	// 매출액 1000단위마다 , 찍기
	function setComma(num) {
		if(num == null || num == ''){
			return 0;
		}
		var reg = /(^[+-]?\d+)(\d{3})/;   
		num = num.toString();                          
		while (reg.test(num))
			num = num.replace(reg, '$1' + ',' + '$2');
		return num;
	}
	
	// 이전 달로 넘어가기
	function preMonth() {
		
		if(cMonth == 1) {
			--cYear;
			cMonth = 12;
		} else {
			--cMonth;
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/adjust/monthAdjustRe.do",
			type: "POST",
			data: {cYear : cYear , cMonth : cMonth},
			dataType: "JSON"
		}).done (function (result) {
			
			// 월별정산 페이지를 선택한 달의 정산 내역으로 변경
			var html = "";
			html += "<tbody id='tbody'>\n"
			
			var sum = 0;
			
			for (var i = 0 ; i < result.length ; i++) {
				html += "<tr>\n";
				
				var date = new Date(result[i].monthAdjustDate);
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				var day = date.getDate();
				var retVal = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
				
				var totalSales = setComma(result[i].monthTotalSales);
				
				html += "<td>" + retVal + "</td>\n";
				html += "<td>" + totalSales + "원</td>\n";
				html += "</tr>\n";
				
				sum += result[i].monthTotalSales;
			}
			html += "</tbody>";
			
			// 제목 아래 날짜를 바꾸기
			var changeDateForm = cYear + "년 " + (cMonth < 10 ? "0" + cMonth : cMonth) + "월 ";
			var changeDate = "";

			var sumComma = setComma(sum) +"원";

			$(document).find("#cDate").text(changeDateForm).trigger("create");			
			
			// 바디 내용 바꾸기
			$(document).find("#tbody").replaceWith(html).trigger("create");
			$(document).find("#sum").text(sumComma).trigger("create");
			
			drawDayGraph();
			productChangeGraph();
		}).fail(function() {
			alert("월별 정산 내역 호출 실패");
		});
	}
	
	// 다음 달로 넘어가기
	function nextMonth() {
		
		if(cMonth == 12) {
			++cYear;
			cMonth = 1;
		} else {
			++cMonth;
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/adjust/monthAdjustRe.do",
			type: "POST",
			data: {cYear : cYear , cMonth : cMonth},
			dataType: "JSON"
		}).done (function (result) {
			
			// 월별정산 페이지를 선택한 달의 정산 내역으로 변경
			var html = "";
			html += "<tbody id='tbody'>\n";
			
			var sum = 0;
			
			for (var i = 0 ; i < result.length ; i++) {
				html += "<tr>\n";
				
				var date = new Date(result[i].monthAdjustDate);
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				var day = date.getDate();
				var retVal = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
				
				var totalSales = setComma(result[i].monthTotalSales);
				
				html += "<td>" + retVal + "</td>\n";
				html += "<td>" + totalSales + "원</td>\n";
				html += "</tr>\n";
				
				sum += result[i].monthTotalSales;
				console.log(sum);
			}
			html += "</tbody>";
			
			// 제목 아래 날짜를 바꾸기
			var changeDateForm = cYear + "년 " + (cMonth < 10 ? "0" + cMonth : cMonth) + "월 ";
			var changeDate = "";
			
			var sumComma = setComma(sum) +"원";
			
			$(document).find("#cDate").text(changeDateForm).trigger("create");			
			
			// 바디 내용 바꾸기
			$(document).find("#tbody").replaceWith(html).trigger("create");
			$(document).find("#sum").text(sumComma).trigger("create");
			
			drawDayGraph();
			productChangeGraph();
		}).fail(function() {
			alert("월별 정산 내역 호출 실패");
		});
	}
	
	
	
	// 일별 매출 그래프
	drawDayGraph();
	
	function drawDayGraph() {
		
		var rowsCount = $('#tbody tr').length;
        var arr1 = new Array(rowsCount);
        var arr2 = new Array(rowsCount);
        var highSales = 0;
        
        for (var i = 0 ; i < rowsCount ; i++) {
			
	       	arr1[i] = document.getElementById("table").rows[i + 1].cells[0].innerHTML.split('-')[2];
	       	console.log(arr1[i]);
		    arr2[i] = parseInt(document.getElementById("table").rows[i + 1].cells[1].innerHTML.slice(0, -1).split(',').join(''));
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
            chartPadding: { top: 0, right: 10, bottom: 0, left: 35}
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
	
	// 상품별 일 매출 추이 그래프
	productChangeGraph();
	
	function productChangeGraph() {
		
		var rowsCount = $('#tbody tr').length;
		var arr1 = new Array(rowsCount);
		
		for (var i = 0 ; i < rowsCount ; i++) {
			
			arr1[i] = document.getElementById("table").rows[i + 1].cells[0].innerHTML.split('-')[2];
		}
		
		
		dataCompletedTasksChart = {
	            labels: arr1,
	            series: [
	                [230, 750, 450, 300, 280, 240, 200, 190],
	                [430, 298, 492, 354, 523, 245, 244, 233],
	                [452, 563, 123, 142, 321, 423, 213, 235]
	            ]
	        };
	
	        optionsCompletedTasksChart = {
	            lineSmooth: Chartist.Interpolation.cardinal({
	                tension: 0
	            }),
	            low: 0,
	            high: 1000, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
	            chartPadding: { top: 0, right: 0, bottom: 0, left: 0}
	        }
	
	        var completedTasksChart = new Chartist.Line('#completedTasksChart', dataCompletedTasksChart, optionsCompletedTasksChart);
	
	        // start animation for the Completed Tasks Chart - Line Chart
	        md.startAnimationForLineChart(completedTasksChart);
	}
	</script>
</body>
</html>
