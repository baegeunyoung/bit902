<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		                                    	<th>테이블번호</th>
		                                    	<th>주문내역</th>
												<th>주문시간</th>
												<th>현재상태</th>
												<th>특이사항</th>
												<th>알림보내기</th>
											</tr>
										</thead>
											
										<tbody id="tbody">
											<tr>
		                                    	<td>주문번호</td>
		                                    	<td>테이블번호</td>
		                                    	<td>주문내역</td>
												<td>주문시간</td>
												<td>현재상태</td>
												<td>특이사항</td>
												<td>
													<button type="button">접수확인</button>
													<button type="button">조리완료</button>
												</td>
											</tr>
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
</body>
</html>
