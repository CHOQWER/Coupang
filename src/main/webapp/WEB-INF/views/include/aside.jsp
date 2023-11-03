<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">    
    <!-- Style -->
    <link rel="stylesheet" href="/resources/css/buystyle.css">
    <script src="/resources/js/jquery-3.6.3.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/main.js"></script>
  
    <!-- 사이드 메뉴 -->    
    <aside class="sidebar" style="z-index: 1;">
      <div class="toggle">
        <a href="#" class="burger js-menu-toggle" data-toggle="collapse" data-target="#main-navbar">
              <span></span>
            </a>
      </div>
      <div class="side-inner">
        <div class="profile">
          <img src="/resources/img/logo.png" alt="Image" class="img-fluid">
          <h3 class="name">${sessionScope.vo.u_name }님</h3>
          <c:if test="${sessionScope.vo.grade==1 }">
          <span class="country">판매자</span>
          </c:if>
        </div>

        
        <div class="nav-menu">
          <h3>판매자메뉴</h3>
          <ul>
            <li class="accordion">
              <a href="sellerSelectMineProduct" class="collapsible">
                등록상품내역
              </a>
            </li>
            <li class="accordion">
              <a href="sellerInsertProduct"  class="collapsible">
                새상품등록
              </a>
            </li>
             <li class="accordion">
              <a href="sellerBeforeDelivery" class="collapsible">
                주문승인
              </a>
            </li>
            <li class="accordion">
              <a href="sellerSelectBuyList" class="collapsible">
                판매내역
              </a>
            </li>
            <li class="accordion">
              <a href="adminSelectBuyList" class="collapsible">
                판매관리
              </a>
            </li>
            <li class="accordion">
              <a href="sellersales?u_id=${sessionScope.vo.u_id }" class="collapsible">
                매출관리
              </a>
            </li>            
          </ul>
        </div>
      </div>
      
    </aside>