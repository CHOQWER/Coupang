<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 목록</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/common.css">
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/additional-methods.js"></script>
<script src="/resources/js/fileupload_validate.js"></script>
</head>
<style>
#new {
	width: 700px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 10px;
}

#new ul {
	list-style-type: none;
	text-align: center;
}

img {
	width: 300px;
	height: 300px;
	padding-top: 10px;
}

.img_list {
	margin: 5px;
	padding: 2px;
}
</style>
<body>
	<h2>제품리스트!!!!!!!!!!</h2>
	
	
	<table>
		<section id="new">
			<c:forEach items="${list}" var="vo">

				<div class="item">
					<ul>
						<li><a href="ProductView"></a>
							<div class="img_list">
								<img src="imgDown?imgName=${vo.main_img1}">
							</div></li>

						<li id="title"> <a href="ProductView?pno=${vo.pno}"> ${vo.pname} </a></li>

						<li id="price">${vo.price}</li>
						<li id="price">${vo.dis_price}</li>
					</ul>
				</div>
			</c:forEach>
		</section>
	</table>

	<!-- 페이지 -->
	<div id="pagediv">
		<nav aria-label="Standard pagination example">
			<ul class="pagination">
				<c:if test="${pmaker.prev}">
					<li class="page-item"><a class="page-link"
						href="ProductList?sca_no=${list.get(0).getSca_no()}&pageNum=${pmaker.beginPage-1}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>

				<c:forEach begin="${pmaker.beginPage}" end="${pmaker.endPage}"
					var="i">
					<c:choose>
						<c:when test="${i != pmaker.criteria.pageNum}">
							<li class="page-item"><a class="page-link"
								href="ProductList?sca_no=${list.get(0).getSca_no()}&pageNum=${i}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								style="font-weight: bold; color: black">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${pmaker.next}">
					<li class="page-item"><a class="page-link"
						href="ProductList?sca_no=${list.get(0).getSca_no()}&pageNum=${pmaker.endPage + 1}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
		<!-- paging end -->
	</div>

</body>
</html>