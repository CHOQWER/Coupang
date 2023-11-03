<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/mypage.css">
<script type="text/javascript" src="/resources/js/signup.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<div class="main">
	<div id="top-nav">
		
	</div>
	<div id="side-menu">
		<ul>
			<li id="top-side">My 페이지</li>
			<li id="side-menu-list"><a href="mypage">개인정보확인/수정</a></li>
			<li id="side-menu-list"><a href="#">결제수단 관리</a></li>
			<li id="side-menu-list"><a href="#">주문목록/배송조회</a></li>
			<li id="side-menu-list"><a href="membership">와우 멤버십</a></li>
			<li id="side-menu-list"><a href="#">리뷰관리</a></li>
			<li id="side-menu-list"><a href="delivery?u_id=${sessionScope.vo.u_id}">배송지 관리</a></li>
		</ul>
	</div>
	
	<div class="insert-deli">
		<form action="insertDeli" method="post">
		<input type="hidden" name="u_id" value="${sessionScope.vo.u_id}">
		
		<div class="textForm">
			<input name="u_name" type="text" placeholder="받는 사람" required="required">
		</div>
		
		<div class="textForm">
			<input name="u_mobile" type="text" placeholder="전화번호" required="required">
		</div>

		<div class="field">
			<input type="text" name="post_no" id="postno" placeholder="우편번호" required />
			<input type="button" class="btn_post" onclick="jusoPopup()" value="우편번호 찾기"><br>
		</div>


		<div class="field">
				<b>주소</b> <input type="text" type="text" name="addr1" id="addr1"
					placeholder="주소" required onclick="jusoPopup()">
		</div>
		<div class="field">
				<b>상세주소</b> <input type="text" name="addr2" id="addr2"
					placeholder="상세주소">
		</div>

		<input type="submit" value="등록" />
		
	
		</form>
	</div>



</div>
<!-- </div>  -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>