<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/index.css">
<link rel="shortcut icon"
	href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico"
	type="image/x-icon" />
</head>
<body>
	<nav class="top-nav">
		<ul class="right-nav">
			<c:choose>
				<c:when test="${sessionScope.vo==null}">
					<li><a href="login">로그인</a></li>
					<li><a href="register">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li>${sessionScope.vo.u_name}님</li>
					<li><a href="seller">판매자 사이트로 이동</a>
					<li><a href="logout">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>

	<header>
		<section>
			
				<div class="catagory-menu">
					<a href=""><img src="resources/img/catagory.png" alt=""></a>

					<!--카테고리 올려놓을 시 메뉴보여주기-->
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
							<option value="menu1">전체</option>
							<option value="menu2">회사명</option>
						</select> <input type="text" placeholder="찾고 싶은 상품을 검색해보세요!">
						<button type="submit" class="search-button">
							<img src="resources/img/search.png" alt="검색">
						</button>
					</div>
				</form>
			</div>
			<!--main 검색 끝-->

			<ul class="icon-menu">
				<li><a href="mypage"> <img src="resources/img/2815428.png"
						alt="마이폐이지" style="width: 30px;"> <span>마이쿠팡</span>
				</a></li>

				<li><a href=""> <img src="resources/img/cart.png"
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
</body>
</html>