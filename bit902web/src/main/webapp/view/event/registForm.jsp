<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:include page="../../include/baseInclude.jsp" flush="true"></jsp:include>
<title>이벤트 관리</title>
<style>
	.filebox label {
		display: inline-block;
		padding: .5em .75em;
		color: #fff;
		font-size: 13px;
		line-height: normal;
		vertical-align: middle;
		background-color: #9c27b0;
		cursor: pointer;
		border: 1px solid #9c27b0;
		border-bottom-color: #9c27b0;
		border-radius: .25em;
	}
	.filebox input[type="file"] {
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0;
	}
</style>
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
								
								<c:choose>
									<c:when test="${empty event.eventContent}">
			                            <div class="card-content table-responsive">
			                              <form method="post" action="${pageContext.request.contextPath}/event/regist.do" enctype="multipart/form-data">
										<div class="form-group">
									      <label for="title" class="col-lg-2 control-label">제목</label>
									      <div class="col-lg-10">
									        <textarea class="form-control" rows="2" name="title" id="title" placeholder="이벤트 제목을 적어주세요." ></textarea>
									      </div>
									      <label for="content" class="col-lg-2 control-label"> 내용</label>
									      <div class="col-lg-10">
									        <textarea class="form-control" rows="5" name="content" id="content" placeholder="이벤트 내용을 적어주세요." ></textarea>
									      </div>
									    </div>
							      		  <label class="col-lg-2 control-label">이벤트이미지</label>
									      <div class="filebox">
												<label for="imgInp">이미지 등록</label>
												<input type="file" name="attachFile" id="imgInp"/>
										  </div>
												<button class="btn btn-primary pull-right">저장</button>   
											</form>
										</div>
									</c:when>
									<c:otherwise>
										<div class="card-content table-responsive">
			                              <form method="post" role="form">
										<div class="form-group">
									      <label for="textArea" class="col-lg-2 control-label">Textarea</label>
									      <div class="col-lg-10">
									        <textarea class="form-control" rows="5" name="title" id="textArea" placeholder="이벤트 제목을 적어주세요." >${event.eventTitle}</textarea>
									        <textarea class="form-control" rows="5" name="content" id="textArea" placeholder="이벤트 내용을 적어주세요." >${event.eventContent}</textarea>
									      </div>
									    </div>
												<button type="submit" class="btn btn-primary pull-right" id="delete">삭제</button>   
											</form>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:import url="../../include/footer.jsp" />
		</div>
	</div>
<script>
	if('${msg}'){
		alert('${msg}');
	}
	
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		console.log(formObj);

		$("#modify").on("click", function() {
			formObj.attr("action", "/bit902web/event/modify.do");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$("#delete").on("click", function() {
			formObj.attr("action", "/bit902web/event/delete.do");
			formObj.submit();
		});
	});
</script>
</body>
</html>
