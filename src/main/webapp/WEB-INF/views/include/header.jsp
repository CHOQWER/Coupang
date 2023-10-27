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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
	<div class="container">
		<header>
			<nav class="top-nav">
				<ul class="right-nav">
					<c:choose>
						<c:when test="${sessionScope.vo==null }">
							<li><a href="login">로그인</a></li>
							<li><a href="register">회원가입</a></li>
							<li><a href="notice">고객센터</a></li>
						</c:when>
						<c:when test="${sessionScope.vo.grade==0}">
							<li>${sessionScope.vo.u_name}님</li>
							<li><a href="seller">관리자 사이트로 이동</a>
							<li><a href="logout">로그아웃</a></li>
							<li><a href="notice">고객센터</a></li>
						</c:when>
						<c:when test="${sessionScope.vo.grade==1}">
							<li>${sessionScope.vo.u_name}님</li>
							<li><a href="seller">판매자 사이트로 이동</a>
							<li><a href="logout">로그아웃</a></li>
							<li><a href="notice">고객센터</a></li>
						</c:when>
						<c:otherwise>
							<li>${sessionScope.vo.u_name}님</li>
							<li><a href="logout">로그아웃</a></li>
							<li><a href="notice">고객센터</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>

			<div class="main-bar">
				<div class="catagory-menu">
					<a href=""><img src="resources/img/catagory.png" alt=""></a>

					<!--카테고리 올려놓을 시 메뉴보여주기-->
					<aside class="side-bar">
						<ul style="padding-left: 30px;">
							<li><c:forEach items="${catelist}" var="cate">
									<li><a href="#"><i class="fa-solid fa-cat"></i>${cate.get('name')}</a>
										<ul style="padding-left: 10px;">
											<c:forEach items="${cate.get('subcates')}" var="sub">
												<li>
													<a href="ProductList?sca_no=${sub.get('sno')}&pageNum=1&cate_name=${cate.get('name')}&subcate_name=${sub.get('sname')}">${sub.get('sname')}</a></li>
											</c:forEach>
										</ul>
								</c:forEach>
							</li>


						</ul>
					</aside>
				</div>




				<div class="logo">
					<a href="/"><img src="/resources/img/logo_coupang_w350.png"
						alt="브랜드로고" width="174px"></a>
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
							alt="마이페이지" style="width: 30px;"> <span>마이쿠팡</span>
					</a></li>

					<li><a href="cart"> <img src="resources/img/cart.png"
							alt="장바구니"> <span>장바구니</span>
					</a></li>
				</ul>
			</div>

			<nav>
				<ul class="menu">
					<ul class="gnb-menu-scroll">
						<li class="gnb-menu-item"><a href="" class=""> <img
								class="" src=""> <span>로켓배송</span>
						</a></li>
						<li><a href="">이벤트/쿠폰</a></li>
					</ul>
				</ul>
			</nav>
		</header>