<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="../resources/css/productview.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<link rel="stylesheet" href="/resources/star-rating/css/star-rating.css"
   media="all" type="text/css" />
<link rel="stylesheet"
   href="/resources/star-rating/themes/krajee-svg/theme.css" media="all"
   type="text/css" />
<script src="/resources/star-rating/js/star-rating.min.js"
   type="text/javascript"></script>
<script src="/resources/star-rating/themes/krajee-svg/theme.min.js"
   type="text/javascript"></script>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

   <section class="content">
      <div class="cate">쿠팡홈 > 태블릿PC > 태블릿PC</div>
      
      <form action="insertcart" method="post" id="frmDetail" name="frmDetail">
         <input type="hidden" name="pno" value="${pvo.pno}">
         <input type="hidden" name="ino" value="${ivo.ino }">
      <!--좌측 메인/서브 이미지-->
      <div class="content-main">
         <div class="main-img">
            <div class="main-img2">
            	<img src="imgDown?imgName=${ivo.main_img1}" alt="메인이미지">
			</div>
            <!-- 이미지가 null이면 표시 안되게 -->
            <div class="sub-img">
               <c:if test="${not empty ivo.main_img2}">
                  <a href=""><img src="imgDown?imgName=${ivo.main_img2}"
                     alt="서브이미지"></a>
               </c:if>
               <c:if test="${not empty ivo.main_img3}">
                  <img src="imgDown?imgName=${ivo.main_img3}" alt="서브이미지">
               </c:if>
               <c:if test="${not empty ivo.main_img4}">
                  <img src="imgDown?imgName=${ivo.main_img4}" alt="서브이미지">
               </c:if>
               <c:if test="${not empty ivo.main_img5}">
                  <img src="imgDown?imgName=${ivo.main_img5}" alt="서브이미지">
               </c:if>
            </div>
         </div>


         <!--우측 구매하는 부분-->
         <div class="prod-buy">

            <div class="prod-header">

               <div class="prod-company">${pvo.company}</div>
               <div class="prod-name">${pvo.pname}</div> <hr>
               <div class="prod-review">
                  <table>
                     <tr>
                        <td>
                        <input id="avgscore" name="avgscore" value="${map.get('AVG')}" 
                        class="rating rating-loading" data-size="sm" readonly="readonly" />
                        </td>
                        <td>
                        <a href="#target"><span id="span-cnt">${map.get('CNT')}건의 리뷰보기</span></a>
                        </td>
                     </tr>
                  </table>
               </div>

            </div>

            <div class="prod-price">
            <c:if test="${sessionScope.vo.grade==2 }">
               <div class="origin-price"><fmt:formatNumber value="${pvo.dis_price}" pattern="#,###"/></div>
               <div class="sale-price"><fmt:formatNumber value="${pvo.price}" pattern="#,###"/></div>
            </c:if>
            <c:if test="${sessionScope.vo.grade==3 }">
               <div class="origin-price"><fmt:formatNumber value="${pvo.price}" pattern="#,###"/></div>
               <div class="sale-price"><fmt:formatNumber value="${pvo.dis_price}" pattern="#,###"/></div>
            </c:if>
            </div>

            <div class="prod-color">
               <div class="color-option">
                  <div class="color-select">
                     ${pvo.color}
                  </div>
               </div>

            </div>

            <!-- EX)와우 회원이면 무료배송+1일 뒤 도착예정, 일반 회원이면 배송비3000원+5일뒤도착예정 구현하기 -->
            <div class="prod-delivery">
               <p>무료배송</p>
               <p>모래(토) 10/21 도착 예정</p>
            </div>

            <div class="prod-buy-footer">

               <!-- qty 만큼 선택하기..?? -->
               
               <input type="number" name="c_cnt" id="c_cnt" value="1" placeholder="1" min="1" max="${pvo.qty}"/>         
               <button onclick="cartSubmit()">장바구니</button>               
               <!-- <button onclick="buySubmit()">구매하기</button> -->
            </div>
            <!-- <input type="hidden" name=""> -->

         </div>
      </div>
      </form>



      <div class="content-section"></div>
      <div class="tab-title">
         <ul>

            <li>상품평</li>
            <li>상품 문의</li>
            <li>배송/교환/반품 안내</li>
         </ul>
      </div>


      <div class="content">
         <p>필수 표기 정보</p>
         <div class="content-info">${pvo.content}</div>

         <div class="detail-img">
            <c:if test="${not empty ivo.con_img_1}">
               <img src="imgDown?imgName=${ivo.con_img_1}" alt="상세이미지">
            </c:if>
            <c:if test="${not empty ivo.con_img_2}">
               <img src="imgDown?imgName=${ivo.con_img_2}" alt="상세이미지">
            </c:if>
         </div>

         
         <!-- 상품평 -->
         <a name="target"> </a>
         <hr>
         <h2>상품평</h2>
         
         <!-- 로그인 상태에서만 리뷰 작성 칸 보이기 -->
         <c:if test="${sessionScope.vo.u_id!=null}">
         <div class="review">
            <label for="input-7-sm" class="control-label"></label> 
            <input id="score" name="score" class="rating rating-loading" data-min="0"
               data-max="5" data-step="0.5" data-size="sm">
            <hr/>

            글제목:<input type="text" maxlength="100" id="r_title" name="r_title"
               required="required"> <br>
            리뷰:<input type="text" maxlength="100"
               id="content" name="content" size="50" required="required"> <br>
            파일찾기:<input type="file" id="r_photo"> <br>
            <button type="button" onclick="saveStar()">리뷰 남기기</button>
         </div>
         </c:if>
         
         <nav>
            <input type="hidden" name="page" id="page" value="0">
            <button type="button" id="btn_next" style="display: none" onclick="getStar()">더보기</button>
         </nav> <br> 
         <input type="hidden" name="page" id="page" value="0">
         
         
        
         <!-- 리뷰 inner html 반복할곳 -->
		<table id="tbl_star">

		</table>
         
         
         <button type="button" id="btn_next" style="display: none"
            onclick="getStar()">더보기</button>

         
         <hr>
         <div class="prod-qa">
            <h2>상품문의</h2>
            <ul>
               <li>구매한 상품의 취소/반품은 마이쿠팡 구매내역에서 신청 가능합니다</li>
               <li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
               <li>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1 문의하기를
                  이용해주세요.</li>
               <li>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동,
                  노출제한, 삭제 등의 조치가 취해질 수 있습니다.</li>
               <li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
            </ul>
            <hr>
            <div class="prod-userqa">질문</div>
            <div class="prod-answer">답변</div>
            <a href="">더보기</a>
         </div>
      </div>
   </section>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript">
function cartSubmit(){
   let frm=$("#frmDetail");
   frm.attr("action","insertCart");
   frm.submit();
}

/*==========================================*/
$(document).ready(function(){
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
   let rno=$("#rno").val();
   let content=$("#content").val().trim();
   let r_title=$("#r_title").val().trim();
   let r_photo=$("#r_photo").val().trim();
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
   let param={"rno":rno,
		    "u_id":"${sessionScope.vo.u_id}",
		    "grade":"${sessionScope.vo.grade}",
            "pno":${pvo.pno}, 
            "score":score,
            "r_title":r_title,
            "r_content":content,
            "r_photo":r_photo,
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
          //data 배열에 있는 값을 tbl_star 에 html 태그로 조립해서 출력 
          let starList=data.arr;
          console.log(starList);
          let html="";
          for(let vo of starList){//js foreach      	  
             html+='<tr>';
             html+='<td>';
             html+='<img src='+vo.r_photo+' alt="" width="100" height="100">';
             html+='</td>';
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
             html+='</tr>';
          }//for
          
 	 		$("#tbl_star").append(html);
	 		//let next=data.next;//true, false
	 		//console.log(next);
	 		if(data.next){//더보기 버튼을 보여주기
	 			$("#btn_next").css("display","block");
	 		}else $("#btn_next").css("display","none");
	 		// loding 중인 별점을 보여주는 작업
	 		newStar();
          }

}


/* 관리자가 삭제가 안됨 반대로 기능
 * 삭제버튼 에러나지만 기능은 가능
 */*/
function deleteReview(rno) {
    // console.log(rno);
    let grade = {"grade":"${sessionScope.vo.grade}"} // sessionScope.vo.grade 값 가져오기
    console.log(grade);
    
    if (grade === "0") { // 
    	alert("나가");
    } else {
    	if (confirm("정말로 별점을 삭제하시겠습니까?")) {
            let url = "deleteReview";
            let param = {"rno": rno};
            console.log(param);
            doAjax(url, param, deleteAfter);
            location.reload();
        }
    }
}

/*
 function deleteAfter(data){
	console.log(data);
	location.reload();
	if (data == "success") {
        location.reload();
    } else {
        alert("별점 삭제 중 오류가 발생했습니다.");
    }
}
*/

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
}
*/

</script>