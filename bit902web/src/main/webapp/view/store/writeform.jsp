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
  <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
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
							<form class="form-horizontal" action="write.do "id="form1" runat="server" enctype="multipart/form-data" method="post">
							  <fieldset>
							    <div class="form-group">
							      <label for="storeName" class="col-lg-2 control-label">상호명</label>
							      <div class="col-lg-10">
							        <input type="text" class="form-control" id="storeName" name="stroeName" placeholder="상호명을입력하세요">
							      </div>
							    </div>
							    <div class="form-group">
							      <label for="textArea" class="col-lg-2 control-label">Textarea</label>
							      <div class="col-lg-10">
							        <textarea class="form-control" rows="5" id="textArea" placeholder="상점의 간단한 소개를 해주세요"></textarea>
							        <span class="help-block">상점의 간단한 소개를 해주세요</span>
							      </div>
							    </div>
							    <div class="form-group">
							      <label class="col-lg-2 control-label">상점유형</label>
							      <div class="col-lg-10">
							        <div class="form-group">
							          <label>
							            <input type="radio" name="storeType" id="pickup" value="1" checked="">
							            픽업형
							          </label>
							        </div>
							        <div class="form-group">
							          <label>
							            <input type="radio" name="storeType" id="serving" value="2">
							            서빙형
							          </label>
							        </div>
							      </div>
							    </div>
							     <div>
							       <label class="col-lg-2 control-label">상점대표이미지</label>
							         <input type="file" name="attachFile" id="imgInp"/>
							    </div>
							    <div class="form-group">
							      <label for="adress" class="col-lg-2 control-label">주소</label>
							      <div class="col-lg-10">
							        <input class="form-control" type="text" id="sample5_address"  placeholder="주소">
							        <input class="btn btn-default btn-lg btn-block" type="button"  onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
							        <div id="map" style="width:300px;height:300px;margin-top:10px;border:dotted 3px purple; float:left;" ></div>
<!-- 							        <div id="map" style="width:300px;height:300px;margin-top:10px;display:none; float:left" ></div> -->
							         <div><img id="blah"  style="width:300px;height:300px;margin-top:10px; border:dotted 3px purple"/></div><br>
<!-- 							         <div><img id="blah" src="#" alt="대표이미지"  style="width:300px;height:300px;margin-top:10px; border- " /></div><br> -->
							      </div>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=13c9f7d27d52b0ad22774ec599c9b527&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                     	
                        console.log(coord);
                    }
                });
            }
        }).open();
    }
</script>
    <script>
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



