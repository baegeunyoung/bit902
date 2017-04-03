<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	             	<div class="col-md-10">
	                 	<div class="card">
	                   		<div class="card-header" data-background-color="purple">
	                         	<h4 class="title">상점등록하기</h4>
								<p class="category">본인의 상점 정보를 입력하세요</p>
	                         </div>
						<div class="card-content">	                            
							<form class="form-horizontal">
							  <fieldset>
							    <div class="form-group">
							      <label for="inputEmail" class="col-lg-2 control-label">상호명</label>
							      <div class="col-lg-10">
							        <input type="text" class="form-control" id="inputEmail" placeholder="상호명을입력하세요">
							      </div>
							    </div>
							    <div class="form-group">
							      <label for="textArea" class="col-lg-2 control-label">Textarea</label>
							      <div class="col-lg-10">
							        <textarea class="form-control" rows="3" id="textArea" placeholder="상점의 간단한 소개를 해주세요"></textarea>
							        <span class="help-block">상점의 간단한 소개를 해주세요</span>
							      </div>
							    </div>
							    <div class="form-group">
							      <label class="col-lg-2 control-label">상점유형</label>
							      <div class="col-lg-10">
							        <div class="radio">
							          <label>
							            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
							            픽업형
							          </label>
							        </div>
							        <div class="radio">
							          <label>
							            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
							            서빙형
							          </label>
							        </div>
							      </div>
							    </div>
							      <div>
							       <label class="col-lg-2 control-label">상점대표이미지</label>
							      <input type="file" name="attachFile"/>
							    </div>
							     <button type="submit" class="btn btn-primary pull-right">등록하기</button>
								 <div class="clearfix"></div>
							  </fieldset>
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



