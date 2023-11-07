<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- <link rel="stylesheet" href="/resources/css/signup.css"> -->
<link rel="stylesheet" href="/resources/css/register2.css">
<script type="text/javascript" src="/resources/js/signup.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>



<form action="updateUser" method="post">
    <div class="div-update-main">
        <section class="sec-update-main">
            <h1>회원정보수정</h1>
            <div class="div-table">
                <table class="memberupdate-table" border="1">
                    <colgroup>
                        <col class="left-col" width="150px;">
                        <col class="right-col" width="650px;">
                    </colgroup>
                    <tr>
                        <th scope="row" class="row1">아이디</th>                        
                        <td><input type="text" size="30" name="u_id" value="${vo.u_id}" readonly="readonly"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="row2">이름</th>
                        <td><input type="text" name="u_name" size="30" value="${vo.u_name}"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="row3">전화번호</th>
                        <td><input type="tel" name="u_mobile" size="30" value="${vo.u_mobile}"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="row4">이메일</th>
                        <td><input type="email" size="30" name="u_email" value="${vo.u_email}"></td>
                    </tr>
                    <input type="hidden" name="u_post_no" id="postno" placeholder="우편번호" required />
                    <tr>
                        <th scope="row" class="row5">주소</th>
                        <td><input id="addr1" name="u_addr1" type="text" onclick="jusoPopup()" size="30"
                            value="${vo.u_addr1}" required></td>
                    </tr>
                    <tr>
                        <th scope="row" class="row6">상세주소</th>
                        <td><input id="addr2" name="u_addr2" type="text" size="30" placeholder="상세주소" value="${vo.u_addr2}"></td>
                    </tr>
                </table>
            </div>
            <div class="update-button">
                <input type="submit" id="submit-btn" value="수 정">
            </div>
        </section>
    </div>
</form>



