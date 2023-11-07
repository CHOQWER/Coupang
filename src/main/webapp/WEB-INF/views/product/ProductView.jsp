<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/productview.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/star-rating/css/star-rating.css"
	media="all" type="text/css" />
<link rel="stylesheet"
	href="/resources/star-rating/themes/krajee-svg/theme.css" media="all"
	type="text/css" />
<script src="/resources/star-rating/js/star-rating.min.js"
	type="text/javascript"></script>
<script src="/resources/star-rating/themes/krajee-svg/theme.min.js"
	type="text/javascript"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<section class="content">
	<div class="cate">쿠팡홈 > ${cate_name} > ${subcate_name}</div>

	<form action="insertcart" method="post" id="frmDetail" name="frmDetail">
		<input type="hidden" name="pno" value="${pvo.pno}"> <input
			type="hidden" name="ino" value="${ivo.ino }"> <input
			type="hidden" name="price" value="${pvo.price }"> <input
			type="hidden" name="dis_price" value="${pvo.dis_price }"> <input
			type="hidden" name="pname" value="${pvo.pname }"> <input
			type="hidden" name="main_img1" value="${ivo.main_img1}">
		<!-- <input type="hidden" name="c_cnt" value="c_cnt"> -->
	</form>
	<!--좌측 메인/서브 이미지-->
	<div class="content-main">

		<div id="content-wrapper">
			<div class="column">
				<div id="img-container">
					<div id="lens"></div>
					<img id=featured src="imgDown?imgName=${ivo.main_img1}">
				</div>
				<div id="slide-wrapper">
					<div id="slider">
						<c:if test="${not empty ivo.main_img2}">
							<img class="thumbnail" src="imgDown?imgName=${ivo.main_img2}">
						</c:if>
						<c:if test="${not empty ivo.main_img3}">
							<img class="thumbnail" src="imgDown?imgName=${ivo.main_img3}">
						</c:if>
						<c:if test="${not empty ivo.main_img4}">
							<img class="thumbnail" src="imgDown?imgName=${ivo.main_img4}">
						</c:if>
						<c:if test="${not empty ivo.main_img5}">
							<img class="thumbnail" src="imgDown?imgName=${ivo.main_img5}">
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<!--우측 구매하는 부분-->
		<div class="prod-buy">
			<div class="prod-header">
				<div class="prod-company">(주)${pvo.company}</div>
				<div class="prod-name">${pvo.pname}</div>

				<div class="prod-review">
					<table>
						<tr>
							<td><input id="avgscore" name="avgscore"
								value="${map.get('AVG')}" class="rating rating-loading"
								data-size="sm" readonly="readonly" /></td>
							<td><a href="#target"><span id="span-cnt"
									style="font-size: 1.4rem;">${map.get('CNT')}건의 리뷰보기</span></a></td>
						</tr>
					</table>
				</div>

			</div>
			<hr>
			<div class="prod-price">
				<c:if test="${sessionScope.vo.grade==2 }">
					<div class="origin-price">
						<fmt:formatNumber value="${pvo.dis_price}" pattern="#,###" />
					</div>
					<div class="sale-price">
						<fmt:formatNumber value="${pvo.price}" pattern="#,###" />
					</div>
				</c:if>
				<c:if test="${sessionScope.vo.grade!=2 }">
					<div class="origin-price">
						<fmt:formatNumber value="${pvo.price}" pattern="#,###" />
					</div>
					<div class="sale-price">
						<fmt:formatNumber value="${pvo.dis_price}" pattern="#,###" />
					</div>
				</c:if>
			</div>

			<div class="prod-color">
				<div class="color-option">
					<div class="color-select">
						<a>${pvo.color}</a>
					</div>
				</div>

			</div>

			<!-- EX)와우 회원이면 무료배송+1일 뒤 도착예정, 일반 회원이면 배송비3000원+5일뒤도착예정 구현하기 -->
			  <c:if test="${sessionScope.vo.grade==3}">
			  <div class="prod-delivery">
                    <p>무료배송</p>
                    <p id="delivery-date"></p>
                </div>
              </c:if>
              
              <c:if test="${sessionScope.vo.grade!=3}">
			  <div class="prod-delivery">
                    <p>배송비 3000원</p>
                    <p id="delivery-date-nomal"></p>
                </div>
              </c:if>
              
              
              
              

			<div class="prod-buy-footer">
				<input type="number" name="c_cnt" id="c_cnt" class="c_cnt" value="1"
					placeholder="1" min="1" max="${pvo.qty}"
					oninput="if (this.value < 1) this.value = 1; if (this.value > ${pvo.qty}) this.value = ${pvo.qty};" />


				<button onclick="cartSubmit()" class="btn btn-outline-primary"
					style="width: 170px; height: 60px; margin-left: 20px; font-size: 2rem; font-weight: bold;">
					장바구니</button>
				<button type="button" style="background: none; border: none;">
					<a href="#" onclick="setQuantityAndSubmit()"
						class="btn btn-primary"
						style="width: 170px; height: 60px; margin-left: 20px; font-size: 2rem; font-weight: bold; line-height: 1.8;">바로구매</a>
				</button>


				<input type="hidden" name="quantity" id="quantityInput" value="1" />
				<input type="hidden" name="pno" id="pno" value="${pvo.pno}" />
				<%--           <a href="buyOne?pno=${pvo.pno}" onclick="getCnt()"> <button type="button">바로구매</button> </a>    --%>

			</div>
			<!-- <input type="hidden" name=""> -->



		</div>

	</div>






	<div class="content-section"></div>
	<div class="content">
		<p>필수 표기 정보</p>
		<div class="content-info">${pvo.content}</div>
		<div class="detail-img">
			<div class="detailinfo showstep1">
				<div class="detail-content">
					<c:if test="${not empty ivo.con_img_1}">
						<img src="imgDown?imgName=${ivo.con_img_1}" alt="상세이미지">
					</c:if>
					<c:if test="${not empty ivo.con_img_2}">
						<img src="imgDown?imgName=${ivo.con_img_2}" alt="상세이미지">
					</c:if>
				</div>
			</div>
		</div>
		<div class="button1">
			<button class="btn_open">상품정보 더보기⤵</button>
			<button class="btn_close hide">상품정보 접기⤴</button>
		</div>

		<!-- 상품평 -->
		<a name="target"> </a>
		<hr>
		<h2>상품평</h2>

		<!-- 로그인 상태에서만 리뷰 작성 칸 보이기 -->
		<c:if test="${sessionScope.vo.u_id!=null}">
			<div class="review">
				<label for="input-7-sm" class="control-label"></label> <input
					id="score" name="score" class="rating rating-loading" data-min="0"
					data-max="5" data-step="0.5" data-size="sm">
				<hr/>

					
				<input type="text" maxlength="100" placeholder="글제목을 입력해주세요." id="r_title" name="r_title" required="required"> <br> 
				<input type="text" maxlength="100" placeholder="다른 고객님에게 도움이 되도록 상품에 대한 솔직한 평가를 남겨주세요." id="content" name="content" size="50" required="required"> <br> 
				<button type="button" class="btn btn-outline-success" onclick="saveStar()">리뷰 남기기</button>
			</div>
		</c:if>

		<nav>
			<input type="hidden" name="page" id="page" value="0">
			<button type="button" id="btn_next" style="display: none"
				onclick="getStar()">더보기</button>
		</nav>
		<br> <input type="hidden" name="page" id="page" value="0">



		<!-- 리뷰 inner html 반복할곳 -->
		<table id="tbl_star">

		</table>


		<button type="button" id="btn_next" style="display: none"
			onclick="getStar()">더보기</button>
	

		<hr>
</div>
</section>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script type="text/javascript" src="/resources/js/zoomslider.js"></script>
<script type="text/javascript" src="/resources/js/zoomscript.js"></script>


<script type="text/javascript">
const currentDate = new Date();

// 1일을 더한 날짜 계산
currentDate.setDate(currentDate.getDate() + 1);

// 날짜 형식 지정 (예: "월 일, 연도")
const options = {weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
const formattedDate = currentDate.toLocaleDateString('ko-KR', options);

// 계산된 날짜를 페이지에 표시
document.getElementById('delivery-date').textContent = formattedDate + ' 도착 예정';

//3일을 더한 날짜 계산
currentDate.setDate(currentDate.getDate() + 3);

//계산된 날짜를 페이지에 표시
document.getElementById('delivery-date-nomal').textContent = formattedDate + ' 도착 예정';

//////////////////////////////////////////////////////////////////////////////////////


function getCnt(){
	   let frm=$("#frmDetail");
	   frm.attr("action","");   
	   frm.submit();
	}
	
function setQuantityAndSubmit() {
    let quantity = document.getElementById("c_cnt").value;

    document.getElementById("quantityInput").value = quantity;
    var URL = "buyOne?pno="+${pvo.pno} +"&c_cnt=" + quantity
   
    
	   let frm=$("#frmDetail");
	   frm.attr("action",URL);   
	   frm.submit(); 
}

	
/* @@@@@@@@@@@@@@@@@@@@@@@@@@@ 더보기 버튼 시작 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
document.addEventListener('DOMContentLoaded', function(){ //DOM 생성 후 이벤트 리스너 등록
    //더보기 버튼 이벤트 리스너
    document.querySelector('.btn_open').addEventListener('click', function(e){
        
        let classList = document.querySelector('.detailinfo').classList; // 더보기 프레임의 클래스 정보 얻기
        let contentHeight = document.querySelector('.detailinfo > .detail-content').offsetHeight; //컨텐츠 높이 얻기

        // 2단계이면 전체보기로
        if(classList.contains('showstep2')){
            classList.remove('showstep2');
        }
        // 1단계이면 2단계로
        if(classList.contains('showstep1')){
            classList.remove('showstep1');
            // if(contentHeight > 800){
            //     classList.add('showstep2');
            // }else{
            //     document.querySelector('.btn_open').classList.add('hide');
            // }
        }
        
        //전체보기시 더보기 버튼 감추기 & 감추기 버튼 표시
        if(!classList.contains('showstep1') && !classList.contains('showstep2')){
            e.target.classList.add('hide'); 
            document.querySelector('.btn_close').classList.remove('hide');
            
        }
        
    });
}); 


// 감추기 버튼 이벤트 리스너
document.querySelector('.btn_close').addEventListener('click', function(e){
    e.target.classList.add('hide');
    document.querySelector('.btn_open').classList.remove('hide'); // 더보기 버튼 감춤
    document.querySelector('.detailinfo').classList.add('showstep1'); // 초기 감춤 상태로 복귀
});



//컨텐츠 로딩 완료 후 높이 기준으로 클래스 재처리
/* window.addEventListener('load', function(){
    let contentHeight = document.querySelector('.detailinfo > .detail-content').offsetHeight; //컨텐츠 높이 얻기
    if(contentHeight <= 300){
        document.querySelector('.detail-content').classList.remove('showstep1'); // 초기값보다 작으면 전체 컨텐츠 표시
        document.querySelector('.btn_open').classList.add('hide'); // 버튼 감춤
    }
}); */

/* @@@@@@@@@@@@@@@@@@@@@@@@@@@ 더보기 버튼 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/



 function cartSubmit(){
   let frm=$("#frmDetail");
   frm.attr("action","insertCart");   
   frm.submit();
} 
/* function buySubmit() {
      let frm=$("#frmDetail");
      frm.attr("action","buyOne");   
      frm.submit();
} */

/*==========================================*/
$(document).ready(function() {
      $("#page").val(0);
      getStar();
   });   
   
/*=============================================
* 스타레이팅 초기화
*=============================================*/
function newStar(){
   console.log("newStar");
   // loding 중인 별점을 보여주는 작업
   let ratingStar=$(".rating-loading");
   if(ratingStar.length){//별점보여주기가 1개 이상 있으면
      ratingStar.removeClass("rating-loading").addClass("rating-loading").rating();
   }
   
   //재생성시 크기가 중간 사이즈 고정되는 버그로 작은사이즈로 일괄 변경 추가
   $(".rating-container").removeClass("rating-md rating-sm");
   $(".rating-container").addClass("rating-sm");
}


/*===================================================
Ajax 별점과 commemt  저장
common.js doAjaxHtml(url, param, callback) 호출
===================================================*/
function saveStar(){
   console.log("saveStar")
   let content=$("#content").val().trim();
   let r_title=$("#r_title").val().trim();
   
   let score=$("#score").val();
   
   if(score==0){
      alert("점수를 입력하세요.");
      return;
   }
   
   if(content==""){
      alert("리뷰를 입력하세요.");
      $("#content").focus();
      return;
   } 
   
   if(r_title==""){
      alert("리뷰 제목을 입력하세요.");
      $("#r_title").focus();
      return;
   }
   
   
   let url="saveStar";//서블릿 매핑 주소
   let param={"u_id":"${sessionScope.vo.u_id}",
            "pno":${pvo.pno}, 
            "score":score,
            "r_title":r_title,
            "r_content":content,
       
            };
   console.log(param);
   doAjaxHtml(url, param, saveStarAfter);
}

function saveStarAfter(data){
   console.log("saveStarAfter");
   console.log(data);
   let retData=JSON.parse(data);
   $("#avgscore").rating("destroy");
   $("#avgscore").val(retData.avgScore);
   $("#avgscore").rating("create");
   let spanCnt=document.getElementById("span-cnt");
   console.log("data.cnt="+retData.cnt);
   spanCnt.innerHTML=retData.cnt;
   
   $("#tbl_star").html("");
   $("#page").val(0);

   getStar();
   
   $("#score").rating("destroy");
   $("#score").val(0);
   $("#score").rating("create");
   
   $("#content").val("");
   $("#r_title").val("");
   $("#content").focus();
   
   newStar();
}

/*===================================================
               별점 가져오기
===================================================*/


function getStar(){
   console.log("getStar")
   let url="getStar";
   let param={"pno":${pvo.pno}, 
            "page":$("#page").val()*1+1
            };
   //증가한 페이지를 적용
   $("#page").val($("#page").val()*1+1);
   console.log(param);
   doAjax(url, param, getStarAfter);
}
   

function getStarAfter(data){
	   console.log("getStarAfter");   
	   if(data=="err"){
	       // 표시할 자료 없음
	    }else{
	          console.log(data);   
	          console.log("이쪽으로 오니?")
	          //data 배열에 있는 값을 tbl_star 에 html 태그로 조립해서 출력 
	          let starList=data.arr;
	          console.log(starList);
	          let html="";
	          for(let vo of starList){//js foreach      	  
	             html+='<tr>';
	             
	             html+='<td>';
	             html+='<dl>';
	             html+='<dt>';
	             html+='<input id="score" name="score" value='+vo.score+' class="rating rating-loading" data-size="sm" readonly="readonly">';
	             html+='</dt>';
	             html+='<dt>'+vo.r_title;
	             html+='</dt>';
	             html+='<dt>'+vo.r_content;
	             html+='</dt>';
	             html+='<dl>';
	             html+='</td>';
	             html+='<td>';
	             html+='<dl>';
	             html+='<dt>' +vo.u_id ;
	             html+='</dt>';
	             html+='<dt>'+ vo.r_regdate;
	             html+='</dt>';
	             html+='</dl>';
	             html+='</td>';
	             html+='<td>';
	             html+='<button onclick="deleteReview('+vo.rno+')">삭제';
	             html+='</button>';
	             html+='</td>';
	             html+='</tr>';
	          }//for
	          
	          $("#tbl_star").append(html);
	          newStar();
	          if(data.next){//더보기 버튼을 보여주기
	             $("#btn_next").css("display","block");
	          }else $("#btn_next").css("display","none");
	          newStar();
	         
		}

	}


	/* 삭제버튼 에러나지만 기능은 가능 */
	 	function deleteReview(rno) {
			if(${sessionScope.vo.grade==0}) {
				if (confirm("정말로 별점을 삭제하시겠습니까?")) {
			        let url = "deleteReview";
			        let param = {"rno": rno};
			        console.log(param);
			        location.reload();
			        doAjax(url, param, function (data) {
			        });
			    } 
			} else {
		    	alert("권한이 없습니다.");
		    }
		}

	/* function deleteReview(rno) {
		//console.log(rno);
		
	    if (confirm("정말로 별점을 삭제하시겠습니까?")) {
	        let url = "deleteReview";
	        let param = {"rno": rno};
	        console.log(param);
	        doAjax(url, param, function (data) {
	        	console.log("왓냐");
	        	if (data == "success") {
	                location.reload();
	            } else {
	                alert("별점 삭제 중 오류가 발생했습니다.");
	            }
	        });
	    }
	} */

</script>