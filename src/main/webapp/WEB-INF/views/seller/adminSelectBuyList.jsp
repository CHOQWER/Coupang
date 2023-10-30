<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
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
 </main>
