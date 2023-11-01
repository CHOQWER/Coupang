<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/common.css">
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/additional-methods.js"></script>
<script src="/resources/js/fileupload_validate.js"></script>
<title>Insert title here</title>
</head>
<body>
	<main>
		<form action="sellerInsertProduct" method="post"
			enctype="multipart/form-data" id="uploadForm" name="uploadForm">
			<input type="hidden" name="ca_no" value="${list.ca_no}" >
			<input type="hidden" name="sca_no" value="${list.sca_no}" >
			
			<table class="table table-sm table-bordered">
				<tr>
					<th>판매자 아이디</th>
					<!-- 아이디 가져오기 -->
					<td><p type="text" size="120" maxlength="50" name="u_id"
							id="u_id">${vo.u_id}</p></td>
				</tr>

				<tr>
					<td>
					<label for="mCate">메인카테고리</label>
						<select name="mCate" id="mCate" onchange="subCateChange()" >
							<c:forEach items="${mCate}" var="m">
								<option value="${m.ca_no}">${m.cate_name}</option>
							</c:forEach>
						</select>
					</td>
					
						<td>
						<label for="sCate">서브카테고리</label>
						<select name="sCate" id="sCate" >
								<option value="1">JavaScript</option>
						</select>
	
							<div style="display: none">
								<c:forEach items="${sCate}" var="s">
									<div class="item${s.ca_no} ${s.sca_no}">${s.subcate_name}:${s.sca_no}</div>
								</c:forEach>
							</div>
						</td>
				</tr>

				<tr>
					<th>제조회사</th>
					<td><input type="text" size="120" maxlength="7" name="company"
						id="company" placeholder="제조회사 입력" required></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" size="120" maxlength="7" name="pname"
						id="pname" placeholder="상품명입력" required></td>
				</tr>
				<tr>
					<th>색상</th>
					<td><input type="text" size="120" maxlength="7" name="color"
						id="color" placeholder="색상입력"></td>
				</tr>
				<tr>
					<th>할인 전 가격</th>
					<!-- 할인가격 보다 같거나 커야함 -->
					<td><input type="number" size="120" maxlength="7" name="price"
						id="price" placeholder="가격입력(할인 후 입력과 같게 입력할수있습니다.)" required></td>
				</tr>
				<tr>
					<th>할인 후 가격</th>
					<td><input type="number" size="120" maxlength="7"
						name="dis_price" id="dis_price" placeholder="최대 MAX할인가격입력"
						required></td>
				</tr>
				<tr>
					<th>판매 개수</th>
					<td><input type="number" size="120" maxlength="7" name="qty"
						id="qty" placeholder="판매 등록 개수 입력" required></td>
				</tr>
				<tr>
					<th>상세 설명</th>
					<td><textarea name="content" id="content" cols="119" rows="3"
							maxlength="1000"></textarea></td>
				</tr>


				<tr>
					<th>메인 이미지 1</th>
					<td>
						<div class="form-group row">
							<label for="file" class="col-sm-2 col-form-label">파일첨부</label>
							<div class="col-sm-10">
								<input type="file" name="uploadFile" id="uploadFile"
									accept="image/*" onchange="uploadFileCheck()"
									required="required"> <small class="text-muted">(파일크기
									: 10MB / 이미지 파일만 가능)</small> <small id="file" class="text-info"></small>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>메인 이미지 2</th>
					<td>
						<div class="form-group row">
							<label for="file" class="col-sm-2 col-form-label">파일첨부</label>
							<div class="col-sm-10">
								<input type="file" name="uploadFile" id="uploadFile"
									accept="image/*" onchange="uploadFileCheck()"> <small
									class="text-muted">(파일크기 : 10MB / 이미지 파일만 가능)</small> <small
									id="file" class="text-info"></small>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>메인 이미지 3</th>
					<td>
						<div class="form-group row">
							<label for="file" class="col-sm-2 col-form-label">파일첨부</label>
							<div class="col-sm-10">
								<input type="file" name="uploadFile" id="uploadFile"
									accept="image/*" onchange="uploadFileCheck()"> <small
									class="text-muted">(파일크기 : 10MB / 이미지 파일만 가능)</small> <small
									id="file" class="text-info"></small>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>메인 이미지 4</th>
					<td>
						<div class="form-group row">
							<label for="file" class="col-sm-2 col-form-label">파일첨부</label>
							<div class="col-sm-10">
								<input type="file" name="uploadFile" id="uploadFile"
									accept="image/*" onchange="uploadFileCheck()"> <small
									class="text-muted">(파일크기 : 10MB / 이미지 파일만 가능)</small> <small
									id="file" class="text-info"></small>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>메인 이미지 5</th>
					<td>
						<div class="form-group row">
							<label for="file" class="col-sm-2 col-form-label">파일첨부</label>
							<div class="col-sm-10">
								<input type="file" name="uploadFile" id="uploadFile"
									accept="image/*" onchange="uploadFileCheck()"> <small
									class="text-muted">(파일크기 : 10MB / 이미지 파일만 가능)</small> <small
									id="file" class="text-info"></small>
							</div>
						</div>
					</td>
				</tr>
				<br>
				<br>
				<tr>
					<th>상세 설명 이미지 1</th>
					<td>
						<div class="form-group row">
							<label for="file" class="col-sm-2 col-form-label">파일첨부</label>
							<div class="col-sm-10">
								<input type="file" name="uploadFile" id="uploadFile"
									accept="image/*" onchange="uploadFileCheck()"
									required="required"> <small class="text-muted">(파일크기
									: 10MB / 이미지 파일만 가능)</small> <small id="file" class="text-info"></small>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>상세 설명 이미지 2</th>
					<td>
						<div class="form-group row">
							<label for="file" class="col-sm-2 col-form-label">파일첨부</label>
							<div class="col-sm-10">
								<input type="file" name="uploadFile" id="uploadFile"
									accept="image/*" onchange="uploadFileCheck()"> <small
									class="text-muted">(파일크기 : 10MB / 이미지 파일만 가능)</small> <small
									id="file" class="text-info"></small>
							</div>
						</div>
					</td>
				</tr>
			</table>
			<div class="btn">
				<button type="submit" class="btn btn-success">상품 등록</button>
				&nbsp;
				<button type="reset" class="btn btn-secondary">다시 입력</button>
			</div>
		</form>
	</main>
</body>
<script type="text/javascript">


	$( document ).ready(function() {
	    console.log( "ready!" );
	    
	    subCateChange();
	});

	function subCateChange(){
		
		 console.log($("#mCate").val()); 
		
		var selected = $("#mCate").val();// 선택한 값
		
		var opt = $(".item"+selected);
		console.log("opt"+opt);
		
		var j;
		var html="";
		
		for(i of opt){
			j = $(i).html().split(":");
			console.log(j);
			
			html += '<option value="' +j[1]+ '">' +j[0]+ '</option>';
		}
		
		$("#sCate").html(html);
		
	}
</script>

</html>