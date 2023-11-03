<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/faq.css">

<div id="menu">
  <ul>
      <li id="notice-title" class="menu-item" data-type="notice" ><a href="notice">공지사항</a> </li>     
      <li id="faq-title" class="menu-item" data-type="faq" ><a href="faq">자주 묻는 질문</a></li>
  </ul>
</div>
<div id=main>

<div id="faqlist">
	<ul id=faqul>
		<li class="faq-content">
			<button class="faq" onclick="toggleContent()">
				<span class="toggle" id="n_title">+</span><span>자주묻는질문</span>
			</button>
			<div class="content" id="n_content" style="display: none">질문하지마</div>
		</li>
	</ul>
</div>

</div>

<script>

 function toggleContent() {
    var content = document.getElementById("n_content");
    var toggleSymbol = document.getElementById("n_title");
    
    if (content.style.display === "block" || content.style.display === "") {
    	content.style.display = "none";
        toggleIcon.textContent = "+";
    } else {
    	content.style.display = "block";
        toggleIcon.textContent = "-";
    }
}
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>