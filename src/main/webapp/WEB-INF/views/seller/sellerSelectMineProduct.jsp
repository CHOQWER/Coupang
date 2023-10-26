<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
	#pagediv,#searchdiv{
		display:flex;
		justify-content: center;
	}
	#top-button,.table table-sm table-bordered{
		display:flex;
		justify-content: right;
		padding:10px;
	}
</style>
<script type="text/javascript">
function openPop(){
    var popup = window.open('/sellerUpdateProduct?pno=+${BL.pno}+&ca_no=${BL.ca_no}&sca_no=${BL.sca_no}&company=${BL.company}', '', 'width=700px,height=800px,scrollbars=yes');
    /* '/sellerUpdateProduct' */
}
</script>
<main>
<h1> sellerSelectMineProduct</h1>
	<table class="table table-sm table-bordered">
		 <tr>
			<th>번호 인덱스</th>
			<th>상품 번호</th>
			<th>판매자 아이디</th>
			<th>카테고리 번호</th>
			<th>부 카테고리 번호<th>
			<th>제조회사</th>
			<th>상품명</th>
			<th>할인 전 가격</th>
			<th>할인 후가격</th>
			<th>내용</th>
			<th>색상</th>
			<th>재고</th>
		</tr> 
	<c:forEach items="${list}" var="BL"  varStatus="status"> 
			<tr>
				<td>${status.index}</td>
 				<td><p id="pno"> ${BL.pno}</p></td>
				<td>${BL.u_id}</td>
				<td>${BL.ca_no}</td> 
				<td>${BL.sca_no}</td>
				<td>${BL.company}</td>
				<td><a href="#" target="_blank" onclick="openPop()">${BL.pname}</a></td>
				<td><fmt:formatNumber value="${BL.price}" type="currency" currencySymbol="\\"> </fmt:formatNumber>  </td>
				<td><fmt:formatNumber value="${BL.dis_price}" type="currency" currencySymbol="\\"> </fmt:formatNumber>  </td>
				<td>${BL.content}</td>
				<td>${BL.color}</td>
				<td>${BL.qty}</td>
			</tr>	
		</c:forEach>
</main>
<%-- sellerUpdateProduct?pno=${BL.pno}&ca_no=${BL.ca_no}&sca_no=${BL.sca_no}&company=${BL.company}--%>
