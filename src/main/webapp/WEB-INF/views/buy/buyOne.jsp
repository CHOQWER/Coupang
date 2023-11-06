<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/css/cart.css">
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<form action="insertBuyOne" method="post">
	<div class="card">
		<div class="col">${sessionScope.vo.u_id}</div>
		<div class="row">
			 <div class="col-md-8 cart">
				<div class="title">
					<div class="row">
						<div class="col">
							<h4>
								<b>구매페이지</b>
							</h4>
						</div>
					</div>
				</div>
				
				
				<input type="hidden" name="pno" value="${vo.pno}">
				<input type="hidden" name="pname" value="${vo.pname}">
				<input type="hidden" name="main_img1" value="${vo.main_img1}">
				<input type="hidden" name="price" value="${vo.price}">
				<input type="hidden" name="dis_price" value="${vo.dis_price}">
				

				<div class="row border-top border-bottom">
					<div class="col-2">			
							<ul class="col123">
								<li class="col"><a href="ProductView?pno=${vo.pno}&cate_name=${cate_name}&subcate_name=${subcate_name}">${vo.pname}</a></li> 
								
								<li class="col"><input type="number" name="b_cnt" value="${c_cnt}"></li>
								<c:if test="${sessionScope.vo.grade==1 }">
									<li class="col">${vo.dis_price}</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==2 }">
									<li class="col">${vo.price}</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==3 }">
									<li class="col">${vo.dis_price}</li>
								</c:if>
<%-- 								<c:if test="${sessionScope.vo.grade==2 }">
									<li class="price">${vo.price * vo.b_cnt }</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==3 }">
									<li class="price">${vo.dis_price * vo.b_cnt }</li>
								</c:if> --%>
							</ul>

					</div>
				</div>
				<div class="back-to-shop">
					<a href="javascript:history.back()">&leftarrow;&nbsp;&nbsp;뒤로가기</a><span
						class="text-muted"></span>
				</div>
				

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
					<c:if test="${sessionScope.vo.grade==2 }">
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
                    <p>배송지</p>
                    <div id="post_no" >${sessionScope.vo.u_post_no}</div>
                    <input type="hidden" name="post_no" id="h_post_no" value=${sessionScope.vo.u_post_no }>
                    <div id="addr1">${sessionScope.vo.u_addr1}</div>
                    <input type="hidden" name="addr1" id="h_addr1" value=${sessionScope.vo.u_addr1 }>
                     <div id="addr2">${sessionScope.vo.u_addr2}</div>
                    <input type="hidden" name="addr2" id="h_addr2" value=${sessionScope.vo.u_addr2 }>
                    
                    
                    <button type="button" target="_blank" onclick='openPop("${sessionScope.vo.u_id}")'>배송지목록</button>
                

				<div class="row"
					style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
					<div class="col">총구매금액</div>
					  <div id="totalPrice" class="col"></div>
				</div>
				
				<button class="btn" type="submit">구매하기</button>
			</div>
		</div>
	</div>
</form>

<script>
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
	console.log('quantity',quantity);
	console.log('price',price);
    if (!isNaN(quantity) && !isNaN(price)) {
        const total = quantity * price;
        item.querySelector('.price').textContent = numberWithCommas(total) + '원';
        calculateTotalPrice(); // 전체 총 구매금액 업데이트
        console.log('total',total);
    }
}

function openPop(u_id) {
    var popup = window.open('/selectDeli?u_id=' + u_id , '', 'width=700px,height=800px,scrollbars=yes');
}


function updateAddress(post_no,newAddr1,newAddr2) {
    // 메인 창의 주소 정보 업데이트
    let post_noDiv = document.getElementById('post_no');
    post_noDiv.innerHTML = post_no;  
    document.getElementById("h_post_no").value=post_no;
    
    let addr1Div = document.getElementById('addr1');
    addr1Div.innerHTML = newAddr1; 
    document.getElementById("h_addr1").value=newAddr1;
    
    let addr2Div = document.getElementById('addr2');
    addr2Div.innerHTML = newAddr2; 
    document.getElementById("h_addr2").value=newAddr2;
    
  }


	
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>