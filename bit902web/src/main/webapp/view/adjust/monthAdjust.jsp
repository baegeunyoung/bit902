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
										<i class="material-icons text-black" onclick="javascript:preMonth()" style="cursor: pointer;">navigate_before</i>
										<span id="cDate"></span>
										<i class="material-icons text-black" onclick="${pageContext.request.contextPath}/adjust/monthAdjustRe.do" style="cursor: pointer;">navigate_next</i>
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
												<td><fmt:formatDate value="${list.adjustMonthDate}" pattern="yyyy-MM-dd" /></td>
												<td><fmt:formatNumber value="${list.totalMonthSales}" pattern="#,###" />원</td>
												<c:set var="sum" value="${sum + list.totalMonthSales}" />
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
	
	// 선택되어 있는 연도와 월 추출
	var cDateText = $("#cDate").text()
	var cYear = cDateText.split("년")[0];
	var cMonth = cDateText.split("년")[1].substring(1, 3);
	
	// 이전 달로 넘어가기
	function preMonth() {
		
		if(cMonth == 1) {
			cYear--;
			cMonth = 12;
		} else {
			cMonth--;
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
				
				var date = new Date(result[i].adjustMonthDate);
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				var day = date.getDay() + 2;
				var retVal = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
				var totalSales = setComma(result[i].totalSales);
				
				html += "<td>" + retVal + "</td>\n";
				html += "<td>" + result[i].totalMonthSales + "원</td>\n";
				html += "</tr>\n";
				
				sum += parseInt(result[i].totalSales);
				console.log(sum);
			}
			html += "</tbody>";
			
			var sumComma = setComma(sum) +"원";
			(month < 10 ? "0" + month : month)
			// 제목 아래 날짜를 바꾸기
			if(typeof cMonth != "undefined") {
				var changeDateForm = cYear + "년 " + (cMonth < 10 ? "0" + month : month) + "월 ";			
			} else {
				var changeDateForm = "SMART PAY에 등록하기 전입니다.";
			}
			var changeDate = "";
			
			changeDate += "<p class='category'>\n";
			changeDate += "<i class='material-icons text-black' onclick='javascript:preMonth()' style='cursor: pointer;'>navigate_before</i>\n";
			changeDate += "<span id='cDate'></span>\n";
			changeDate += "<i class='material-icons text-black' onclick='${pageContext.request.contextPath}/adjust/monthAdjustRe.do' style='cursor: pointer;'>navigate_next</i>\n";
			changeDate += "</p>";
			
			$(document).find(".category").replaceWith(changeDate).trigger("create");
			$(document).find("#cDate").text(changeDateForm).trigger("create");			
			
			// 바디 내용 바꾸기
			$(document).find("#tbody").replaceWith(html).trigger("create");
			$(document).find("#sum").text(sumComma).trigger("create");
		}).fail(function() {
			alert("일일 정산 내역 호출 실패");
		});
	}
	
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
	</script>
</body>
</html>