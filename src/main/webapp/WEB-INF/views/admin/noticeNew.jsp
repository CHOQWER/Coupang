<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/notice.css">

<div id="add-notice">
    <h2>Add New Notice</h2>
    <form action="noticeNew" method="post">
        <label for="n_title">제목:</label>
        <input type="text" id="n_title" name="n_title" required><br>

        <label for="n_content">내용:</label>
        <textarea id="n_content" name="n_content" rows="4" required></textarea><br>

        <input type="submit" value="Add Notice">
    </form>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>