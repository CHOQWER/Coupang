<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 폼</title>
<link rel="stylesheet" href="/resources/css/signup.css">
<script type="text/javascript" src="/resources/js/signup.js"></script>
</head>
<body>
	<div class="member">
		<!-- 1. 로고 -->
		<!-- <img class="logo" src="./images/images2/logo-naver.png"> -->

		<!-- 2. 필드 -->
		<h1 style="text-align: center;">회원가입</h1>
		<br>
		<form method="POST" class="register-form" id="register-form" action="register" onsubmit="return inputCheck()">		
			<!-- 등급 -->
			<div class="field grade">
				<b>가입유형</b>
				<div>
					<label><input type="radio" name="grade" id="grade" value="2">일반</label>
					<label><input type="radio" name="grade" id="grade" value="1">판매자</label>
				</div>
			</div>
			<!-- 아이디 -->
			<div class="field">
				<b>아이디</b>
				<div class="field">
					<div>
						<input type="text" name="u_id" id="u_id" class="id_input"	placeholder="영문 + 숫자 조합 / 4~12자 이내 " minlength="4" maxlength="12"
						 required><input type="button" id="checkId" value="아이디 중복확인">
						<div>
							<span id="result_checkId" style="font-size: 12px;"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="field">
				<b>비밀번호</b> <input class="userpw" type="password" name="u_pwd"
					id="pass" placeholder="비밀번호(최소 8~16자리 특수문자 포함)" required
					pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" />
			</div>
			<div class="field">
				<b>비밀번호 재확인</b> <input class="userpw-confirm" type="password" name="u_pwd2" id="re_pass"
					placeholder="비밀번호 재입력(최소 8~16자리 특수문자 포함)" required pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" />
			</div>
			<div class="field">
				<b>이름</b> <input type="text" name="u_name" id="u_name"	placeholder="이름" required>
			</div>

			<!-- 3. 필드(생년월일) -->
			<div class="field birth">
				<b>주민등록번호</b>
				<div>
					<input type="text" placeholder="000000-0000000" name="u_identity"
						id="u_identity" required>
				</div>
			</div>
			<div class="field tel-number">
				<b>휴대전화</b> <input type="tel" name="u_mobile" id="u_mobile"
					placeholder="010-0000-0000" required>
			</div>

			<!-- 5. 이메일_전화번호 -->
			<div class="field">
				<b>본인 확인 이메일</b> <input type="email" name="u_email" id="u_email" placeholder="직접입력" required>
			</div>
			<div class="field">
				<input type="hidden" name="u_post_no" id="postno" placeholder="우편번호"
					readonly required />
			</div>
			<div class="field">
				<b>주소</b> <input type="text" type="text" name="u_addr1" id="addr1"
					placeholder="주소" required onclick="jusoPopup()">
			</div>
			<div class="field">
				<b>상세주소</b> <input type="text" name="u_addr2" id="addr2"
					placeholder="상세주소">
			</div>
			<!-- 6. 가입하기 버튼 -->
			<input type="submit" name="signup" id="signup" value="회원가입">
		</form>
		<!-- 7. 푸터 -->
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