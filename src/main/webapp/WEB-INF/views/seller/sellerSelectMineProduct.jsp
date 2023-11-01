<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/fontstyle.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/sellerstyle.css">
<link rel="stylesheet" href="/resources/css/sellerpage.css">
<head>
<style>
#top-button, .table table-sm table-bordered {
	display: flex;
	justify-content: right;
	padding: 10px;
}
</style>

<script type="text/javascript">
function openPop(pno) {
    var popup = window.open('/sellerUpdateProduct?pno=' + pno , '', 'width=700px,height=800px,scrollbars=yes');
}
</script>
</head>


<body>
				
	<form action="sellerSelectMineProduct" method="post" id="productForm">
		<div class="btn">
			<button type="submit" class="btn btn-success">상품 삭제</button>
		</div>
		<div class="seller-main">
			<div id="top-nav"></div>
			<div id="side-menu">
				<ul>
					<li id="top-side">판매자 메뉴</li>
					<li id="side-menu-list"><a href="#">등록 상품 내역</a></li>
					<li id="side-menu-list"><a href="#">상품등록</a></li>
					<li id="side-menu-list"><a href="#">판매내역</a></li>
					<li id="side-menu-list"><a href="#">판매관리</a></li>
					<li id="side-menu-list"><a href="#">새로운메뉴</a></li>
				</ul>
			</div>
			<div id="mypage-section">
				<div class="top-mypage">
					<div class="mypage">
						<div class="content">
							<div class="container">
								<h2 class="mb-5"></h2>
								<div class="table-responsive custom-table-responsive">
									<table class="table custom-table">
										<thead>
											<tr>
												<th scope="col"><label
													class="control control--checkbox"> <input
														type="checkbox" class="js-check-all" />
														 <div class="control__indicator"></div>
												</label></th>
												<th scope="col">번호</th>
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
											<c:forEach items="${list}" var="BL" varStatus="status">
											<c:set var="Content" value="${BL.content }"/>
											<c:set var="pname" value="${BL.pname }"/>
												<tr scope="row">
													<th scope="row"><label
														class="control control--checkbox"> <input
															type="checkbox" id="pno" class="pno" name="pno"
															value="${BL.pno}"></input>
															<div class="control__indicator"></div>
													</label></th>
													<td>${status.index}</td>
													<td>${BL.pno }</td>
													<td id="u_id" class="u_id">${BL.u_id}</td>
													<td id="company" class="company">${BL.company}</td>
													<td><button type="button" target="_blank"
															onclick="openPop(${BL.pno})">${fn:substring(pname,0,10)}...</button></td>
													<td><fmt:formatNumber value="${BL.price}"
															type="currency" currencySymbol="">
														</fmt:formatNumber></td>
													<td><fmt:formatNumber value="${BL.dis_price}"
															type="currency" currencySymbol="">
														</fmt:formatNumber></td>													
													<td>${fn:substring(Content,0,28)}...</td>
													
													<td>${BL.color}</td>
													<td>${BL.qty}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




	</form>

</body>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/main.js"></script>
<script src="/resources/js/popper.min.js"></script>
</html>