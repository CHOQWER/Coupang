<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="/resources/js/common.js"></script>
<link rel="stylesheet" href="/resources/css/sellerstyle.css">
<link rel="stylesheet" href="/resources/css/sellerpage.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/include/aside.jsp"%>
<style>

/* main {
	display: flex;
}  */

.buylist-main {
	margin: 0 auto;
	margin-top: 50px;
}
</style>
<main>
	<div class="buylist-main">
		<div class="table-responsive custom-table-responsive">
			<table class="table custom-table">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">구매번호</th>
						<th scope="col">판매자 아이디</th>
						<th scope="col">상품번호</th>
						<th scope="col">판매상품</th>
						<th scope="col">상품 할인 전 가격</th>
						<th scope="col">상품 할인 후 가격</th>
						<th scope="col">수량</th>
						<th scope="col">우편번호</th>
						<th scope="col">주소</th>
						<th scope="col">상세주소</th>
						<th scope="col">등록일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="BL" varStatus="status">
					<c:set var="pname" value="${BL.pname }"/>
					<tr>						
							<td>${status.index}</td>
							<td>${BL.bno}</td>
							<td>${BL.u_id}</td>
							<td>${BL.pno}</td>							
							<td>${fn:substring(pname,0,20)}...</td>
							<td>${BL.price}</td>
							<td>${BL.dis_price}</td>
							<td>${BL.b_cnt}</td>
							<td>${BL.post_no}</td>
							<td>${BL.addr1}</td>
							<td>${BL.addr2}</td>
							<td>${BL.b_regdate}</td>						
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</main>
