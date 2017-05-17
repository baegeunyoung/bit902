<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상점 정보 관리</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<style>
	#image {
		width: 500px;
		height: 500px;
		margin: 10px;
 		background-size: contain;
 		background-repeat: no-repeat;
 		background-position: center center;
		height: 50%;
	}
	#sample5_address2 {
		font-size: 25px;
	}
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
					<div class="col-md-15">
	
						<div class="card">
	                   		<div class="card-header" data-background-color="purple">
	                         	<h4 class="title">상점등록하기</h4>
								<p class="category">본인의 상점 정보를 입력하세요</p>
	                         </div>
	                         
	                   	<c:choose>
							<c:when test="${empty store.content}">
								<div class="card-content">
									<form action="${pageContext.request.contextPath}/store/write.do" name="form1" id="form1" runat="server" enctype="multipart/form-data" method="post">
										<table width="90%">
											<tr>
												<td width="5%">　</td>
												<td width="8%"></td> 
												<td width="10%">상호명</td>
												<td width="40%"><input type="text" class="form-control" id="storeName" name="storeName" placeholder="상호명을 입력하세요."></td>
												<td>　</td>
												<td style="width: 500px; text-align: right;" rowspan="8">
													<div id="image">
														<img id="blah" style="width: auto; height: auto; max-width: 400px; max-height: 400px; border-radius: 30px;"/>
													</div>
												</td>
											</tr>
											<tr>
												<td>　</td>
												<td></td>
												<td>상점 소개</td>
												<td><textarea class="form-control" rows="5" name="content" id="textArea" placeholder="상점에 대해 간단히 소개해 주세요." ></textarea></td>
												<td></td>
											</tr>
											<tr><td>　</td></tr>
											<tr>
												<td>　</td>
												<td></td>
												<td>상점 유형</td>
												<td width="10px">
													<label>
													<input type="radio" name="storeType"id="pickup" value="1" checked>
													픽업형
													</label>
													<label>
													<input type="radio" name="storeType"id="serving" value="2">
													서빙형
													</label></td>
												<td>　</td>
											</tr>
											<tr><td>　</td></tr>
											<tr>
												<td>　</td>
												<td></td>
												<td>상점 이미지</td>
												<td class="filebox">
													<label for="imgInp">이미지 등록</label>
													<input type="file" name="attachFile" id="imgInp"/>
												</td>
												<td>　</td>
											</tr>
											<tr><td>　</td></tr>
											<tr>
												<td>　</td>
												<td></td>
												<td>
													상점 주소
												</td>
												<td colspan="3">
													<div style="float: left; height:100%; display:table-cell;">
														<input type="text" id="sample5_address" name="adress" style="display: none"/>
														<input class="btn btn-default btn-lg" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" style="float: left;">
													</div>
													<div id="sample5_address2" style="float: left; height:100%; display:table-cell;"></div>
												</td>
											</tr>
											<tr><td></td></tr>
											<tr>
												<td>　</td>
												<td>　</td>
												<td colspan="5">
													<div id="map" style="width:100%; height:500px; margin-top: 10px;"></div>
													<input type="text" name="lat" id="lat" style="display: none" />
													<input type="text" name="lng" id="lng" style="display: none" />
												</td>
											</tr>
											<tr>
												<td>　</td>
												<td>　</td>
												<td>　</td>
												<td>　</td>
												<td>　</td>
												<td><button type="submit" class="btn btn-primary pull-right">등록하기</button></td>
											</tr>
										</table>
									</form>
								</div>
							</c:when>
							
							<c:otherwise>
								<div class="card-content">	    
									<form action="${pageContext.request.contextPath}/store/modify.do" name="form1" id="form1" runat="server" enctype="multipart/form-data" method="post">
										<table width="90%">
											<tr>
												<td width="5%">　</td>
												<td width="8%"></td> 
												<td width="10%">상호명</td>
												<td width="40%"><input type="text" class="form-control" id="storeName" name="storeName" value="${store.name}" placeholder="상호명을 입력하세요."></td>
												<td>　</td>
												<td style="width: 500px; text-align: right;" rowspan="8">
													<div id="image">
														<img id="blah" style="width: auto; height: auto; max-width: 400px; max-height: 400px; border-radius: 30px;"/>
													</div>
												</td>
											</tr>
											<tr>
												<td>　</td>
												<td></td>
												<td>상점 소개</td>
												<td><textarea class="form-control" rows="5" name="content" id="textArea" placeholder="상점에 대해 간단히 소개해 주세요." >${store.content}</textarea></td>
												<td></td>
											</tr>
											<tr><td>　</td></tr>
											<tr>
												<td>　</td>
												<td></td>
												<td>상점 유형</td>
												<td width="10px">
													<c:choose>
														<c:when test="${store.storeType == '1'}">
															<label>
																<input type="radio" name="storeType"id="pickup" value="1" checked>
																픽업형
															</label>
															<label>
																<input type="radio" name="storeType"id="serving" value="2">
																서빙형
															</label>
														</c:when>
														<c:otherwise>
															<label>
																<input type="radio" name="storeType"id="pickup" value="1">
																픽업형
															</label>
															<label>
																<input type="radio" name="storeType"id="serving" value="2" checked>
																서빙형
															</label>
														</c:otherwise>
													</c:choose>
												</td>
												<td>　</td>
											</tr>
											<tr><td>　</td></tr>
											<tr>
												<td>　</td>
												<td></td>
												<td>상점 이미지</td>
												<td class="filebox">
													<label for="imgInp">이미지 등록</label>
													<input type="file" name="attachFile" id="imgInp"/>
												</td>
												<td>　</td>
											</tr>
											<tr><td>　</td></tr>
											<tr>
												<td>　</td>
												<td></td>
												<td>
													상점 주소
												</td>
												<td colspan="3">
													<div style="float: left; height:100%; display:table-cell;">
														<input type="text" id="sample5_address" name="adress" style="display: none" value="${store.adress}"/>
														<input class="btn btn-primary btn-lg" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" style="float: left;">
													</div>
													<div id="sample5_address2" style="float: left; height:100%; display:table-cell;"><br>${store.adress}</div>
												</td>
											</tr>
											<tr><td></td></tr>
											<tr>
												<td>　</td>
												<td>　</td>
												<td colspan="5">
													<div id="map" style="width:100%; height:500px; margin-top: 10px;"></div>
													<input type="text" name="lat" id="lat" style="display: none" value="${store.latitude}"/>
													<input type="text" name="lng" id="lng" style="display: none" value="${store.longitude}"/>
												</td>
											</tr>
											<tr>
												<td>　</td>
												<td>　</td>
												<td>　</td>
												<td>　</td>
												<td>　</td>
												<td><button type="submit" class="btn btn-primary pull-right">수정하기</button></td>
											</tr>
										</table>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=13c9f7d27d52b0ad22774ec599c9b527&libraries=services"></script>
<script>
	var lat = '${store.latitude}';
	if(lat !== '') {
		
		var lng = '${store.longitude}';
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new daum.maps.LatLng(lng, lat), // 지도의 중심좌표
				level: 5 // 지도의 확대 레벨
			};
	
		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position: new daum.maps.LatLng(lng, lat),
			map: map
		});
	}
	else {
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
	}

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
				document.getElementById("sample5_address2").innerHTML = "<br>" + fullAddr;
				$("sample5_address2").trigger("create");
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

						console.log(coords);
						console.log(coords.gb);   //lat
						console.log(coords.hb);   //lng

						document.getElementById("lat").value = coords.gb;
						document.getElementById("lng").value = coords.hb;

					}
				});
			}
		}).open();
	}
</script>
 <script>
	$("#form1").submit(function() {

		var frm = document.form1;

		if (frm.storeName.value == "") {
			swal("이름을 입력하세요.");
			frm.storeName.focus();
			return false;
		}

	});
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
