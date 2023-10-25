<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
	
	.mypage {
		width: 1028px;
		margin: 0 auto;
	}
</style>


<body>
	<div class="mypage">
	<form action="usercheck" method="post">
	<h1>마이페이지</h1>
	<p>아이디 : ${sessionScope.vo.u_id}</p>
	<p>이 름 : ${sessionScope.vo.u_name }</p>
	<p>전화번호 : ${sessionScope.vo.u_mobile }</p>
	<p>이메일 : ${sessionScope.vo.u_email}</p>	
	<c:if test="${sessionScope.vo.grade==1 }">
	<p>등 급 : 판매자</p>
	</c:if>
	<c:if test="${sessionScope.vo.grade==2 }">
	<p>등 급 : 일반회원</p>
	</c:if>
	<c:if test="${sessionScope.vo.grade==3 }">
	<p>등 급 : 와우회원</p>
	</c:if>	
	<p>주소 : ${sessionScope.vo.u_addr1 }</p>
	<p>상세주소 : ${sessionScope.vo.u_addr2 }</p>
	<p>가입일 : ${sessionScope.vo.u_regdate}</p>
	<input type="submit" name="updatepage" id="updatepage" value="회원정보수정">	 
	</form>
	<a href="payment"><button>결제등록</button></a>
	
	<form action="withdrawal" method="post">
		<input type="hidden" name="u_id" value="${sessionScope.vo.u_id }">
		<a href="withdrawal"><button>회원탈퇴</button></a>
	</form>
	</div>
</body>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
