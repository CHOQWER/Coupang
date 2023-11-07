<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/include/aside.jsp"%>
<html>
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet"> -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script type="text/javascript" src="/resources/js/common.js"></script>
<!-- Style -->
<link rel="stylesheet" href="/resources/css/buystyle.css">
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/main.js"></script>
<!-- <link rel="stylesheet" href="/resources/css/fontstyle.css">-->
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/sellerstyle.css">
<link rel="stylesheet" href="/resources/css/sellerpage.css">
<head>


<script type="text/javascript">
function openPop(pno) {
    var popup = window.open('/sellerUpdateProduct?pno=' + pno , '', 'width=1100px,height=700px,scrollbars=yes');
}
</script>
</head>


<body>
	<form action="sellerSelectMineProduct" method="post" id="productForm">
		<div class="seller-main">
			 <div class="mypage"> 
			<div class="content">
				<!-- <div class="container"> -->
				<h1>등록제품목록</h1>
				<div class="btn">
					<button type="submit" class="btn btn-success">상품 삭제</button>
				</div>
				<div class="table-responsive custom-table-responsive">
					<table class="table custom-table">
						<thead>
							<tr>
								<th scope="col" ><label class="control control--checkbox">
										<input type="checkbox" class="js-check-all" />
										<div class="control__indicator"></div>
								</label></th>
								
								<th scope="col">상품번호</th>
								<th scope="col" class="sellerId">판매자ID</th>
								<th scope="col">제조회사</th>
								<th scope="col">상품명</th>
								<th scope="col">가격</th>
								<th scope="col">할인가</th>
								<th scope="col">재원</th>
								<th scope="col">색상</th>
								<th scope="col">재고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="BL">
								<c:set var="Content" value="${BL.content }" />
								<c:set var="pname" value="${BL.pname }" />
								<tr scope="row">
									<th scope="row"><label class="control control--checkbox">
											<input type="checkbox" id="pno" class="pno" name="pno"
											value="${BL.pno}"></input>
											<div class="control__indicator"></div>
									</label></th>
									
									<td>${BL.pno }</td>
									<td id="u_id" class="u_id">${BL.u_id}</td>
									<td id="company" class="company">${BL.company}</td>
									<td><button type="button" target="_blank"
											onclick="openPop(${BL.pno})">${fn:substring(pname,0,15)}...</button></td>
									<td><fmt:formatNumber value="${BL.price}" type="currency"
											currencySymbol="">
										</fmt:formatNumber></td>
									<td><fmt:formatNumber value="${BL.dis_price}"
											type="currency" currencySymbol="">
										</fmt:formatNumber></td>
									<td>${fn:substring(Content,0,45)}...</td>
									<td>${BL.color}</td>
									<td>${BL.qty}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!--  </div> -->
			</div>
			 </div> 
		</div>





	</form>

</body>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/main.js"></script>
<script src="/resources/js/popper.min.js"></script>
</html>