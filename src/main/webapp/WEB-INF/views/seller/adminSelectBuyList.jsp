<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/include/aside.jsp"%>
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
<main>
	<h2>관리자-> 판매내역 확인하기</h2>
	
	
	<table class="table table-sm table-bordered">
		 <tr>
			<th>번호 인덱스</th>
			<th>구매번호</th>
			<th>판매자 아이디</th>
			<th>판매상품</th>
			<th>상품 할인 전 가격<th>
			<th>상품 할인 후 가격</th>
			<th>수량</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>등록일자</th>
		</tr> 
		
		<c:if test="${list==null}">
			<tr>
				<td colspan="6">검색된 도서가 없습니다.</td>
			</tr>
		</c:if>
		<p>판매자 판매내역 확인하기</p>
		<c:forEach items="${list}" var="BL"  varStatus="status"> 
			<tr>
				<td>${status.index}</td>
 				<td>${BL.bno}</td>
				<td>${BL.u_id}</td>
				<td>${BL.pno}</td> 
				<td>pname=${BL.pname}</td>
				<td><fmt:formatNumber value="${BL.price}" type="currency" currencySymbol="\\"> </fmt:formatNumber>  </td>
				<td><fmt:formatNumber value="${BL.dis_price}" type="currency" currencySymbol="\\"> </fmt:formatNumber>  </td>
	 			<td>pname=${BL.b_cnt}</td>
				<td>pname=${BL.post_no}</td>
				<td>pname=${BL.addr1}</td>
				<td>pname=${BL.addr2}</td>
				<td>pname=${BL.b_regdate}</td> 
			</tr>	
		</c:forEach>
	 </table>

 </main>
