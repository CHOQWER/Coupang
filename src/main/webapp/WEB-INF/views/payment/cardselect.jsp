<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/card.css">
 
<body>
<div class="cardlist">
    <div class="head">
      <h1>등록 카드</h1>
      <hr>
    </div>     
    <form method="POST" class="cardselect" id="cardselect" action="cardselect">
    <c:forEach items="${list}" var="vo">
        <ul>	    
            <li>${vo.card_num}</li>
        </ul>
        <button class="selectButton" data-cardnum="${vo.card_num}" onclick="selectCard(this)">선택</button>
    </c:forEach>  
    </form>
</div>
<script>
function selectCard(button) {
    const cardNum = button.getAttribute('data-cardnum'); // 선택된 카드 번호
    alert('선택된 카드 번호: ' + cardNum);
    
    // 선택 후 창을 닫음
    window.close();
}
</script>
</body>
</html>