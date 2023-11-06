<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/notice.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<body>
	<div id="menu">
		<ul id="asd123">
			<li id="notice-title" class="menu-item" data-type="notice">
			<h3><a href="notice">공지사항</a></h3>
			</li>
			<li id="faq-title" class="menu-item" data-type="faq2">
			<h3><a href="faq">자주 묻는 질문</a></h3>
			</li>
		</ul>
	</div>
	
	<div class="container123">
		<div id=noticeul>
		<c:forEach items="${list}" var="item" varStatus="status">
			<ul>
				<li class="faq">
					<div class="question">${item.n_title} 
						<span class="icon-main"> <i class="fa-solid fa-plus"></i></span>
					</div>
					<div class="answer non-active">${item.n_content}</div>
				</li>
			</ul>
			
			<div class="btn_rud">
			<c:if test="${sessionScope.vo.grade == '0'}">
				<a href="noticeUpdate?nno=${item.nno}"><button type="button" id="btnEdit" class="w-btn w-btn-blue">공지수정</button></a>&nbsp;&nbsp; 
				<button type="button" id="btnDelete" onclick="deleteNotice(${item.nno})" class="w-btn w-btn-blue">공지삭제</button>&nbsp;&nbsp;
			</c:if>
			</div>
		</c:forEach>
		</div>
			
		<div id="top-button">
		<c:if test="${sessionScope.vo.grade == '0'}">
			<a href="noticeNew"><button type="button" class="w-btn w-btn-blue">공지등록</button></a>
		</c:if>
		</div>
	</div>
	</div>
</body>
<script> 
const faqs = document.querySelectorAll(".faq"); 
for (const item of faqs) { 
    const curr_faq = item.childNodes; 
    console.log(curr_faq); 
    const question = curr_faq[1]; 
    const answer = curr_faq[3]; 
    const icon = question.querySelector(".icon-main"); 
    icon.addEventListener("click", function () { 
        answer.classList.toggle("non-active"); 
        const i = icon.querySelector("i"); 
        i.classList.toggle("fa-xmark"); 
        i.classList.toggle("fa-plus"); 
    }); 
} 


 function deleteNotice(nno) {
	 var confirmation = confirm("삭제 하시겠습니까?");
	    
	    if (confirmation) {
	        window.location.href = "deleteNotice?nno=" + nno;
	    }
	}
    </script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>




