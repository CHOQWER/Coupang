<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제품 상세 폐이지</title>
    
</head>
<style>
  
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}


.content {
    max-width: 1200px;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.cate {
    font-size: 14px;
    color: #888;
}

/* 좌측 메인/서브 이미지 스타일링 */
.content-main {
    display: flex;
    margin-top: 50px;
    
}

.main-img {
    padding: 10px;
}

.main-img img {
    width: 410px;
    height: auto;
}

.sub-img {
    
    display: flex;
    height: 100px;
    justify-content: space-around;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 50px;
}

.sub-img img {
    width: 90PX;
    height: 90PX;
}

/* 우측 구매 */
.prod-buy {
    border: 1px solid black;
    padding: 10px;
    background-color: #fff;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    
}


.prod-header {
    margin-bottom: 10px;
}

.prod-company {
    font-size: 14px;
    font-weight: bold;
    color: #888;
}

.prod-name {
    font-size: 20px;
    font-weight: bold;
    color: #333;
    margin-top: 5px;
}

.prod-review {
    font-size: 14px;
    color: blue
}

/* 가격 스타일링 */
.prod-price {
    margin-bottom: 10px;
}

.origin-price {
    font-size: 18px;
    color: #888;
    text-decoration: line-through;
}

.sale-price {
    font-size: 24px;
    font-weight: bold;
    color: red;
}


.prod-color {
    margin-bottom: 10px;
}

.color-select a {
    display: inline-block;
    padding: 5px 10px;
    margin-right: 10px;
    border: 1px solid ;
    color: black;
    text-decoration: none;
}


.prod-delivery {
    font-size: 14px;
    color: #888;
    margin: 50px;
}

.prod-buy-footer {
    display: flex;
    align-items: center;
}

select {
    width: 100px;
    padding: 5px;
    margin-right: 10px;
}

button {
    background-color: #4285f4;
    font-size: 1.1em;
    color: #fff;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    width: 150px;
    height: 70px;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #4285f4;
}


.tab-title {
    list-style: none;
    display: flex;
    justify-content: space-around;
    background-color: #eee;
    padding: 10px 0;
}

.tab-title li {
    cursor: pointer;
    padding: 10px 20px;
    background-color: #ccc;
    text-align: center;
    border-radius: 5px;
    user-select: none;
}

.tab-title li:hover {
    background-color: #ddd;
}


.content {
    background-color: #fff;
    padding: 20px;
    margin-top: 20px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.content-info {
    font-size: 16px;
    color: #333;
}

.detail-img {
    display: flex;
    justify-content: space-between;
    margin: 20px 0;
}

.detail-img img {
    max-width: 48%;
    height: auto;
}

.review {
    background-color: #f0f0f0;
    padding: 10px;
    margin-top: 20px;
}

.review-userinfo {
    font-weight: bold;
    margin-top: 10px;
}

.review-content {
    margin-top: 10px;
}

.prod-qa {
    margin-top: 20px;
}

.prod-qa h2 {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
}

.prod-qa ul {
    list-style-type: disc;
    padding-left: 20px;
}

.prod-answer {
    font-weight: bold;
    margin-top: 10px;
}

.prod-userqa {
    font-weight: bold;
    margin-top: 20px;
}

.prod-qa a {
    
    text-decoration: none;
    font-weight: bold;
}
</style>
<body>
    <section class="content">
        <div class="cate"> 쿠팡홈 > 태블릿PC > 태블릿PC</div>
        <!--좌측 메인/서브 이미지-->
        <div class="content-main">
            <div class="main-img">
                <img src="img/17refrigerator1.jpg" alt="">
            <div class="sub-img">
                <a href=""><img src="img/17refrigerator2.png" alt=""></a>
                <img src="img/17refrigerator3.png" alt="">
                <img src="img/17refrigerator4.png" alt="">
                <img src="img/17refrigerator5.png" alt="">
            </div>
            </div>

        <!--우측 구매하는 부분-->
        <div class="prod-buy">
            <div class="prod-header">
                <div class="prod-company">캐리어</div>
                <div class="prod-name">캐리어 모드비 피트인 4도어 냉장고 618L 실버 글라스 방문설치 </div>
                <div class="prod-review">상품리뷰</div>
            </div>

            <div class="prod-price">
                <div class="origin-price">1490000</div>
                <div class="sale-price">1341000</div>
            </div>

            <div class="prod-color">
                <div class="color-option">
                    <div class="color-select">
                        <a href="">그레이</a>
                        <a href="">블랙</a>
                    </div>
                </div>

            </div>

            <div class="prod-delivery">
                <p>무료배송</p>
                <p>모래(토) 10/21 도착 예정</p>
            </div>
            
            <div class="prod-buy-footer">
                <select name="" id=""></select>
                <button>장바구니</button>
                <button>구매하기</button>
            </div>

        </div>    
        </div>




        <div class="content-section"></div>
            <div class="tab-title">
                <ul>
                <li>상품 상세</li>
                <li>상품평</li>
                <li>상품 문의</li>
                <li>배송/교환/반품 안내</li>
                </ul>
            </div>

            <div class="content">
                <p>필수 표기 정보</p>
                <div class="content-info">
                    도어 수: 4도어 
                    사이즈: 912 x 1825 x 922 mm
                    냉장/냉동 타입: 냉장+냉동
                    설치지원방식: 방문설치
                    도어 개수: 4   
                </div>

                <div class="detail-img">
                    <img src="img/17refrigerator-1.jpg" alt="">
                    <img src="img/17refrigerator-2.jpg" alt="">
                </div>

                <div class="review">상품평
                    <div class="review-userinfo">
                        이** 
                        판매자
                    </div>
                    <div class="review-content">좋아요</div>
                </div>

                <div class="prod-qa">
                    <h2>상품문의</h2>
                    <ul>
                        <li>구매한 상품의 취소/반품은 마이쿠팡 구매내역에서 신청 가능합니다</li>
                        <li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
                        <li>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1 문의하기를 이용해주세요.</li>
                        <li>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</li>
                        <li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
                    </ul>
                    <hr>
                    <div class="prod-userqa">
                        질문

                    </div>
                    <div class="prod-answer">
                        답변
                    </div>
                    <a href="">더보기</a>
                </div>
		</div>
    </section>

    
</body>
</html>
