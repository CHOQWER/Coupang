<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/banner.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/star-rating/css/star-rating.css"
	media="all" type="text/css" />
<link rel="stylesheet"
	href="/resources/star-rating/themes/krajee-svg/theme.css" media="all"
	type="text/css" />
<script src="/resources/star-rating/js/star-rating.min.js"
	type="text/javascript"></script>
<script src="/resources/star-rating/themes/krajee-svg/theme.min.js"
	type="text/javascript"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&family=Yusei+Magic&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap"
	rel="stylesheet">
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<main class="main_section1">
	<div class="slide slide_wrap">
		<div class="slide_item item1">
			<img src="/resources/img/banner1.jpg">
		</div>
		<div class="slide_item item2">
			<img src="/resources/img/banner2.jpg">
		</div>
		<div class="slide_item item3">
			<img src="/resources/img/banner3.jpg">
		</div>
		<div class="slide_item item4">
			<img src="/resources/img/banner4.jpg">
		</div>
		<div class="slide_item item5">
			<img src="/resources/img/banner5.jpg">
		</div>
		<div class="slide_prev_button slide_button">◀</div>
		<div class="slide_next_button slide_button">▶</div>
		<ul class="slide_pagination"></ul>
	</div>
</main>
<section class="main_section2">
<ul id="cardOver">
	<h2 style="margin: 60px;">오늘의 발견</h2>
	<c:forEach items="${plist}" var="pvo" varStatus="idx">
		<li><img src="imgDown?imgName=${pvo.main_img1}" width="300"
			height="280" alt="card1">
			<div class="bg"></div>
			<div class="view">
				<h3></h3>
				<p>${pvo.pname}</p>
				<p>
					와우 할인가 <span style="color: red;">
					<fmt:formatNumber value="${pvo.dis_price}" pattern="#,###" /></span>
				</p>
				<a href="ProductView?pno=${pvo.pno}">VIEW</a>
			</div>
			</li>
	</c:forEach>
</ul>
</section>



</div>
<script src="/resources/js/slide.js"></script>
 <%@ include file="/WEB-INF/views/include/footer.jsp"%> 
