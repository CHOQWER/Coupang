<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/mypage.css">
<script type="text/javascript" src="/resources/js/signup.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<div class="main">
	<div id="top-nav">
		
	</div>
	<div id="side-menu">
		<ul>
			<li id="top-side">My 페이지</li>
			<li id="side-menu-list"><a href="mypage">개인정보확인/수정</a></li>
			<li id="side-menu-list"><a href="payment">결제수단 관리</a></li>
			<li id="side-menu-list"><a href="deliveryStatus">주문목록/배송조회</a></li>
			<li id="side-menu-list"><a href="membership">와우 멤버십</a></li>			
			<li id="side-menu-list"><a href="delivery?u_id=${sessionScope.vo.u_id}">배송지 관리</a></li>
		</ul>
	</div>
	
	 <div class="insert-deli">
            <h2>배송지 추가</h2>
            <form action="insertDeli" method="post">
            <input type="hidden" name="u_id" value="${sessionScope.vo.u_id}">
            
            <div class="textForm">
                <input name="u_name" type="text" placeholder="받는 사람" required="required">
            </div>
            
            <div class="textForm">
                <input name="u_mobile" type="text" placeholder="휴대폰번호" required="required">
            </div>
    
            <div class="field">
                <input type="text" name="post_no" id="postno" placeholder="우편번호" required />
                <input type="button" class="btn_post" style=" width: 50px;
                margin-left: -80px;
               	height: 30px;
                border: none;
                cursor: pointer;
                background-color: white;"
                onclick="jusoPopup()" value="찾기" ><br>
            </div>
    
    
            <div class="field">
                    <input type="text" type="text" name="addr1" id="addr1"
                        placeholder="주소" required onclick="jusoPopup()">
            </div>
            <div class="field">
                     <input type="text" name="addr2" id="addr2"
                        placeholder="상세주소">
            </div>
    
            <input type="submit" value="등록" 
            style="background-color:rgb(61, 130, 247) ; color: white; 
            font-weight: bold; font-size: 1rem; cursor: pointer;"
            onmouseover="this.style.backgroundColor='#fff'; this.style.color='rgb(61, 130, 247)'"
            onmouseout="this.style.backgroundColor='rgb(61, 130, 247)';this.style.color='#fff'"/>
            
        
            </form>
        </div>



</div>
<!-- </div>  -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>