<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
						<li id="post_no">${dvo.post_no}</li>
						<li id="newAddr1">${dvo.addr1}</li>
						<li id="newAddr2">${dvo.addr2}</li>
						<li>${dvo.u_mobile}</li>
						<li>일반: 직접 받고 부재 시 문앞 / 새벽 : 문앞</li>
					</ul>
					<button id="selectButton"onclick="selectAddr(this)">선택</button>
				</div>
			</c:forEach>
		</form>
  </div>
  

</body>

<script type="text/javascript">

function selectAddr(ele){
	console.log("아무거나");
	console.log(ele);
	

	var closet = $(ele).closest("div");
	console.log(closet);

	var incloset = closet.find('li');
	console.log(incloset);

	var addrInfo = {};

	post_no = incloset.eq(1).html();
	newAddr1 = incloset.eq(2).html();
	newAddr2 = incloset.eq(3).html();
	console.log(addrInfo);
    window.opener.updateAddress(post_no,newAddr1, newAddr2);
    window.close();
}



</script>
 
</html>