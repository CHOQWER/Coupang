<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<link rel="stylesheet" href="/resources/css/sellerstyle.css">
<link rel="stylesheet" href="/resources/css/sellerpage.css">
<%@ include file="/WEB-INF/views/include/aside.jsp"%>
<html>
<head>
<style>
	main{
		display: flex;
	}
	.seller-menu{
		margin: 0 auto;
		margin-top: 100px;		
	}
</style>

</head>
<body>
	<main>
		<div class="seller-menu">
		<form action="sellerBeforeDelivery" method="post" >
			<button type="submmit" class="btn btn-secondary">판매 업데이트</button>
			<button type="reset" class="btn btn-secondary">선택 초기화</button>
			
			
			 <table class="table custom-table">
            <thead>
                <tr>
                    <th scope="col">판매여부</th>
                    <th scope="col">상품 번호</th>
                    <th scope="col">구매자 아이디</th>
                    <th scope="col">상품명</th>
                    <th scope="col">판매 가격</th>
                    <th scope="col">수량</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="BL">
                <input type="hidden" name="bno" value="${BL.bno}">
                   <tr>
                        <td><select name="sta" id="sta">
                            <option value=0>구매 승인</option>
                            <option value=1>구매 취소</option>
                        </select> 
                    </td>
                        <td>${BL.bno }</td>
                        <td>${vo.u_id}</td>
                        <td>${BL.pname}</td>
                        <td>${BL.dis_price}</td>
                        <td>${BL.b_cnt}</td>
                   </tr> 
                </c:forEach>
            </tbody>
        </table>
		</form>
		</div>
</main>

</body>
</html>

