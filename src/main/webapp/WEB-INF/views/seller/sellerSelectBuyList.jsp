<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<link rel="stylesheet" href="/resources/css/sellerstyle.css">
<link rel="stylesheet" href="/resources/css/sellerpage.css">
<%@ include file="/WEB-INF/views/include/aside.jsp"%>

<style>
main{
	display: flex;
}
.buylist-main {
	margin: 0 auto;
	margin-top: 50px;
}

</style>
<!-- <main> -->
<body>
	<main>
		<div class="buylist-main">
			<div class="table-responsive custom-table-responsive">
				<table class="table custom-table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">구매번호</th>
							<th scope="col">판매자ID</th>
							<th scope="col">판매상품</th>
							<th scope="col">할인 전 가격</th>
							<th scope="col">할인 후 가격</th>
							<th scope="col">수량</th>
							<th scope="col">우편번호</th>
							<th scope="col">주소</th>
							<th scope="col">상세주소</th>
							<th scope="col">등록일자</th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${list==null}">
							<tr>
								<td colspan="6">검색된 제품이 없습니다.</td>
							</tr>
						</c:if>


						<tr>
							<c:forEach items="${list}" var="BL" varStatus="status">
								<td>${status.index}</td>
								<td>${BL.bno}</td>
								<td>${BL.u_id}</td>
								<td>${BL.pno}</td>
								<td>pname=${BL.pname}</td>
								<td><fmt:formatNumber value="${BL.price}" type="currency"
										currencySymbol="\\">
									</fmt:formatNumber></td>
								<td><fmt:formatNumber value="${BL.dis_price}"
										type="currency" currencySymbol="\\">
									</fmt:formatNumber></td>
								<td>pname=${BL.b_cnt}</td>
								<td>pname=${BL.post_no}</td>
								<td>pname=${BL.addr1}</td>
								<td>pname=${BL.addr2}</td>
								<td>pname=${BL.b_regdate}</td>

							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<%--  <div id="pagediv">
		 <!-- 페이지 -->	 
	     <nav aria-label="Standard pagination example">
	          <ul class="pagination">
		         <c:if test="${pmaker.prev}">
		            <li class="page-item">
		              <a class="page-link" href="bookList?pageNum=${pmaker.beginPage-1}&searchword=${pVo.searchword}&searchtype=${pVo.searchtype}" aria-label="Previous">
		                <span aria-hidden="true">&laquo;</span>
		              </a>
		            </li>   
	            </c:if>        
	           <c:forEach begin="${pmaker.beginPage}" end="${pmaker.endPage}" var="i">
			 		<c:choose>
			 			<c:when test="${i!=pmaker.criteria.pageNum}"><li class="page-item"><a class="page-link" href="bookList?pageNum=${i}&searchword=${pmaker.criteria.searchword}&searchtype=${pmaker.criteria.searchtype}">${i}</a></li></c:when>
			 			<c:otherwise> <li class="page-item"><a class="page-link" style="font-weigth:bold;color:black">${i}</a></li></c:otherwise>	 		
			 		</c:choose>		 			 	
		 		</c:forEach> 
		 		<c:if test="${pmaker.next}">
		           <li class="page-item">
		              <a class="page-link" href="bookList?pageNum=${pmaker.endPage+1}&searchword=${pmaker.criteria.searchword}&searchtype=${pmaker.criteria.searchtype}" aria-label="Next">
		                <span aria-hidden="true">&raquo;</span>
		              </a>
		            </li>
	            </c:if>
	          </ul>
	    </nav><!-- paging end -->
    </div> --%>
		<!--  검색 -->
		<!--     <div id="searchdiv">	 	
		<form action="bookList" method="post">
	        <select name="searchtype" id="searchtype">
	            <option value="title" checked>도서명</option>
	            <option value="writer">저자명</option>
	            <option value="publisher">출판사</option>
	        </select>
	        <input type="text" size="20" name="searchword" id="searchword" >
	        <button onclick="return searchFun()">검 색</button> &nbsp;	        
	    </form>		

 	</div>	 -->
		<!-- </main> -->
	</main>
</body>