<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/css/cart.css">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<form action="insertBuy" method="post" id="insertBuy">
	<div class="card">
		<%-- <div class="col">${sessionScope.vo.u_id}</div> --%>
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

				<c:forEach items="${vo}" var="vo">
				<input type="hidden" name="pno" value="${vo.pno}">
				<input type="hidden" name="pname" value="${vo.pname}">
				<input type="hidden" name="cno" value="${vo.cno}">
				<input type="hidden" name="main_img1" value="${vo.main_img1}">
				<input type="hidden" name="c_cnt" value="${vo.c_cnt}">
				<input type="hidden" name="price" value="${vo.price}">
				<input type="hidden" name="dis_price" value="${vo.dis_price}">
				

				<div class="row border-top border-bottom">
					<div class="col-2">			
							<ul class="col123" data-col="${vo.price * 1}">
								<li class="col"><a href="ProductView?pno=${vo.pno}&cate_name=${cate_name}&subcate_name=${subcate_name}">${vo.pname}</a></li> 
								
								<li class="col"><input type="number" value="${vo.c_cnt}" oninput="if (this.value < 1) this.value = 1;"></li>
								<c:if test="${sessionScope.vo.grade==2 }">
									<li class="col">${vo.price}</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==3 }">
									<li class="col">${vo.dis_price}</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==1 }">
									<li class="price">${vo.dis_price * vo.c_cnt }</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==2 }">
									<li class="price">${vo.price * vo.c_cnt }</li>
								</c:if>
								<c:if test="${sessionScope.vo.grade==3 }">
									<li class="price">${vo.dis_price * vo.c_cnt }</li>
								</c:if>
							</ul>

					</div>
				</div>
				</c:forEach>
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
                    <p>배송지</p>
                    <div id="post_no" >우편번호 : ${sessionScope.vo.u_post_no}</div>
                    <input type="hidden" name="post_no" id="h_post_no" value=${sessionScope.vo.u_post_no }>
                    <div id="addr1">주소 : ${sessionScope.vo.u_addr1}</div>
                    <input type="hidden" name="addr1" id="h_addr1" value=${sessionScope.vo.u_addr1 }>
                     <div id="addr2">상세주소 : ${sessionScope.vo.u_addr2}</div>
                    <input type="hidden" name="addr2" id="h_addr2" value=${sessionScope.vo.u_addr2 }>
                    
                    
                    <button type="button" target="_blank" onclick='openPop("${sessionScope.vo.u_id}")'>배송지목록</button>
                

				<div class="row"
					style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
					<div class="col">총구매금액</div>
					  <div id="totalPrice" class="col"></div>
				</div>
				<div class=btn3>
				<button class="btn2" type="button" id="btnBuyCard" onclick="cardBuy()">카드 결제</button>&nbsp;&nbsp; 
				<button class="btn2" type="button" id="btnBuyKakao" onclick="kakaoBuy()">카카오 간편결제</button>&nbsp;&nbsp;
				</div>
			</div>
		</div>
	</div>
</form>

<script>
let total=0;
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
        total=totalPrice;
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

//개별 품목의 총 금액 업데이트 함수
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

function openPop(u_id) {
    var popup = window.open('/selectDeli?u_id=' + u_id , '', 'width=600px,height=800px,scrollbars=yes');
}

function cardBuy() {
	var u_id = '${sessionScope.vo.u_id}';
	var popup2 = window.open('/cardselect?u_id=' + u_id , '', 'width=600px,height=500px,scrollbars=yes');
	 var checkPopupInterval = setInterval(function() {
	        if (popup2.closed) {
	            // 팝업이 닫히면 insertBuy 실행
                $("#insertBuy").submit();
	            clearInterval(checkPopupInterval); // 인터벌 중지
	        }
	    }, 1000); // 1초마다 팝업 상태 확인
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


	/*
	var checkboxes = document.getElementById("deleteCart");
	var selectedItems = [];
	for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedItems.push(checkboxes[i].value);
        }
    }
	console.log(selectedItems);*/
/* 	function openCardListPopup() {
	    const u_id = '${sessionScope.vo.u_id}'; 
	    const url = '/cardselect?u_id=' + u_id;
	    const popup = window.open(url, '카드 선택', 'width=600, height=400');
	    }
	 */
	
	function modal(){ //결제창 on-off
		popup.style.display = 'block';
	}
	closebtn.addEventListener('click', function(){
		popup.style.display = 'none';
	});
	
	function kakaoBuy() {
		var confirmation = confirm("결제하시겠습니까?");
		var u_id = '${sessionScope.vo.u_id}';
		//var totalPrice = document.getElementById('totalPrice').textContent
		console.log("u_id="+u_id);
		console.log("total="+total);
		if (confirmation) {
			console.log($('#u_id'));
			var IMP = window.IMP;
			IMP.init('imp23810830');
			IMP.request_pay({		
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '${sessionScope.vo.u_name}',
				amount : total,/*$('.amountValue').val(),*/
				buyer_email : 'u_email',
				buyer_name : 'u_name',
				buyer_tel : 'u_mobile',
				buyer_addr : 'u_addr1',
				buyer_postcode : 'u_post_no',
			},function(rsp){
				console.log("rsp="+rsp);
				if(rsp.success){
					var msg = "결제가 완료되었습니다";
					alert(msg);
					$("#insertBuy").submit();
		            
		        }else{
		        	var msg = "결제에 실패하였습니다."
	        		rsp.error_msg;
					location.href="redirect:cartbuy";
		        }
				//document.location.href="deliveryStatus";
			});
		} else {
			
		}
	}
	
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>