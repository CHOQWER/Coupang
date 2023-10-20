<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="/resources/css/signup.css">
</head>
<body>
	<div class="member">
		<h1 style="text-align: center;">로그인</h1>
		<br>
		<!-- 등급 -->
		
		<form action="/login" method="post">
			<div class="field grade">
				<b>로그인 유형</b>
				<div>
					<label><input type="radio" name="grade" id="grade" value="2" checked>일반</label>
					<label><input type="radio" 	name="grade" id="grade" value="1">판매자</label>
				</div>
			</div>			
			<!-- 아이디 -->
			<div class="field">
				<b>아이디</b>
				<div class="field tel-number">
					<div>
						<input type="text" name="u_id" id="u_id" class="id_input" required>
					</div>
				</div>
			</div>
			<div class="field">
				<b>비밀번호</b> <input class="userpw" type="password" name="u_pwd"
					id="pass" required />
			</div>
			<!-- 6. 가입하기 버튼 -->
			<input type="submit" name="signup" id="signup" value="로그인">
			<h2><c:out value="${error}"/> </h2>
			</form>
			<!-- 푸터 -->
			<div class="member-footer">
				<div>
					<a href="#none">이용약관</a> <a href="#none">개인정보처리방침</a> <a
						href="#none">책임의 한계와 법적고지</a> <a href="#none">회원정보 고객센터</a>
				</div>
				<span><a href="#none">COUPANG Corp.</a></span>
			</div>
	</div>
	
</body>
</html>