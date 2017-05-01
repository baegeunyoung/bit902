<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="../../js/jquery-3.1.1.js"></script>
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
			                              <form method="post" action="${pageContext.request.contextPath}/event/regist.do">
										<div class="form-group">
									      <label for="textArea" class="col-lg-2 control-label">이벤트제목</label>
									      <div class="col-lg-10">
									        <textarea class="form-control" rows="5" name="title" id="textArea" placeholder="이벤트 제목을 적어주세요." ></textarea>
									        <span class="help-block">이벤트 제목을 적어주세요.</span>
									      <label for="textArea" class="col-lg-2 control-label">이벤트내용</label>
									      <div class="col-lg-10">
									        <textarea class="form-control" rows="5" name="content" id="textArea" placeholder="이벤트 내용을 적어주세요." ></textarea>
									        <span class="help-block">이벤트 내용을 적어주세요.</span>
									      </div>
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
									        <span class="help-block">이벤트 제목을 적어주세요.</span>
									        <textarea class="form-control" rows="5" name="content" id="textArea" placeholder="이벤트 내용을 적어주세요." >${event.eventContent}</textarea>
									        <span class="help-block">이벤트 내용을 적어주세요.</span>
									      </div>
									    </div>
												<button type="submit" class="btn btn-primary pull-right" id="modify">수정</button>
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
		</div>
	</div>
<script>
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
