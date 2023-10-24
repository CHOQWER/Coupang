<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"  %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/cart.css">
<body>
    
    <div class="card">
        <div class="col">${sessionScope.vo.u_id}</div>
        <div class="row">
            <div class="col-md-8 cart">
                <div class="title">
                    <div class="row">
                        <div class="col"><h4><b>장바구니</b></h4></div>
                    </div>
                </div>    
                <div class="row border-top border-bottom">
                        <div class="col-2">
                        <c:forEach items="${list}" var="vo">
                        <img src="/resources/img/cart.png">
                        <ul>
                        <%-- <li class="col">${sessionScope.vo.cate}</li> --%>
                        <li class="col">${vo.pname}</li>
                        <li class="col">${vo.c_cnt}</li>
                        <li class="col">${vo.price}</li>
                        <li class="col">${vo.dis_price}</li>
                        
                        </ul>
                        </c:forEach>  
                        </div>
                </div>
                <div class="back-to-shop"><a href="mypage">&leftarrow;&nbsp;&nbsp;뒤로가기</a><span class="text-muted"></span></div>
            </div>
            <div class="col-md-4 summary">
                <div><h5><b>Summary</b></h5></div>
                <hr>
                <div class="row">
                    <div class="col">회원 등급</div>
                    <div class="col text-right">${sessionScope.vo.grade}</div>
                </div>
                <hr>
                <!-- <form>
                    <p>와우회원확인</p>
                    <select>
                        <option class="text-muted">일반회원</option>
                        <option class="text-muted">와우회원</option>
                    </select>
                    
                    <p>배송지</p>
                    <input id="code" placeholder="배송지를 입력해주세요">
                </form> -->
                <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                    <div class="col">총구매금액</div>
                    <div class="col">100,000원</div>
                </div>
                <button class="btn">구매하기</button>
            </div>
        </div>
        
    </div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>