/**
 * bookForm.html에 연결할 js 파일 
 */	

	
		$("#roomImg").click(function () {
			timeChk();
		}); 
		
		// 예약시간 체크함수
		function timeChk() {
			$.ajax({
				url : "book/timeCheck.do",
				dataType : "json"
			})
			.done(function (result) {
				if(result.length === 0) {
					$("#buyerList").html("");
					swal("사용자가없습니다.");
					
				}
				else {
					console.dir(result);
					var html = "";
					for(i = 0; i < result.length; i++) {
						html += "<p> 구매자번호 : " + result[i].buyerNo + " 이름 : " + result[i].name + " 비밀번호 : " + result[i].password +  " </p>";
					}
					swal("사용자 정보를 확인해 주세요.");
					$("#buyerList").html(html);
				}
			})
		}
		
		
	
		