<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
</head>
<style>
    .answer {
      display: none;
      padding-bottom: 30px;
    }
    #faq-title,#notice-title {
      font-size: 25px;
      float: left;
      margin: 20px;
    }
    .faq-content {
      border-bottom: 1px solid #e0e0e0;
    }
    .question {
      font-size: 19px;
      padding: 30px 0;
      cursor: pointer;
      border: none;
      outline: none;
      background: none;
      width: 100%;
      text-align: left;
    }
    .question:hover {
      color: #2962ff;
    }
    [id$="-toggle"] {
      margin-right: 15px;
    }
    #menu{
    	list-style-type: none;
    	width: 100%;
    	height: 40px;
    }
   
  </style>
<body>
<ul id="menu">
    <li id="notice-title" onclick="toggleList(0)">공지사항</li>
    <c:if test="${vo.type==0}">
        <c:forEach items="${list}" var="list" varStatus="status">
			<ul>    
				<li class="faq-content">
				<button class="question" id="que${status.index}" name="n_content"><span id="que-toggle${status.index}">+</span><span>${list.n_title}</span></button>
				<div class="answer" id="ans${status.index}">${list.n_content}</div>
				</li>    
			</ul>
        </c:forEach>
    </c:if>
        <li id="faq-title" onclick="toggleList(1)">자주 묻는 질문(FAQ)</li>
    <c:if test="${vo.type==1}">
        <c:forEach items="${list}" var="list" varStatus="status">
			<ul>    
				<li class="faq-content">
				<button class="question" id="que${status.index}" name="n_content"><span id="que-toggle${status.index}">+</span><span>${list.n_title}</span></button>
				<div class="answer" id="ans${status.index}">${list.n_content}</div>
				</li>    
			</ul>
        </c:forEach>
    </c:if>
</ul>
	

</body>
<script>
    const items = document.querySelectorAll('.question');

    function openCloseAnswer() {
        const answerId = this.id.replace('que', 'ans');

        if (document.getElementById(answerId).style.display === 'block') {
            document.getElementById(answerId).style.display = 'none';
            document.getElementById(this.id + '-toggle').textContent = '+';
        } else {
            document.getElementById(answerId).style.display = 'block';
            document.getElementById(this.id + '-toggle').textContent = '-';
        }
    }

    function toggleList(type) {
        if (type === 0) {
            document.getElementById('faq-title').style.display = 'none';
            document.getElementById('notice-title').style.display = 'block';
        } else if (type === 1) {
            document.getElementById('faq-title').style.display = 'block';
            document.getElementById('notice-title').style.display = 'none';
        }
    }
    items.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>