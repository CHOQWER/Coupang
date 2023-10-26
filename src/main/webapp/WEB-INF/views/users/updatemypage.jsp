<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/signup.css">
<link rel="stylesheet" href="/resources/css/register2.css">
<script type="text/javascript" src="/resources/js/signup.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<div class="update">
<form action="updateUser" method="post" id="signup">
	<fieldset>
		<legend>회원정보수정</legend>
		<ul>
			<li><label for="userid">아이디</label> <input type="text"
				name="u_id" id="userid" value="${vo.u_id}" readonly="readonly">
			</li>
			<li><label for="fullname">이름</label> <input type="text"
				name="u_name" id="fullname" value="${vo.u_name}"></li>
			<li><label for="tel">전화번호</label> <input type="text"
				name="u_mobile" id="u_mobile" value="${vo.u_mobile}"></li>
			<li><label for="email">이메일</label> <input id="email"
				name="u_email" type="email" value="${vo.u_email}" required
				autocomplete="off"></li>
			<%-- <c:if test="${vo.grade==0 }">
				<p>등 급 : 관리자</p>
			</c:if>
			<c:if test="${vo.grade==1 }">
				<p>등 급 : 판매자</p>
			</c:if>
			<c:if test="${vo.grade==2 }">
				<p>등 급 : 일반회원</p>
			</c:if>
			<c:if test="${vo.grade==3 }">
				<p>등 급 : 와우회원</p>
			</c:if> --%>
			<input type="hidden" name="u_post_no" id="postno" placeholder="우편번호" required />
			<li><label for="fullname">주소</label> <input id="addr1"
				name="u_addr1" type="text" onclick="jusoPopup()"
				value="${vo.u_addr1}" required></li>			
			<li><label for="fullname">상세주소</label> 
			<input id="addr2" name="u_addr2" type="text" placeholder="상세주소" value="${vo.u_addr2}"></li>
			<%-- <p>가입일 : ${vo.u_regdate}</p> --%>
		</ul>
	</fieldset>
	<div id="button">
	<input type="submit" name="updateuser" id="updateuser" value="수 정">
	</div>
</form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>