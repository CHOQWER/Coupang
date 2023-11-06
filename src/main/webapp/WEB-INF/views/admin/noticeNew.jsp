<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/noticeinsert.css">
<body>
<div id="main">
<div id="first">
<form action="noticeNew" method="post">
<h1>공지등록</h1>
<h4>Please fill all entries.</h4>
<label>제목 </label>
<input name="n_title" placeholder="제목 :" type="text">
<label>내용 </label>
<textarea name="n_content" placeholder="내용 :"  size="80">
</textarea>
<input name="dsubmit" type="submit" value="등록" size="20px">
<input name="dsubmit" type="reset" value="다시입력" size="20px">
<input name="dsubmit" type="submit" value="뒤로가기" size="20px">
</form>
</div>
</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>