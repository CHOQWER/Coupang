<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage.css">
<link rel="stylesheet" href="/resources/css/register3.css">




<div class="main">
	<div id="top-nav"></div>
	<div id="side-menu">
		<ul>
			<li id="top-side">My 페이지</li>
			<li id="side-menu-list"><a href="mypage">개인정보확인/수정</a></li>
			<li id="side-menu-list"><a href="payment">결제수단 관리</a></li>
			<li id="side-menu-list"><a href="deliveryStatus">주문목록/배송조회</a></li>
			<li id="side-menu-list"><a href="membership">와우 멤버십</a></li>
			<li id="side-menu-list"><a
				href="delivery?u_id=${sessionScope.vo.u_id}">배송지 관리</a></li>
		</ul>
	</div>
	<div id="mypage-section">
		<div class="top-mypage">
			<div class="mypage">
				<form action="usercheck" method="post">
					<div class="div-update-main">
						<div class="sec-update-main">
							<div class="div-table">
								<table class="memberupdate-table" border="1">
									<colgroup>
										<col class="left-col" width="150px;">
										<col class="right-col" width="650px;">
									</colgroup>
									<tr>
										<th scope="row" class="row1">아이디</th>
										<td>${sessionScope.vo.u_id}</td>
									</tr>
									<tr>
										<th scope="row" class="row2">이름</th>
										<td>${sessionScope.vo.u_name }</td>
									</tr>
									<tr>
										<th scope="row" class="row3">전화번호</th>
										<td>${sessionScope.vo.u_mobile }</td>
									</tr>
									<tr>
										<th scope="row" class="row4">이메일</th>
										<td>${sessionScope.vo.u_email}</td>
									</tr>
									<c:if test="${sessionScope.vo.grade==1 }">
										<tr>
											<th scope="row" class="row5">등 급</th>
											<td>판매자</td>
										</tr>
									</c:if>
									<c:if test="${sessionScope.vo.grade==2 }">
										<tr>
											<th scope="row" class="row5">등 급</th>
											<td>일반회원</td>
										</tr>
									</c:if>
									<c:if test="${sessionScope.vo.grade==3 }">
										<tr>
											<th scope="row" class="row5">등 급</th>
											<td>와우회원</td>
										</tr>
									</c:if>
									<tr>
										<th scope="row" class="row6">주소</th>
										<td>${sessionScope.vo.u_addr1 }</td>
									</tr>
									<tr>
										<th scope="row" class="row7">상세주소</th>
										<td>${sessionScope.vo.u_addr2 }</td>
									</tr>
									<tr>
										<th scope="row" class="row7">가입일</th>
										<td>${sessionScope.vo.u_regdate }</td>
									</tr>
								</table>
							</div>
							<div class="updatebutton">
								<div class="updatebutton-1">
									<button type="submit" name="updateUser" id="updateUser">회원정보수정</button>
				</form>
				<form action="withdrawal" method="post"> 
				<button class="withdrawal" onclick="deleteUser()">회원탈퇴</button>
				<input type="hidden" name="u_id" value="${sessionScope.vo.u_id }"> 
				</form>
			</div>
		</div>
	</div>
</div>

</div>
</div>
</div>
</div>


<!-- <a href="payment"><button class="submit-btn">결제등록</button></ -->
<!-- </div> -->

<script type="text/javascript">
	function deleteUser() {
		var confirmation = confirm("정말 탈퇴 하시겠습니까?");
		if (confirmation) {
			location.href = "withdrawal";
		} else {
			alert("이전화면으로 돌아갑니다.");
			history.back();
		}
	}
</script>
