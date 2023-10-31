<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"  %>
<link rel="stylesheet" href="/resources/css/cart.css">
<%@ include file="/WEB-INF/views/include/header.jsp" %>


    <form action="cartbuy" method="post">
    <div class="card">
        <div class="col">${sessionScope.vo.u_id}</div>
        <div class="row">
            <div class="col-md-8 cart">
                <div class="title">
                    <div class="row">
                        <div class="col"><h4><b>장바구니</b></h4></div>
                    </div>
                </div>  
    
                <div class="row border-top border-bottom">
    			<div class="col-2">
            	<c:forEach items="${list}" var="vo">   
            	<input type="checkbox" name="deleteCart" id="deleteCart" value="${vo.cno}">         	
	            	<ul class="col123">              	
	            	<li><img src="imgDown?imgName=${vo.main_img1}" style="width: 78px; height: 78px;"></li>   	             
	                <li class="col"><a href="ProductView?pno=${vo.pno}">${vo.pname}</a></li>
	                <li class="col"><input type="button" value="-">${vo.c_cnt}<input type="button" value="+"></li>
	                <c:if test="${sessionScope.vo.grade==2 }">
	                <li class="col">${vo.price}</li>
	                </c:if>
	                <c:if test="${sessionScope.vo.grade==3 }">
	                <li class="col">${vo.dis_price}</li>
	                </c:if>
	                 <c:if test="${sessionScope.vo.grade==2 }">
	                <li class="col">${vo.price * vo.c_cnt }</li>
	                </c:if>
	                 <c:if test="${sessionScope.vo.grade==3 }">
	                <li class="col">${vo.dis_price * vo.c_cnt }</li>
	                </c:if>
	                
	            	 <%-- <li><button type="b" name="cno" onclick= value="${vo.cno}"></button></li> --%>
	            	
	                </ul>
              
                   </c:forEach>
     
    </div>
</div>

                <div class="back-to-shop"><a href="mypage">&leftarrow;&nbsp;&nbsp;뒤로가기</a><span class="text-muted"></span></div>
                <button type="button" onclick="deleteCart2()">선택된 상품 삭제</button>
                
            </div>
            <div class="col-md-4 summary">
                <div><h5><b>Summary</b></h5></div>
                <hr>
                <div class="row">
                    <div class="col">회원 등급</div>
                    <div class="col text-right">${sessionScope.vo.grade}</div>
                </div>
                <hr>
                <!-- <form>
                    <p>와우회원확인</p>
                    <select>
                        <option class="text-muted">일반회원</option>
                        <option class="text-muted">와우회원</option>
                    </select>
                    
                    <p>배송지</p>
                    <input id="code" placeholder="배송지를 입력해주세요">
                </form> -->
                
                <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                    <div class="col">총구매금액</div>       
            		<div class="col">구매금액</div>               
                    
                </div>
                
                <button class="btn">구매하기</button>
            </div>
        </div>
        </div>    
    </form>
    
<script>
function deleteCart2() {
    const checkboxes = document.querySelectorAll('input[name="deleteCart"]:checked');
    const selectedItems = Array.from(checkboxes).map((checkbox) => checkbox.value);

    if (selectedItems.length === 0) {
        alert("삭제할 항목을 선택해주세요.");
    } else {
        const query = selectedItems.join('&cnolist=');
        const url = 'deleteCart?cnolist=' + query;
        location.href = url;
    }
}



	/*
	var checkboxes = document.getElementById("deleteCart");
	var selectedItems = [];
	for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedItems.push(checkboxes[i].value);
        }
    }
	console.log(selectedItems);*/

	
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>