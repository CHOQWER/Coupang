<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/notice.css">
<style>
	.btn{
		display:flex;
		justify-content: center;
	}
</style>
<div class="section section-properties">
    <div class="container">
        <div class="two_third first" style="height:auto">
            <div class="col-lg-12">
                <h2 class="font-weight-bold text-primary heading">공지사항 수정</h2>
                <hr/><br><br>
                <div class="two_third first">
                    <form action="noticeUpdate?nno=${nno}" id="noticeForm" method="post">
                        <table class="table">    
                            <tr>
                                <th width=20% class="text-right">제목</th>
                                <td width=80%>
                                    <input type="text" name="n_title" size="50" class="input-sm" id="n_title" value="${item.n_title}" >
                                </td>
                            </tr>
                            <tr>
                                <th width=20% class="text-right">내용</th>
                                <td width=80%>
                                    <textarea rows="10" cols="50" name="n_content" id="n_content">${item.n_content}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <div class="wrap">
                                        <button type="submit" class="btn btn-success">수정하기</button>
                                        <button type="reset" class="btn btn-secondary">다시입력</button>
                                        <input type="button" value="취소" class="button" onclick="javascript:history.back()">
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