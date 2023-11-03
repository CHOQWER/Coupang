<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<body>	

 
 
<form action="membership" method="post">
	<input type="hidden" name="u_id" value="${sessionScope.vo.u_id }">
</form>




<script type="text/javascript">
	var IMP = window.IMP;
	IMP.init('imp23810830');
	var msg;
	
	IMP.request_pay({
		pg : "kakaopay",
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '${sessionScope.vo.u_name}',
		amount : 4900,
		buyer_email : 'u_email',
		buyer_name : 'u_name',
		buyer_tel : 'u_mobile',
		buyer_addr : 'u_addr1',
		buyer_postcode : 'u_post_no',
		/* m_redirect_url : 'mypage' */
	}, function(rsp) {
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			alert(msg);
			console.log(rsp);
			
			$.ajax({
            	type : 'post',
            	url : 'membership',
            });		
		} else {
			var msg = '결제에 실패하였습니다.';			            
			rsp.error_msg;
			location.href="/";
		}
	});
		
</script>
</body>
