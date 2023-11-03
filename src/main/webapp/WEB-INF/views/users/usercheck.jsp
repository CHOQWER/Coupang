<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/signup.css">
<style>

	.message{
    width: 1028px;     
	margin: 0 auto;
	padding-top: 40px;
}
	   
	
</style>

	<div class="message">
	<h1 style="margin-top: 50px">회원정보확인</h1>
	${sessionScope.vo.u_id}님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.
	<hr>
	</div>

<div class="member">
		<h1 style="text-align: center;"></h1>
		<br>		
		<form action="pwdcheck" method="post">			
			<div class="field">
				<b>아이디</b>
				<div class="field">
					<div>
						<input type="text" name="u_id" id="u_id" class="id_input" required readonly="readonly" value="${sessionScope.vo.u_id}">
					</div>
				</div>
			</div>
			<div class="field">
				<b>비밀번호</b> <input class="userpw" type="password" name="u_pwd" id="pass" required />
			</div>
			<!-- 6. 가입하기 버튼 -->
			<input type="submit" name="signup" id="signup" value="확인">
			<h2><c:out value="${error}"/> </h2>
			</form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>			
