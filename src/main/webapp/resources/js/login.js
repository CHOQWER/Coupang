
	/*************************************************************
	 * 파라미터 디코딩 // Usage: b64_to_utf8('4pyTIMOgIGxhIG1vZGU='); // "✓ à la mode"
	 *************************************************************/
	function b64_to_utf8(str) {
		return decodeURIComponent(escape(window.atob(str)));
	}

	/*=======================
	 * 주소검색 api
	=======================*/
	function jusoPopup() {
		popWindow = window.open(
				"http://127.0.0.1:8983/app/search/urlJusoSearch.do", "pop",
				"width=450,height=600, scrollbars=yes, resizable=yes");
	}

	/*=======================
	 * iframe 이벤트 리스너
	=======================*/
	window.addEventListener("message", receiveMessage, false);

	/*=======================
	 * 메시지 이벤트
	=======================*/
	function receiveMessage(event) {
		// 주소 api서버의 주소를 확인후 주소 api 서버가 아니면 리턴
		//if (event.origin !== "http://192.168.0.83:8983") return;

		// event.data == message
		//console.log(event.data);

		//base64를 디코딩후 Json변환
		var juso = JSON.parse(b64_to_utf8(event.data));

		console.log(juso)
		setJuso(juso);

		//팝업창 닫기
		popWindow.close();

	}

	/*=======================
	 * 받아온 주소 입력
	=======================*/
	function setJuso(juso) {
		$("#addr1").val(juso.roadFullAddr);
		$("#postno").val(juso.zipNo);

	}
	/*=======================
	 * 비밀번호,이용약관 체크 후 전송
	 =======================*/
	function inputCheck() {
		let pass = $("#pass").val();
		let re_pass = $("#re_pass").val();
		//비밀번호 확인 : 비밀번호 다르면 return false;
		if (pass !== re_pass) {
			$("#pass").val("");
			$("#re_pass").val("");
			$("#pass").focus();
			alert("비빌번호가 일치하지 않습니다. 확인하세요!")
			return false;
		}
		//이용약관 체크
		if (!$('#agree-term').is(':checked')) {
			alert("이용약관 동의해 주세요.")
			return false;
		}
		//이상없으면 
		return true;
	}
	//아이디 중복검사	
	$(function(){
    $("#checkId").click(function(){    
        let u_id = $("#u_id").val();         
        $.ajax({
            type:'post', //post 형식으로 controller 에 보내기위함!!
            url:"/member/idCheck.do", // 컨트롤러로 가는 mapping 입력
            data: {"u_id":u_id}, // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
            success: function(data){ 
                if(data == "N"){ // 만약 성공할시
                    result = "사용 가능한 아이디입니다.";
                    $("#result_checkId").html(result).css("color", "green");
                    $("#u_pwd").trigger("focus");
             }else{ // 만약 실패할시
                 result="이미 사용중인 아이디입니다.";
                     $("#result_checkId").html(result).css("color","red");
                     $("#u_id").val("").trigger("focus");
             }
                 
         },
            error : function(error){alert(error);}
        });
        
    });
    
});