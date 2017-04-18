<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	form {
		display: inline;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
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
									<h4 class="title">미 승인자 명단</h4>
									<p class="category">
									<span id="cDate">허가 여부를 결정하여 주세요.</span>
									</p>
								</div>
	                            <div class="card-content table-responsive">
	                                <table id="table" class="table">
	                                    <thead class="text-primary">
	                                    	<tr>
		                                    	<th>아이디</th>
		                                    	<th>이름</th>
		                                    	<th>핸드폰 번호</th>
												<th>허가 여부 결정</th>
											</tr>
										</thead>
											
										<tbody id="tbody">
 											<c:forEach var="list" items="${NoPermitList}"> 
												<tr>
													<td>${list.id}</td>
													<td>${list.name}</td>
													<td>${list.cellphoneNumber}</td>
													<td>
														<form name="permit" action="${pageContext.request.contextPath}/admin/permit.do" method="post">
															<input type="hidden" name="permitNo" id="permitNo" value="${list.sellerNo}" />
															<button type="submit" class="btn btn-primary">승인</button>
														</form>
														<form name="refuse" action="${pageContext.request.contextPath}/admin/refuse.do" method="post">
															<input type="hidden" name="refuseNo" id="refuseNo" value="${list.sellerNo}" />
															<button type="submit" class="btn btn-primary">거절</button>
														</form>
													</td>
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
		</div>
	</div>
</body>
</html>
