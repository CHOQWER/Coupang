<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/mypage.css">




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
	<div id="mypage-section">
		<div class="top-mypage">
			<div class="mypage">
				<form action="membership" method="post"  id="wowsecession" name="wowsecession">
					<c:if test="${sessionScope.vo.grade==0 }">
						<p>등 급 : 관리자</p>						
					</c:if>					
					<c:if test="${sessionScope.vo.grade==1 }">
						<p>등 급 : 판매자</p>
					</c:if>
					<c:if test="${sessionScope.vo.grade==2 }">
						<p>등 급 : 일반회원</p>
						<button type="submit">와우회원등록</button>
						
						<input type="hidden" name="u_id" value="${sessionScope.vo.u_id }">											
					</c:if>
					<c:if test="${sessionScope.vo.grade==3 }">
						<p>등 급 : 와우회원</p>					
						<button onclick="wowsecession()">와우회원탈퇴</button>	
						<input type="hidden" name="u_id" value="${sessionScope.vo.u_id }">	
					</c:if>
				</form>
					

				<%-- sadfasdfsadfasdfasdfasdfaasdf<form action="withdrawal" method="post"> 	
				<%-- <form action="withdrawal" method="post">
					<input type="hidden" name="u_id" value="${sessionScope.vo.u_id }">
					<a href="withdrawal"><button>회원탈퇴</button></a>
				</form> --%>
			</div>
		</div>
	</div>	
</div>
<!-- </div>  -->



<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>
	function wowsecession() {	
			   let secess=$("#wowsecession");
			   secess.attr("action","wowsecession");   
			   secess.submit();
			}
	
</script>
