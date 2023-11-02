<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/notice.css">

<div id="menu">
  <ul>
      <li id="notice-title" class="menu-item" data-type="notice" ><a href="notice">공지사항</a> </li>     
      <li id="faq-title" class="menu-item" data-type="faq" ><a href="faq">자주 묻는 질문</a></li>
  </ul>
</div>
<div id=main>

<div id="noticelist">
			<c:forEach items="${list}" var="item" varStatus="status">
				<ul id=noticeul>
					<li class="notice-content">
						<button class="notice" data-toggle="no${status.index}" data-content="con${status.index}" onclick="toggleContent(${status.index})">
							<span class="toggle" id="no-toggle${status.index}">+</span><span>${item.n_title}</span>
						</button>
						<div class="content" id="con${status.index}" style="display: none">${item.n_content}</div>
					</li>
				</ul>
			<div class="btn_rud">
			<c:if test="${sessionScope.vo.grade == '0'}">
				<a href="noticeUpdate?nno=${item.nno}"><button type="button" id="btnEdit" class="w-btn w-btn-blue">공지수정</button></a>&nbsp;&nbsp; 
				<button type="button" id="btnDelete" onclick="deleteNotice(${item.nno})" class="w-btn w-btn-blue" >공지삭제</button></a>&nbsp;&nbsp;
			</c:if>
			</div> 
			</c:forEach>
			<div id="top-button">
				<c:if test="${sessionScope.vo.grade == '0'}">
				<a href="noticeNew"><button type="button" class="w-btn w-btn-blue">공지등록</button></a>
				</c:if>
			</div>	
</div>
</div>
<script>

 function toggleContent(index) {
    var content = document.getElementById("con" + index);
    var toggleSymbol = document.getElementById("no-toggle" + index);
    
    if (content.style.display === "block") {
    	content.style.display = "none";
        toggleIcon.textContent = "+";
    } else {
    	content.style.display = "block";
        toggleIcon.textContent = "-";
    }
}
 
 function deleteNotice(nno) {
	 var confirmation = confirm("삭제 하시겠습니까?");
	    
	    if (confirmation) {
	        window.location.href = "deleteNotice?nno=" + nno;
	    }
	}
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>