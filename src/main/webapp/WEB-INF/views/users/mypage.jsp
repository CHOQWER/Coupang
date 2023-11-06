<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage.css">




<div class="main">
	<div id="top-nav">
		
	</div>
	<div id="side-menu">
		<ul>
			<li id="top-side">My 페이지</li>
			<li id="side-menu-list"><a href="mypage">개인정보확인/수정</a></li>
			<li id="side-menu-list"><a href="#">결제수단 관리</a></li>
			<li id="side-menu-list"><a href="deliveryStatus">주문목록/배송조회</a></li>
			<li id="side-menu-list"><a href="membership">와우 멤버십</a></li>
			<li id="side-menu-list"><a href="#">리뷰관리</a></li>
			<li id="side-menu-list"><a href="delivery?u_id=${sessionScope.vo.u_id}">배송지 관리</a></li>
		</ul>
	</div>
	<div id="mypage-section">
		<div class="top-mypage">
			<div class="mypage">
				<form action="usercheck" method="post">
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
					<input type="submit" name="updatepage" id="updatepage"
						value="회원정보수정">
				</form>
				<a href="payment"><button>결제등록</button></a>

				<form action="withdrawal" method="post">
					<input type="hidden" name="u_id" value="${sessionScope.vo.u_id }">
					<!-- <a href="withdrawal"><button>회원탈퇴</button></a>	 -->	
					<button onclick="deleteUser(${sessionScope.vo.u_id})">회원탈퇴</button>			
				</form>
			</div>
		</div>
	</div>	
</div>
<!-- </div>  -->
<script>
function deleteUser(id) {
	 var confirmation = confirm("정말 탈퇴 하시겠습니까?");
	    if (confirmation) {
	        window.location.href = "withdrawal?id=" + id;
	    }
	}
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>