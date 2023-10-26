<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/notice.css">

<div class="section section-properties" >
	  <div class="container">
	   	<div class="two_third first" style="height:auto">
     <div class="col-lg-12">
		   <h2 class="font-weight-bold text-primary heading">글쓰기</h2>
		     <hr/><br><br>
       	<div class="two_third first">
       	<form method=post action="insertNotice" id="frm">
       		<table class="table">
       			<tr>
       			<th width=20% class="text-right">제목</th>
	       			<td width=80%>
	       				<input type=text name=subject size=50 class="n_title" id="n_title" >
	       			</td>
       			</tr>
       			<tr>
       			<th width=20% class="text-right">내용</th>
					<td width=80%>
	       				<textarea rows="10" cols="50" name=n_content id="n_content"></textarea>
					</td>
       			</tr>
			  <select id="list" >
			    <option value="none">=== 선택 ===</option>
			    <option value="notice" selected>공지사항</option>
			    <option value="que">자주 묻는 질문</option>
			  </select>
       			<tr>
	       			<td colspan="2" class="text-center">
	       				<div class="wrap">
	       					<input type="button" value="글쓰기" class="button" id="writeBtn">
	       					<input type=button value="취소" class="button" onclick="javascipt:history.back()">
						</div>
	       				
	       			</td>
       			</tr>
       		</table>
       		</form>
       	</div>
       	</div>
       	</div>
       	</div>


</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>