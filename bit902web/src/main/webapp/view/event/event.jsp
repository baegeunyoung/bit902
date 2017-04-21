<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
									<h4 class="title">이벤트관리</h4>
									<p class="category">
									<span id="cDate">이벤트관리</span>
									</p>
								</div>
	                            <div class="card-content table-responsive">
	                              <form method="post" action="">
										
										<div class="form-group">
							      <label for="textArea" class="col-lg-2 control-label">Textarea</label>
							      <div class="col-lg-10">
							        <textarea class="form-control" rows="5" name="content" id="textArea" placeholder="상점의 간단한 소개를 해주세요"></textarea>
							        <span class="help-block">상점의 간단한 소개를 해주세요</span>
							      </div>
							    </div>
										<button class="btn btn-primary pull-right">등록하기</button>   
									</form>
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
