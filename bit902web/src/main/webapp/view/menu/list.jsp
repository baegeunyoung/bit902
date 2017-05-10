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
								<form class="form-horizontal" action="javascript:writeform()" id="wForm" runat="server" enctype="multipart/form-data" method="post">
								<div  class="row" id="menu"  >
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">메뉴명</label>
													<input type="text" class="form-control" name="menuName" >
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">내용</label>
													<input type="text" class="form-control" name="content" >
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">가격</label>
													<input type="text" class="form-control" name="price" >
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">사이즈</label>
													<input type="text" class="form-control" name="size">
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div >
													<label class="control-label">메뉴이미지</label>
													<input type="file" name="attachFile" id="imgInp">
												</div>
	                                        </div>
	                               			<div><img id="blah"  style="width:300px;height:150px;"/></div>
	                               </div>
	                               <button type="submit" class="btn btn-primary pull-right">등록하기</button>    
								   </form>
								</div>
	                    	 </div>
	          			 </div>
	       			 </div>
	      		 </div>
<!----------------------------------------리스트 UI----------------------------------------------------------------------->
	  				  <div class="col-md-12">
	                     <div class="card card-plain">
	                         <div class="card-header" data-background-color="purple">
	                              <h4 class="title">메뉴 수정,삭제하기</h4>
	                              <p class="category">상점의 메뉴를 확인하세요</p>
	                          </div>
	                            <div class="card-content table-responsive">
	                            <form action='/bit902web/menu/update.do' class="form-horizontal" enctype='multipart/form-data' method='post'>
	                                <table class="table table-hover">
	                                    <thead class="text-primary">
	                                        <th>메뉴사진</th>
	                                    	<th>메뉴명</th>
	                                    	<th>사이즈</th>
	                                    	<th>가격</th>
	                                    	<th>설명</th>
	                                    	<th>수정/삭제</th>
	                                    </thead>
	                                    <tbody id="list">
	                                    </tbody>
	                                </table>
	                           </form>
	                            </div>
	                        </div>
	                    </div>
	  	 			 </div>
				</div>
			</div>
<script>
makeMenu();

//메뉴리스트 공통항목
function makeMenu(){
	
	var sellerNo = ${seller.sellerNo};
	
	$.ajax({
		type:"POST",
		url : "/bit902web/menu/list.do",
		dataType: "JSON"
	})
	.done(function (result){
		
		var html = "";
		
		var menus = result.menu;
		var file = result.menuFile;
		
		console.log(menus.length);
		console.log(file.length);
		
		for(var i=0; i < menus.length; i++){
  		console.log("메뉴:" + menus[i].menuNo);
		html+= "<tr id='tr" + menus[i].menuNo + "' style='height:100px;width:100%''>";
			
				html += "<td>";
			for(var j=0; j < file.length; j++){
				if(menus[i].menuNo == file[j].menuNo){
 			console.log("파일:" + file[j].menuNo);
		html+=                  	"<img src='/bit902web/upload"+file[j].filePath+"/"+file[j].systemName + "'style='height: 100px; width: 100px;'>";
				}
			}
			html += "</td>";
		html+=                      "<td>"+menus[i].name+"</td>";
		html+=                      "<td>"+menus[i].size+"</td>";
		html+=                      "<td>"+menus[i].price+"원</td>";
		html+=                     	"<td>"+menus[i].content+"</td>";
		html+=                     	"<td><a href='javascript:menuUpdateForm(" + menus[i].menuNo + ")' role='button'>수정 / </a><a href='javascript:menuDelete(" + menus[i].menuNo + ")' role='button'>삭제</a></td>" ;                   
		html+=                    "</tr>";
			
		}
		if (menus.length == 0) {
			html += '등록된메뉴가없습니다';
		}
		$("#list").html(html);
		
	});	
}
//메뉴 수정폼 
  	function menuUpdateForm(menuNo){
  		$.ajax({
  			type:"POST",
  			url : "/bit902web/menu/updateForm.do",
  			dataType: "JSON",
  			data: {menuNo : menuNo}
  		}).done(function (result){
		var html="";
  	
		
// 		html+= "<form action='/bit902web/menu/update.do' enctype='multipart/form-data' method='post'>";
		html+=				 "<tr id='tr" + result.menu[0].menuNo + "' style='height:100px;width:100%'>";
		html+=                  	"<td><img src='/bit902web/upload"+result.menufile[0].filePath+"/"+result.menufile[0].systemName + "'style='height: 100px; width: 100px;'></td>";
		html+=                      "<input type='hidden' name='menuNo' value='"+result.menu[0].menuNo+"'>";
		html+=                      "<td>"+"<input type='text' class='form-control' name='name' value='"+result.menu[0].name+"'></td>";
		html+=                      "<td>"+"<input name='size'class='form-control' value='"+result.menu[0].size+"'></td>";
		html+=                      "<td>"+"<input name='price'class='form-control' value='"+result.menu[0].price+"'></td>";
		html+=                     	"<td>"+"<input name='content' class='form-control' value='"+result.menu[0].content+"'></td>";
		html+=                     	"<td><button>수정</button></td>";              
		html+=              "</tr>";
//   		html+= "</form>";
  	
		$('#tr' + result.menu[0].menuNo).replaceWith(html).trigger("create");

  		}).
  		
  		fail(function(jqXhr, testStatus, errorText){
			alert("에러발생1 :" + errorText);
  		});
}


//메뉴 삭제
	function menuDelete(menuNo) {
		$.ajax({
			url: "/bit902web/menu/delete.do",
			data: {menuNo: menuNo}
		}).done(function () {
			alert("삭제되었습니다.");
			makeMenu();
		});	
	}

//메뉴 작성폼
function writeform(){
	var fd = new FormData();
	//서버에 전송할 대상값들을 넣어주면됨(파일이 여러개라면 파일이름을 쪼개야함)
	//서브밋하기위한 폼데이터 설정
	fd.append("menuName", $("[name=menuName]").val());
	fd.append("content", $("[name=content]").val());
	fd.append("price", $("[name=price]").val());
	fd.append("size", $("[name=size]").val());
	fd.append("attachFile",$("[name=attachFile]")[0].files[0]);
	
	$.ajax({
		url: "/bit902web/menu/write.do",
		data: fd, 
		type: "POST",
		processData: false,  //기본방식 쓰지마요
		contentType: false
	})
		.done(function (result){
			alert("메뉴가 등록이 완료되었습니다.");
			makeMenu();
		})
		.fail(function(jqXhr, testStatus, errorText){
			alert("에러발생1 :" + errorText);
});
	
	}

//이미지미리보기
$(function() {
    $("#imgInp").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    }
}



</script>
</body>
</html>
