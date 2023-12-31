<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디지팡팡팡</title>

<link rel="stylesheet" href="../resources/css/index.css">
<link rel="shortcut icon"
	href="/resources/img/logo.png"
	type="image/x-icon" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>



<script type="text/javascript">
	function search() {
		console.log($("#searchWord").val());
		const cate_name = $("#search > option:selected").data("cate-name");  
		console.log(cate_name)
		
		if($("#search > option:selected").val()!=0){
		location.href = "ProductList?ca_no="
				+ $("#search > option:selected").val() + "&searchword="
				+ $("#searchWord").val()+"&cate_name="+$("#search > option:selected").data("cate-name");
		
		}else {
			location.href = "ProductList?ca_no="
				+ $("#search > option:selected").val() +"&searchword=" + $("#searchWord").val() ;
		}
		
	}
    function searchOnEnter(event) {
        if (event.key === "Enter") {
            search();
        }
    }

</script>
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
					<a href="#"><img src="resources/img/catagory.png" alt=""></a>

					<!--카테고리 올려놓을 시 메뉴보여주기-->
					<aside class="side-bar">
						<ul style="padding-left: 30px;">
							<li><c:forEach items="${catelist}" var="cate">
									<li><a href="ProductList?&listtype=1&ca_no=${cate.get('no')}&pageNum=1&cate_name=${cate.get('name')}"><i class="fa-solid fa-cat"></i>${cate.get('name')}</a>
										<ul style="padding-left: 10px;">
											<c:forEach items="${cate.get('subcates')}" var="sub">
												<li><a
													href="ProductList?&listtype=2&ca_no=${cate.get('no')}&sca_no=${sub.get('sno')}&pageNum=1&cate_name=${cate.get('name')}&subcate_name=${sub.get('sname')}">${sub.get('sname')}</a></li>
											</c:forEach>
										</ul>
								</c:forEach></li>


						</ul>
					</aside>
				</div>

				<div class="logo">
					<a href="/"><img src="/resources/img/digipang_logo.png"	width="180px"></a>
				</div>

				<!--main 검색-->
				<div class="search-bar">

					<div class="search-box">
						<select id="search">
							<option value="-1" >전체</option>
							<c:forEach items="${catelist}" var="cate">
								<option value="${cate.get('no')}" data-cate-name="${cate.get('name')}">${cate.get('name')}</option>
							</c:forEach>
						</select> 
						<input id="searchWord" type="text" placeholder="찾고 싶은 상품을 검색해보세요!" onkeydown="searchOnEnter(event)">
							<c:set var="encodedsearchWord" value="$('#searchWord').val()" /> 
						<img src="resources/img/search.png" alt="검색" onclick="search()" style="width: 25px;">

				</div>

				</div>
				<!--main 검색 끝-->

				<ul class="icon-menu">
					<li><a href="mypage"> <img src="resources/img/2815428.png"
							alt="마이페이지" style="width: 30px;"> <span>마이페이지</span>
					</a></li>

					<li><a href="cart"> <img src="resources/img/cart.png"
							alt="장바구니"> <span>장바구니</span>
					</a></li>
					
					<li><a href="membership"> <img src="resources/img/membership.jpg"
							alt="와우멤버십"> <span>와우멤버십</span>
					</a></li>
				</ul>
			</div>

		
		</header>