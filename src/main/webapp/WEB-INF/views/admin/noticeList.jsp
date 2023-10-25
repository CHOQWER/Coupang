<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/notice.css">
<body>
<div id="menu">
  <ul>
      <li class="menu-item" data-type="notice"><a href="notice?type=0">공지사항</a> </li>
      <li class="menu-item" data-type="faq"><a href="notice?type=1">자주 묻는 질문(FAQ)</a></li>
  </ul>
</div>
  <c:choose>
      <c:when test="${vo.type==0}">
          <c:forEach items="${list}" var="item" varStatus="status">
              <ul>
                  <li class="faq-content">
                      <button class="question" data-toggle="que${status.index}" data-content="ans${status.index}">
                          <span id="que-toggle${status.index}">+</span><span>${item.n_title}</span>
                      </button>
                      <div class="answer" id="ans${status.index}">${item.n_content}</div>
                  </li>
              </ul>
          </c:forEach>
      </c:when>
      <c:when test="${vo.type==1}">
        <c:forEach items="${list}" var="item" varStatus="status">
          <ul>
              <li class="notice-content">
                  <button class="question" data-toggle="que${status.index}" data-content="ans${status.index}">
                      <span id="que-toggle${status.index}">+</span><span>${item.n_title}</span>
                  </button>
                  <div class="answer" id="ans${status.index}">${item.n_content}</div>
              </li>
          </ul>
      </c:forEach>
      </c:when>
  </c:choose>
</body>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const menuItems = document.querySelectorAll(".menu-item");
    const questions = document.querySelectorAll(".question");

    menuItems.forEach(function (item) {
        item.addEventListener("click", function () {
            const type = this.getAttribute("data-type");
            toggleList(type);
        });
    });

    questions.forEach(function (question) {
        question.addEventListener("click", function () {
            const answerId = this.getAttribute("data-content");
            toggleAnswer(this, answerId);
        });
    });
});

function toggleList(type) {
    const noticeTitle = document.getElementById("notice-title");
    const faqTitle = document.getElementById("faq-title");

    if (type === "notice") {
        noticeTitle.style.display = "block";
        faqTitle.style.display = "none";
    } else if (type === "faq") {
        noticeTitle.style.display = "none";
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
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>