<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="../resources/css/productlist.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<link rel="stylesheet" href="/resources/star-rating/css/star-rating.css"
	media="all" type="text/css" />
<link rel="stylesheet"
	href="/resources/star-rating/themes/krajee-svg/theme.css" media="all"
	type="text/css" />
<script src="/resources/star-rating/js/star-rating.min.js"
	type="text/javascript"></script>
<script src="/resources/star-rating/themes/krajee-svg/theme.min.js"
	type="text/javascript"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<main>

	<div class="cate-nav">쿠팡홈 > ${cate_name} > ${subcate_name}</div>

	<div class="contents">
		<div class="aside">
			<div class="search-company">
				<h2>브랜드</h2>

				<ul>
					<c:forEach items="${clist}" var="vo">
						<li><a
							href="ProductList?listtype=${listtype}&company=${vo.company}&pageNum=1&sca_no=${vo.sca_no}&ca_no=${vo.ca_no}&cate_name=${cate_name}&subcate_name=${subcate_name}">${vo.company}</a>
						</li>
					</c:forEach>
				</ul>

			</div>
		</div>
		<div class="article">
			<h2>${subcate_name}</h2>
			<hr>
			<div class="prod-grid">
				<c:forEach items="${list}" var="vo" varStatus="idx">
					<div class="prodlink">


						<a
							href="ProductView?pno=${vo.pno}&cate_name=${cate_name}&subcate_name=${subcate_name}">
							<div>
								<img class="prodimg" src="imgDown?imgName=${vo.main_img1}"
									alt="메인이미지">
							</div>
							<div>
								<span><a href="ProductView?pno=${vo.pno}&cate_name=${cate.get('name')}&subcate_name=${sub.get('sname')}">${vo.pname}</a></span><br>
								<span>와우할인가</span> <span><fmt:formatNumber
										value="${vo.price}" pattern="#,###" /></span><br> <span><fmt:formatNumber
										value="${vo.dis_price}" pattern="#,###" /></span><br> <input
									id="avgscore" name="avgscore"
									value="${starlist[idx.index-1].get('AVG')}"
									class="rating rating-loading" data-size="sm"
									readonly="readonly" /><span>(${starlist[idx.index-1].get('CNT')})</span>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
			<hr>
			
			<!-- 페이지 -->
			<nav aria-label="..."
				style="justify-content: center; margin-left: 45%; margin-top: 3%">
				<ul class="pagination">

					<c:if test="${pmaker.prev}">
						<li class="page-item disabled"><a class="page-link"
							href="ProductList?searchword=${pmaker.criteria.getSearchword()}&company=${pmaker.criteria.getCompany()}&listtype=${listtype}&sca_no=${pmaker.criteria.getSca_no()}&ca_no=${pmaker.criteria.getCa_no()}&pageNum=${pmaker.beginPage-1}&cate_name=${cate.get('name')}&subcate_name=${sub.get('sname')}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach begin="${pmaker.beginPage}" end="${pmaker.endPage}" var="i">
						<c:choose>
							<c:when test="${i != pmaker.criteria.pageNum}">
								<li class="page-item"><a class="page-link"
									href="ProductList?searchword=${pmaker.criteria.getSearchword()}&company=${pmaker.criteria.getCompany()}&listtype=${listtype}&sca_no=${pmaker.criteria.getSca_no()}&ca_no=${pmaker.criteria.getCa_no()}&pageNum=${i}&cate_name=${cate_name}&subcate_name=${subcate_name}">${i}</a>
								</li>

							</c:when>
							<c:otherwise>
								<li class="page-item">
								<a class="page-link" href="ProductList?searchword=${pmaker.criteria.getSearchword()}&company=${pmaker.criteria.getCompany()}&listtype=${listtype}&sca_no=${pmaker.criteria.getSca_no()}&ca_no=${pmaker.criteria.getCa_no()}&pageNum=${i}&cate_name=${cate_name}&subcate_name=${subcate_name}}" 
								style="font-weight: bold; color: black">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${pmaker.next}">
						<li class="page-item"><a class="page-link"
							href="ProductList?searchword=${pmaker.criteria.getSearchword()}&company=${pmaker.criteria.getCompany()}&listtype=${listtype}&sca_no=${pmaker.criteria.getSca_no()}&ca_no=${pmaker.criteria.getCa_no()}&pageNum=${pmaker.endPage + 1}&cate_name=${cate_name}&subcate_name=${subcate_name}}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
</main>
<!-- paging end -->
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>