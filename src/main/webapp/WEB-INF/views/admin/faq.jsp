<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/faq.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<body>
	<div class="container123">
		<div id="menu">
			<ul>
				<li id="notice-title" class="menu-item" data-type="notice"><h1>
						<a href="notice">공지사항</a>
					</h1></li>
				<li id="faq-title" class="menu-item" data-type="faq2"><h1>
						<a href="faq">자주 묻는 질문</a>
					</h1></li>
			</ul>
		</div>
		<ul>
			<li class="faq">
				<div class="question">
					1.[교환/반품] 상품을 교환/반품하고 싶어요. <span class="icon-main"> <i
						class="fa-solid fa-plus"></i>
					</span>
				</div>
				<div class="answer non-active">교교환 및 반품은 미사용 상품에 한하여 가능하며,
					마이쿠팡을 통해 직접하실 수 있습니다. 상품을 회수한 후 검수 단계에서 문제가 발견되면 고객님께 연락을 드릴 수
					있습니다. 교환은 구매 상품과 동일한 상품으로만 가능합니다. 색상 및 사이즈 변경을 원하시면 반품 후 재구매를 해 주시기
					바랍니다.</div>
			</li>
			<li class="faq">
				<div class="question">
					2.[와우 멤버십] 와우 멤버십을 등록/해지하고 싶어요. <span class="icon-main"> <i
						class="fa-solid fa-plus"></i>
					</span>
				</div>
				<p class="answer non-active">와우 멤버십 등록/해지하기 마이페이지→와우멤버쉽 등록/해지</p>

			</li>
			<li class="faq">
				<div class="question">
					3.[배송일정] 주문한 상품은 언제 배송되나요? <span class="icon-main"> <i
						class="fa-solid fa-plus"></i>
					</span>
				</div>
				<p class="answer non-active">배송은 주문 시 안내된 예정일까지 배송됩니다. 배송 예정일은
					평균 2틀입니다.</p>
			</li>
			<li class="faq">
				<div class="question">
					4.[와우 멤버십] 와우 멤버십이 무엇인가요? <span class="icon-main"> <i
						class="fa-solid fa-plus"></i>
					</span>
				</div>
				<p class="answer non-active">와우 멤버십이란 쿠팡의 상품 구매시에 할인가를 적용받을수 있는
					멤버십 서비스입니다. 연간 결제이며 최초 결제시 60,000원이 결제됩니다. 이용을 원하지 않으면 언제든 취소할 수
					있습니다.</p>
			</li>
			<li class="faq">
				<div class="question">
					5.[회원정보] 회원정보 수정은 어떻게 하나요? <span class="icon-main"> <i
						class="fa-solid fa-plus"></i>
					</span>
				</div>
				<p class="answer non-active">마이페이지→회원정보수정</p>
			</li>
		</ul>
	</div>
	</div>
</body>
<script> 
const faqs = document.querySelectorAll(".faq"); 
for (const item of faqs) { 
    const curr_faq = item.childNodes; 
    console.log(curr_faq); 
    const question = curr_faq[1]; 
    const answer = curr_faq[3]; 
    const icon = question.querySelector(".icon-main"); 
    icon.addEventListener("click", function () { 
        answer.classList.toggle("non-active"); 
        const i = icon.querySelector("i"); 
        i.classList.toggle("fa-xmark"); 
        i.classList.toggle("fa-plus"); 
    }); 
} 
    </script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>