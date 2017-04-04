<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">

	<div>
		<c:import url="../../include/sidebar.jsp" />
	</div>
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
	             	<div class="col-md-15">
	                 	<div class="card">
	                   		<div class="card-header" data-background-color="purple">
	                         	<h4 class="title">메뉴등록하기</h4>
								<p class="category">상점의 메뉴를 등록해주세요</p>
	                         </div>
	                       	  <div class="card-content">	                            
								<form class="form-horizontal" action="" id="form1" runat="server" enctype="multipart/form-data" method="post">
								<div class="row">
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">메뉴명</label>
													<input type="text" class="form-control" >
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">가격</label>
													<input type="text" class="form-control" >
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">크기</label>
													<input type="text" class="form-control" >
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">메뉴이미지</label>
													<input type="text" class="form-control" >
												</div>
	                                        </div>
	                                    </div>
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