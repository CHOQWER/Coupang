<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/signup.css">
<script type="text/javascript" src="/resources/js/signup.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<form action="updateUser" method="post">
	<h1>마이페이지</h1>	
	<p>아이디 : <input type="text" name="u_id" id="u_id" value="${vo.u_id}" readonly="readonly"></p>	
	<p>이 름 : <input type="text" name="u_name" id="u_name" value="${vo.u_name}" ></p>	
	<p>전화번호 : <input type="text" name="u_mobile" id="u_mobile" value="${vo.u_mobile}"></p>		
	<p>이메일 : <input type="email" name="u_email" id="u_email" value="${vo.u_email}"></p>
	<c:if test="${vo.grade==0 }">
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
	</c:if>	
	<input type="hidden" name="u_post_no" id="postno" placeholder="우편번호" required />			
	<p>주소 : <input type="text" type="text" size="40" name="u_addr1" id="addr1" placeholder="주소" required onclick="jusoPopup()" value="${vo.u_addr1}"></p>	
	<p>상세주소 : <input type="text" name="u_addr2" id="addr2" placeholder="상세주소" value="${vo.u_addr2}"></p>	
	<p>가입일 : ${vo.u_regdate}</p>
	<input type="submit" name="updateuser" id="updateuser" value="수 정"> 
	</form>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>