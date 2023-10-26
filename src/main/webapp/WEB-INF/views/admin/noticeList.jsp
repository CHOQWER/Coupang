<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/notice.css">

<div id="menu">
  <ul>
      <li id="notice-title" class="menu-item" data-type="notice" ><a href="notice?type=0">공지사항</a> </li>     
      <li id="faq-title" class="menu-item" data-type="faq" ><a href="notice?type=1">자주 묻는 질문</a></li>
  </ul>
</div>
<div id="nolist">
	<c:choose>
		<c:when test="${vo.type==0}">
			<c:forEach items="${list}" var="item" varStatus="status">
				<ul>
					<li class="notice-content">
						<button class="question" data-toggle="que${status.index}" data-content="ans${status.index}">
							<span id="que-toggle${status.index}">+</span><span>${item.n_title}</span>
						</button>
						<div class="answer" id="ans${status.index}">${item.n_content}</div>
					</li>
				</ul>
			<div class="btn_rud">
			<c:if test="${sessionScope.vo.grade == '0'}">
				<button type="button" id="btnEdit" onclick="noticeEdit()" class="btn btn-warning" >공지수정</button>
				<button type="button" id="btnDelete" onclick="noticeDelete()" class="btn btn-danger" >공지삭제</button> 
				<button type="submit" id="btnSave" onclick="noticeSave()" class="btn btn-primary" style="display:none;">공지저장</button> 
				<button type="reset" id="btnCancle" onclick="noticeCancle()" class="btn btn-info" style="display:none;">수정취소</button>
			</c:if>
			</div> 
			</c:forEach>
			<div id="top-button">
				<c:if test="${sessionScope.vo.grade == '0'}">
				<a href="noticeNew"><button type="button" class="btn btn-primary">공지등록</button></a>
				</c:if>
			</div>
		</c:when> 
		<c:when test="${vo.type==1}">
			<c:forEach items="${list}" var="item" varStatus="status">
				<ul>
					<li class="faq-content">
						<button class="question" data-toggle="que${status.index}" data-content="ans${status.index}">
							<span id="que-toggle${status.index}">+</span><span>${item.n_title}</span>
						</button>
						<div class="answer" id="ans${status.index}">${item.n_content}</div>
					</li>
				</ul>
			<div class="btn_rud">
			<c:if test="${sessionScope.vo.grade == '0'}">
				<button type="button" id="btnEdit" onclick="noticeEdit()" class="btn btn-warning" >게시글 수정</button>
				<button type="button" id="btnDelete" onclick="noticeDelete()" class="btn btn-danger" >게시글 삭제</button> 
				<button type="submit" id="btnSave" onclick="noticeSave()" class="btn btn-primary" style="display:none;">게시글 저장</button> 
				<button type="reset" id="btnCancle" onclick="noticeCancle()" class="btn btn-info" style="display:none;">수정취소</button>
			</c:if>
			</div> 
			</c:forEach>
			<div id="top-button">
				<c:if test="${sessionScope.vo.grade == '0'}">
				<a href="noticeNew"><button type="button" class="btn btn-primary">게시글 등록</button></a>
				</c:if>
			</div>
		</c:when>
	</c:choose>
</div>
<script>
document.addEventListener("DOMContentLoaded", function () {
	console.log("DOM is ready");
    const menuItems = document.querySelectorAll(".menu-item");
    const questions = document.querySelectorAll(".question");

    menuItems.forEach(function (item) {
        item.addEventListener("click", function () {
            const type = this.getAttribute("data-type");
            console.log("Menu clicked:", type);
            toggleList(type);
        });
    });

    questions.forEach(function (question) {
        question.addEventListener("click", function () {
            const answerId = this.getAttribute("data-content");
            console.log("Question clicked:", answerId);
            toggleAnswer(this, answerId);
        });
    });
});

function toggleList(type) {
    const noticeTitle = document.getElementById("notice-title");
    const faqTitle = document.getElementById("faq-title");

    if (type === "notice") {
        noticeTitle.style.display = "block";
    } else if (type === "faq") {
        faqTitle.style.display = "block";
    }
}

function toggleAnswer(question, answerId) {
    const answer = document.getElementById(answerId);
    const toggleIcon = question.querySelector("span[data-toggle]");

    if (answer.style.display === "block") {
        answer.style.display = "none";
        toggleIcon.textContent = "+";
    } else {
        answer.style.display = "block";
        toggleIcon.textContent = "-";
    }
}
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>