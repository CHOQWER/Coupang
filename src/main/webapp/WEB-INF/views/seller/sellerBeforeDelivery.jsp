<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<style>

</style>
</head>
<body>
	<main>
		<title>sellerBeforeDelivery</title>
		<form action="sellerBeforeDelivery?bno=${BL.bno}" method="post" >
			<button type="submmit" class="btn btn-secondary">판매 업데이트</button>
			<button type="reset" class="btn btn-secondary">선택 초기화</button>
		

			<table class="table table-sm table-bordered">
				
				<tr>
					<th>상품 번호</th>
					<th>판매자 아이디</th>
					<th>상품명</th>
					<th>판매 가격</th>
					<th>수량</th>
				</tr>

				<c:forEach items="${list}" var="BL">
					<tr>
						<td id="bno" class="bno" name="bno">
 							<select name="sta" id="sta">
								<option value=0>구매 확인</option>
								<option value=1>구매 취소</option>
							</select> 
							${BL.bno}
						</td>
						<td>${vo.u_id}</td>
						<td>${BL.pname}</td>
						<td>${BL.dis_price}</td>
						<td>${BL.b_cnt}</td>
					</tr>
				</c:forEach>
			</table>

		</form>
	</main>

</body>
</html>

