<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


  <h2>배송지 선택</h2>
  
  <div class="address">
  <form action="selectDeli" method="post" id="selectDeliForm">
  <input type="hidden" name="u_id" value="${sessionScope.vo.u_id}">
    <c:forEach items="${dlist}" var="dvo">
    <div class="address-list">
    <ul>
    	<li>${dvo.u_name}</li>
    	<li>${dvo.post_no}</li>
    	<li>${dvo.addr1} ${dvo.addr2}</li>
    	<li>${dvo.u_mobile}</li>
    	<li>일반: 직접 받고 부재 시 문앞 / 새벽 : 문앞 </li>
    </ul>
    <button class="address-btn select-button" data-dno="${dvo.dno}">선택</button>
    </div>
    </c:forEach>
   </form>
  </div>
  

</body>

<script type="text/javascript">

const selectButtons = document.querySelectorAll('.select-button');

selectButtons.forEach(button => {
  button.addEventListener('click', function() {
    // 선택 버튼을 클릭할 때 발생하는 이벤트
    const dno = this.getAttribute('data-dno'); // 배송지 정보의 dno 값

    // 여기에서 선택한 배송지 정보를 폼에 추가하고 서버로 전송할 수 있습니다.
    // 폼에 배송지 정보를 추가
    const form = document.getElementById('selectDeliForm');
    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'dno'; // 서버에서 dno를 사용하도록 설정
    input.value = dno; // 선택한 배송지의 dno 값을 설정
    form.appendChild(input);

    // 폼을 서버로 제출
    form.submit();

    // 팝업 창 닫기 (여기서는 window.close() 메서드 사용)
    window.close();
  });
});


</script>
 
</html>