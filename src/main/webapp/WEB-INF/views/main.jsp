<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/banner.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<%@ include file="/WEB-INF/views/include/header.jsp" %>


 <main class="main_section1">
      <div class="slide slide_wrap">
      <div class="slide_item item1"><img src="/resources/img/banner1.jpg"></div>
      <div class="slide_item item2"><img src="/resources/img/banner2.jpg"></div>
      <div class="slide_item item3"><img src="/resources/img/banner3.jpg"></div>
      <div class="slide_item item4"><img src="/resources/img/banner4.jpg"></div>
      <div class="slide_item item5"><img src="/resources/img/banner5.jpg"></div>
      <div class="slide_prev_button slide_button">◀</div>
      <div class="slide_next_button slide_button">▶</div>
      <ul class="slide_pagination"></ul>
    </div>
    
 </main>
<!-- </div> --> 
<script src="/resources/js/slide.js"></script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
