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
			<li id="side-menu-list"><a href="delivery?u_id=${sessionScope.vo.u_id}">배송지 관리</a></li>
		</ul>
	</div>
  	<div id="mypage-section">
  	<form action="deleteDeli" method="post" >
  	<input type="hidden" name="u_id" value="${sessionScope.vo.u_id}">
    <c:forEach items="${dlist}" var="dvo">
    
    <div class="mypage-deli">
    <ul>
    	<li style="font-weight: bold;">${dvo.u_name}</li>
    	<li>${dvo.post_no}</li>
    	<li>${dvo.addr1} ${dvo.addr2}</li>
    	<li>${dvo.u_mobile}</li>
    	<li>일반: 직접 받고 부재 시 문앞 / 새벽 : 문앞 </li>
    
      <input type="hidden" name="dno" value="${dvo.dno}"> 
      <input type="submit" class="address-btn" value="삭제">
    </ul>
    </div>
    </c:forEach>
    <div class="mypage-deli" style="height: 30px;text-align: center;line-height: 4rem; font-weight: bold;">
    <a href="insertDeli" id="new-deli">새 배송지 추가</a></div>
   
    </form>
   
  </div>	
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>