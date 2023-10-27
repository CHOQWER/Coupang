<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">

/* $(function() {

    $("#send").click( function() {

         $('#send_form').submit();
         setTimeout(function() {   
             window.close();

          }, 100);

      });

}); */

/*  function  popupClose(){
    $('#send_form').submit();
    setTimeout(function() {   
        window.close();

     }, 100);
}  */
</script>
<main>
	<form action="sellerUpdateProduct?pno=${vo.pno}&u_id=${vo.u_id}" method="post" id="send_form">
		<table class="table table-sm table-bordered">
		<h2>변경을 원하는 곳만 입력해주시기 바랍니다.</h2>

			<tr>
				<th>상품번호</th>
				<td><p type="text" size="120" maxlength="50" name=pno value="${vo.pno}">${vo.pno}</p></td>
			</tr> 
			<tr>
				<th>판매자 아이디</th>
				<td><p type="text" size="120" maxlength="50" name="u_id" id="u_id" value="${vo.u_id}">${vo.u_id}</p></td>
			</tr>
	        <tr>
				<th>카테고리 번호</th> <!--  옵션 선택 -->
				<td><input type="text" size="120"  maxlength="30" name="ca_no" id="ca_no" placeholder="카테고리 번호 입력" value="${vo.ca_no }"></td>
			</tr>
	        <tr>
				<th>부 카테고리 번호</th> <!--  옵션 선택 -->
				<td><input type="text" size="120"  maxlength="30" name="sca_no" id="sca_no" placeholder="부 카테고리 번호 입력" value="${vo.sca_no }"></td>
			</tr>
			<tr>
				<th>제조회사</th>
				<td><input type="text" size="120"  maxlength="7" name="company" id="company"  value="${vo.company}"
				  placeholder="제조회사 입력" ></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" size="120"  maxlength="7" name="pname" id="pname" value="${vo.pname}"
				   placeholder="상품명입력" ></td>
			</tr>
	        <tr>
				<th>할인 전 가격</th> <!-- 할인가격 보다 같거나 커야함 -->
				<td><input type="text" size="120"  maxlength="7" name="price" id="price"  value="${vo.price}"
				   placeholder="가격입력(할인 후 입력과 같게 입력할수있습니다.)" ></td>
			</tr>
	        <th>할인 후 가격</th>
				<td><input type="text" size="120"  maxlength="7" name="dis_price" id="dis_price"   value="${vo.dis_price}"
				  placeholder="최대 MAX할인가격입력" ></td>
			</tr>
	        <tr>
				<th>상세 설명</th>
				<td><textarea name="content" id="content" cols="119" rows="10" maxlength="1000" ></textarea></td>
			</tr>
			<tr>
				<th>색상</th> 
				<td><input type="text" size="120"  maxlength="7" name="color" id="color"  value="${vo.color}"
				   placeholder="색상입력" ></td>
			</tr>
			<tr>
				<th>판매 가능 개수</th>
				<td><input type="text" size="120"  maxlength="7" name="qty" id="qty"  value="${vo.qty}"
				  placeholder="판매 등록 개수 입력" ></td>
			</tr>

		</table>
			<div class="btn">
				<button type="submit" class="btn btn-success" id="send">상품 수정</button> &nbsp; 
				<!-- <button type="submit" class="btn btn-success">상품 삭제</button> &nbsp;  -->
			    <button type="reset" class="btn btn-secondary">다시 입력</button>
		    </div>
	</form>
 </main>
