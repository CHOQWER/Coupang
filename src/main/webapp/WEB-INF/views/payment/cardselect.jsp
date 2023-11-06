<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/selectcard.css">
 
<body>
<div class="cardlist">
    <div class="head">
      <h1>등록 카드</h1>
      <hr>
    </div>     
    <form action="cardselect" method="post" id="cardselect">
  <input type="hidden" name="u_id" value="${sessionScope.vo.u_id}">
        <ul>	
        <c:forEach items="${list}" var="vo">    
            <li>${vo.card_num}&nbsp;&nbsp;<button class="selectButton" data-cardnum="${vo.card_num}" onclick="cardselect(this)">선택</button></li>   
            </c:forEach>         
        </ul> 
      
    </form>
</div>
<script>
function cardselect(button) {
    const cardNum = button.getAttribute('data-cardnum'); // 선택된 카드 번호
    alert('선택된 카드 번호: ' + cardNum + '결제 완료');    
    // 선택 후 구매완료 
    
    window.close();
    
}
</script>
</body>
</html>