<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage.css">
<link rel="stylesheet" href="/resources/css/purchasehistory.css">

<div class="main">
	<div id="top-nav"></div>
	<div id="side-menu">
		<ul>
			<li id="top-side">My 페이지</li>
			<li id="side-menu-list"><a href="mypage">개인정보확인/수정</a></li>
			<li id="side-menu-list"><a href="#">결제수단 관리</a></li>
			<li id="side-menu-list"><a href="delivseryStatus">주문목록/배송조회</a></li>
			<li id="side-menu-list"><a href="membership">와우 멤버십</a></li>
			<li id="side-menu-list"><a href="#">리뷰관리</a></li>
			<li id="side-menu-list"><a
				href="delivery?u_id=${sessionScope.vo.u_id}">배송지 관리</a></li>
		</ul>
	</div>
	<div id="mypage-section">
		<div class="top-mypage">
			<div class="mypage">
				<c:forEach items="${list}" var="BL">
					<input type="hidden" name="pno" value="${BL.pno}">

					<div class="main-div">
						<div class="div-ordercontent">
							<b><fmt:formatDate pattern="yyyy.MM.dd"
									value="${BL.b_regdate}" /> 주문</b>
						</div>
						<div class="div-space"></div>
						<div class="div-table-start">
							<table class="div-table-main">
								<colgroup>
									<col class="left-col" width="720px;">
									<col class="right-col" width="200px;">
								</colgroup>
								<tbody>
									<tr class="table-tr" style="border-right: 1px solid;">
										<td class="td-left">
											<div class="td-left-1">
												<c:if test="${BL.sta=='r'}">
													배송 중
													&nbsp;·<div class="td-left-1-1">${date }&nbsp;도착예정</div>
												</c:if>
												<c:if test="${BL.sta=='y'}">
													배송 완료
													&nbsp;·<div class="td-left-1-1"><fmt:formatDate pattern="yyyy.MM.dd" value="${BL.b_regdate }" />&nbsp;배송 완료</div>
												</c:if>
												<c:if test="${BL.sta=='n'}">
													판매자 구매 승인취소!
												</c:if>
											</div>											
											<c:forEach items="${thumbnail}" var="th">
												<div class="td-left-2"></div>
												<div class="td-left-image">
													<img src="imgDown?imgName=${th.main_img1}">
												</div>
											</c:forEach>
											<div class="td-div-content">
												<div class="td-left-content"><a href="ProductView?pno=${BL.pno}&cate_name=${cate_name}&subcate_name=${subcate_name}">${BL.pname}</a></div>																								
												<c:if test="${sessionScope.vo.grade==1 }">
												<div class="td-left-price-cnt">
													구매금액 ${BL.dis_price*BL.b_cnt}&nbsp;원&nbsp;·&nbsp;${BL.b_cnt}&nbsp;개
																										
												</div>
												</c:if>
												<c:if test="${sessionScope.vo.grade==3 }">
												<div class="td-left-price-cnt">
													구매금액 ${BL.dis_price*BL.b_cnt}&nbsp;원&nbsp;·&nbsp;${BL.b_cnt}&nbsp;개													
												</div>												
												</c:if>
												<c:if test="${sessionScope.vo.grade==2 }">
												<div class="td-left-price-cnt">
													구매금액 ${BL.price*BL.b_cnt}&nbsp;원&nbsp;·&nbsp;${BL.b_cnt}&nbsp;개													
												</div>												
												</c:if>
											</div>
										</td>
										<td class="td-right">
										<a href="ProductView1?pno=${BL.pno}"><button type="button">리뷰작성</button></a>
										<a href="insertCart?pno=${BL.pno}"><button type="button">장바구니 담기</button></a> 
										<c:if test="${pdate}<${date}">
										<a href="refundBuyProduct?bno=${BL.bno}"><button type="button" >반품신청</button></a></td>
										</c:if>
									</tr>									
								</tbody>
							</table>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>