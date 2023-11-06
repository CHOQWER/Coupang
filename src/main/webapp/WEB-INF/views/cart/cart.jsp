<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/css/cart.css">
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<form action="cartbuy" method="post">
	<div class="card">		
		<div class="row">
		<div class="back-to-shop">
			<a href="javascript:history.back()">&leftarrow;&nbsp;&nbsp;뒤로가기</a><span
				class="text-muted"></span>
		</div>
			<div class="col-md-8 cart">
				<div class="title">
					<div class="row">
						<div class="col">
							<h4>
								<b>장바구니</b>
							</h4>
						</div>
					</div>
				</div>

				<div class="row border-top border-bottom">
					<div class="col-2">
						<c:forEach items="${list}" var="vo">

							<input type="checkbox" name="deleteCart" id="deleteCart"
								value="${vo.cno}">
							<input type="hidden" id='result' />
							<input type="hidden" name="count" id="count" value="${vo.cno}">

							<ul class="col123" data-col="${vo.price * 1}">
								<li><img src="imgDown?imgName=${vo.main_img1}"
									style="width: 78px; height: 78px;"></li>
								<%-- <input type="checkbox" id="pno" class="pno" name="pno" value="${BL.pno}"></input> --%>
								<li class="col"><a
									href="ProductView?pno=${vo.pno}&cate_name=${cate_name}&subcate_name=${subcate_name}">${vo.pname}</a></li>

								<li class="col"><input type="number" value="${vo.c_cnt}"
									id="c_cnt" class="c_cnt" name="c_cnt"
									oninput="if (this.value < 1) this.value = 1;"></li>
								<c:if test="${sessionScope.vo.grade==1 }">
									<li class="col">상품 할인가: ${vo.dis_price}</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==2 }">
									<li class="col">상품 할인가: ${vo.price}</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==3 }">
									<li class="col">상품 할인가: ${vo.dis_price}</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==1 }">
									<li class="price">상품 구매가: ${vo.dis_price * vo.c_cnt }</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==2 }">
									<li class="price">상품 구매가: ${vo.price * vo.c_cnt }</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==3 }">
									<li class="price">상품 구매가: ${vo.dis_price * vo.c_cnt }</li>
								</c:if>

								<%-- <li><button type="b" name="cno" onclick= value="${vo.cno}"></button></li> --%>

							</ul>

						</c:forEach>

					</div>
				</div>				
				<button type="button" onclick="deleteCart2()">선택된 상품 삭제</button>				
			</div>
			<div class="col-md-4 summary">
				<div>
					<h5>
						<b>Summary</b>
					</h5>
				</div>
				<hr>
				<div class="row">
					<div class="col">회원 등급</div>
					<c:if test="${sessionScope.vo.grade==1 }">
						<div class="col text-right">와우회원</div>
					</c:if>
					<c:if test="${sessionScope.vo.grade==2 }">
						<div class="col text-right">일반회원</div>
					</c:if>
					<c:if test="${sessionScope.vo.grade==3 }">
						<div class="col text-right">와우회원</div>
					</c:if>
				</div>
				<hr>
				<div class="row"
					style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
					<div class="col">총구매금액</div>
					<div id="totalPrice" class="col"></div>
				</div>
				<%--             <c:if test="${selectedElementsCnt>0" }>
            <button class="btn" type="submit" >구매하기</button>
       		 </c:if> --%>

				<button class="btn" type="submit">구매하기</button>

			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
/* 
function getCheckedCnt()  {
	  // 선택된 목록 가져오기
	  const query = 'input[name="deleteCart"]:checked';
	  const selectedElements = 
	      document.querySelectorAll(query);
	  
	  // 선택된 목록의 갯수 세기
	  const selectedElementsCnt =
	        selectedElements.length;
	  
	  // 출력
	  document.getElementById('result').innerText
	    = selectedElementsCnt;
	  
	  if(selectedElementsCnt==0){
		  console.log('적어도 한개 이상 구매해주시기 바랍니다.')
		  
	  }  */

/* 	  $('#deleteCart').click(function(){
			var checked = $('#allCk').is(':checked');
			
			if(!checked){
				$('#btn').prop('checked',false);
				console.log('적어도 한개 이상 구매해주시기 바랍니다.');
			}
		}); */
	  
	 /*  var msg='적어도 한개 이상 구매해주시기 바랍니다.'
	 	alert(msg);
}
	 */



$(document).ready(function() {
    // 모든 장바구니 아이템의 가격을 가져와서 총 구매금액을 계산
    calculateTotalPrice();
});
function calculateTotalPrice() {
    const cartItems = document.querySelectorAll('.col123');
    /* console.log('cartItems' + cartItems); */
    let totalPrice = 0;

    cartItems.forEach(function(item) {
        /* console.log('item in');
        console.table('item', item); */
        const quantityElement = item.querySelector('.col input[type="number"]');
        /* console.log('quantityElement', quantityElement);
        console.log('quantityElement.value', quantityElement.value); */
        const priceElement = item.querySelector('.price');
       /*  console.log('priceElement', priceElement); */
        const priceValue = priceElement.textContent.trim().replace(/[^\d]/g, ''); // 가격에서 숫자만 추출
        /* console.log('priceValue', priceValue); */

        if (quantityElement && priceElement) {
            const price = parseInt(priceValue, 10); // priceValue를 숫자로 변환
            const quantity = parseInt(quantityElement.value, 10);
            
            if (!isNaN(price) && !isNaN(quantity)) {
                totalPrice += price;
            }
        }
    });

    // 총 구매금액을 "totalPrice" 엘리먼트에 표시
    document.getElementById('totalPrice').textContent = numberWithCommas(totalPrice) + '원';
}
// 숫자를 천 단위로 콤마를 추가하는 함수
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
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
//HTML 코드의 수량 입력 필드에 대한 이벤트 처리
document.querySelectorAll('.col123').forEach(function(item) {
    const quantityElement = item.querySelector('.col input[type="number"]');
    const priceElement = item.querySelector('.price');
    if (quantityElement) {
        quantityElement.addEventListener('input', function() {
            updateItemTotal(item, quantityElement, priceElement);
        });
    }
});

// 개별 품목의 총 금액 업데이트 함수
function updateItemTotal(item, quantityElement, priceElement) {
    const quantity = parseInt(quantityElement.value, 10);
    const price = parseInt(priceElement.textContent.trim().replace(/[^\d]/g, ''), 10); // 가격에서 숫자만 추출
    const col = parseInt(item.getAttribute('data-col'), 10); // data-col 속성을 읽어옴
    console.log('quantity', quantity);
    console.log('price', price);
    console.log('col', col);
    
    if (!isNaN(quantity) && !isNaN(price) && !isNaN(col)) {
        const total = quantity * col;
        item.querySelector('.price').textContent = numberWithCommas(total) + '원';
        calculateTotalPrice(); // 전체 총 구매금액 업데이트
        console.log('total', total);
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

<%@ include file="/WEB-INF/views/include/footer.jsp"%>