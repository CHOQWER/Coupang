<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/mypage.css">
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>




<div class="main">
	<div id="top-nav"></div>
	<div id="side-menu">
		<ul>
			<li id="top-side">My 페이지</li>
			<li id="side-menu-list"><a href="mypage">개인정보확인/수정</a></li>
			<li id="side-menu-list"><a href="payment">결제수단 관리</a></li>
			<li id="side-menu-list"><a href="deliveryStatus">주문목록/배송조회</a></li>
			<li id="side-menu-list"><a href="membership">와우 멤버십</a></li>
			<li id="side-menu-list"><a
				href="delivery?u_id=${sessionScope.vo.u_id}">배송지 관리</a></li>
		</ul>
	</div>
	<div id="mypage-section">
		<div class="top-mypage">
			<div class="mypage">
				<form id="wowsecession" name="wowsecession">
					<c:if test="${sessionScope.vo.grade==0 }">
						<p>등 급 : 관리자</p>
					</c:if>
					<c:if test="${sessionScope.vo.grade==1 }">
						<p>등 급 : 판매자</p>
					</c:if>
					<c:if test="${sessionScope.vo.grade==2 }">
						<p>등 급 : 일반회원</p>
						<button type="button" onclick="wowbtn()">와우회원등록</button>
						<input type="hidden" name="u_id" value="${sessionScope.vo.u_id }">
					</c:if>
				</form>
				<form action="wowsecession" method="post" id="wowsecession">
					<c:if test="${sessionScope.vo.grade==3 }">
						<p>등 급 : 와우회원</p>
						<input type="submit" value="와우회원탈퇴" onclick="wowDel()">
						<input type="hidden" name="u_id" value="${sessionScope.vo.u_id }">
					</c:if>
				</form>
				<div class="promotion">
				<div class="wowpromotion">
					<img src="/resources/img/wowmembership.png">
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- </div>  -->





<script>
	function modal() { //결제창 on-off
		popup.style.display = 'block';
	}
	closebtn.addEventListener('click', function() {
		popup.style.display = 'none';
	});

	function wowbtn() {
		var confirmation = confirm("결제하시겠습니까?");
		var u_id = '${sessionScope.vo.u_id}';
		if (confirmation) {
			console.log($('#u_id'));
			var IMP = window.IMP;
			IMP.init('imp23810830');
			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(), //주문번호
				name : '${sessionScope.vo.u_name}', //상품명
				amount : 4900,/*$('.amountValue').val(),*///가격

				buyer_email : 'u_email',
				buyer_name : 'u_name',
				buyer_tel : 'u_mobile',
				buyer_addr : 'u_addr1',
				buyer_postcode : 'u_post_no',
			}, function(rsp) {
				console.log("rsp=" + rsp);
				if (rsp.success) {
					var msg = "결제가 완료되었습니다";
					alert(msg);
					console.log(rsp);

					$.ajax({
						type : 'post',
						url : '/membership',
						data : {
							"ID" : u_id
						},
						dataType : 'text',
						success : function(result) { // 결과 성공 콜백함수
							console.log(result);
							window.location.href = '/membership';
						},
						error : function(request, status, error) { // 결과 에러 콜백함수
							console.log(error)
						}
					});

				} else {
					var msg = "결제에 실패하였습니다."
					rsp.error_msg;
					location.href = "membership";
				}
				document.location.href = "redirect:membership";
			});
		} else {

		}
	}

	function wowDel() {
		var confirmation = confirm("탈퇴 하시겠습니까?");

		if (confirmation) {
			window.location.href = "redirect:membership";
		}
	}
</script>
