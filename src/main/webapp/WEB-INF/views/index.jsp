<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿠팡!</title>
<link rel="stylesheet" href="/resources/css/index.css">
<link rel="shortcut icon"
	href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico"
	type="image/x-icon" />
<link rel="stylesheet" href="/resources/css/footer.css">
</head>

<body>
	<nav class="top-nav">

		<ul class="right-nav">
			<li><a href="">로그인</a></li>
			<li><a href="">회원가입</a></li>
		</ul>
	</nav>

	<header>
		<section>
			<div class="catagory-menu">
				<a href=""><img src="/resources/icon/catagory.png" alt=""></a>
				<div class="dropmenu">
					<c:forEach items="${catelist}" var="cate">
					 	<a href="#">${cate.get('name')}</a>
						<!-- 카테고리에 대한 하위 서브카테고리 표시 -->
						<ul>
							<c:forEach items="${cate.get('subcates')}" var="sub">
									<li><a href="ProductList?sca_no=${sub.get('sno')}&pageNum=${pmaker.cri.pageNum}">${sub.get('sname')}</a></li>						
							</c:forEach> 
						</ul>
					</c:forEach>
				</div>
			</div>


			<div class="logo">
				<a href="index.html"><img
					src="/resources/img/logo_coupang_w350.png" alt="브랜드로고"
					width="174px"></a>
			</div>

			<!--main 검색-->
			<div class="search-bar">
				<form action="#" method="">
					<div class="search-box">
						<select>
							<option value="menu1">상품명</option>
							<option value="menu2">회사명</option>
						</select> <input type="text" placeholder="찾고 싶은 상품을 검색해보세요!">
						<button type="submit" class="search-button">
							<img src="/resources/icon/search.png" alt="검색">
						</button>
					</div>
				</form>
			</div>
			<!--main 검색 끝-->

			<ul class="icon-menu">
				<li><a href="#"> <img src="/resources/icon/2815428.png"
						alt="마이폐이지" style="width: 30px;"> <span>마이쿠팡</span>
				</a></li>

				<li><a href=""> <img src="/resources/icon/cart.png"
						alt="장바구니"> <span>장바구니</span>
				</a></li>
			</ul>

		</section>
		<nav>
			<ul class="menu">
				<ul class="gnb-menu-scroll">
					<li class="gnb-menu-item"><a href="" class=""> <img
							class="" src=""> <span>로켓배송</span>
					</a></li>



					<li><a href="">이벤트/쿠폰</a></li>
				</ul>
		</nav>
	</header>

	<!--header 끝-->
	<main>
		<div class="slider">
			<img src="/resources/img/할인이벤트.jpg" alt="">

		</div>
	</main>




	<!-- footer 시작 -->
	<div id='wrap'>
		<footer>
			<div>
				<nav>
					<ul class="footer-layer1">
						<li><a href='#' target='_blank'>회사소개</a></li>
						<li><a href='#' target='_blank'>Investor Relations</a></li>
						<li><a href='#' target='_blank'>인재채용</a></li>
						<li><a href='#' target='_blank'>입점 / 제휴문의</a></li>
						<li><a href='#' target='_blank'>공지사항</a></li>
						<li><a href='#' target='_blank'>고객의 소리</a></li>
						<li><a href='#' target='_blank'>이용약관</a></li>
						<li><a href='#' target='_blank'>개인정보 처리방침</a></li>
						<li><a href='#' target='_blank'>광고안내</a></li>
					</ul>
				</nav>
			</div>
			<footer id="footer" class="footer_new">
				<div class="footer-layer2">
					<h1>
						<a href="/" title="COUPANG">COUPANG</a>
					</h1>
					<div class="footer-content">
						<address>
							상호명 및 호스팅 서비스 제공 : 쿠팡(주)<br> 대표이사 : 강한승,박대준<br> 서울시 송파구
							송파대로 570 <br> 사업자 등록번호 : 120-88-00767 <br> 통신판매업신고 :
							2017-서울송파-0680<br> <a href="#" class="licensee"
								title="사업자정  보 확인">사업자정보 확인 &gt;</a>
						</address>
						<div class="contact-info">
							<a href="#" class="call-center" title="365 고객센터"> <strong>365고객센터</strong>
								| 전자금융거래분쟁처리담당<br> <em>1577-7011 (유료)</em> 서울시 송파구 송파대로 570<br>
								<span class="contact-fax">email : help@coupang.com</span>
							</a>
						</div>
						<p class="safe-service">
							<strong>우리은행 채무지급보증 안내</strong><br> <span> 당사는 고객님이
								현금 결제한 금액에 대해<br>우리은행과 채무지급보증 계약을 체결하여<br>안전거래를 보장하고
								있습니다.<br>
							</span> <a href="javascript:;" id="serviceCheck" class="service-check"
								title="서비스 가입사실 확인">서비스 가입사실 확인 &gt;</a>
						</p>
					</div>
				</div>
			</footer>
		</footer>
	</div>
</body>
</html>
