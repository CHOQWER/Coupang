<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
	#pagediv,.prodimg,#searchdiv{
		display:flex;
		justify-content: center;
	}
	#top-button,.prodimg,.table table-sm table-bordered{
		display:flex;
		justify-content: right;
		padding:10px;
	}
	.prodimg{
	width: 200px;
	height: 150px;
	}
</style>

</head>
<body>
<h2>주문 목록/배송 조회</h2>

<table class="table table-sm table-bordered">
	<tr>
		<th>주문 날짜</th>
		<th>상품 상태</th>
		<th>도착 예정</th>
		<th>메인 이미지</th>
		<th>판매자</th>
		<th>상품명</th>
		<th>상품번호</th>
		<th>가격</th>
		<th>수량</th>
		<th>주소</th>
		<th>상세 주소</th>
		
	</tr>
	<c:forEach items="${list}" var="BL"  > 
	
	<input type="hidden" name="pno" value="${BL.pno}">
	
	<tr>
		<td>
		<fmt:formatDate  pattern="yyyy.MM.dd" value="${BL.b_regdate}" /> 주문
		</td>
		<td><c:if test="${BL.sta=='r'}">
			배송 중
			</c:if> <c:if test="${BL.sta=='y'}">
			배송 완료
			</c:if>
			<c:if test="${BL.sta=='n'}">
			판매자 구매 승인취소!
			</c:if>
		</td>
		<td>${date}</td>
		
		
	<c:forEach items="${thumbnail}" var="th"  >
	
			<td>
				<img class="prodimg" src="imgDown?imgName=${th.main_img1}"
					alt="메인이미지">
			</td>
</c:forEach>
		
		
		<td>${vo.u_id}</td>
		<td>${BL.pname}</td>
		<td>${BL.pno}</td>
		<td>${BL.dis_price}</td>
		<td>${BL.b_cnt}</td>
		<td>${BL.addr1}</td>
		<td>${BL.addr2}</td>
				<td><a href="insertCart?pno=${BL.pno}&"><input type="button" value="장바구니 담기"></a></td>
				<td><a href=""><input type="button" value="배송조회" /></a></td>
				<td><a href=""><input type="button" value="교환 반품 신청" /></a></td>
				<td><a href="ProductView1?pno=${BL.pno}"><input type="button" value="리뷰 작성하기" /></a></td>
	</tr>
</c:forEach>

	
	</table>
	
</body>
</html>