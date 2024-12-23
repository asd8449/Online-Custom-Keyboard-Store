<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/keyboard-WEB/resources/css/styles.css">
<style>
    .product-detail {
        margin-top: 40px;
    }
    .product-title {
        font-size: 2rem;
        font-weight: bold;
    }
    .product-info-table th {
        width: 150px;
        background-color: #f8f9fa;
    }
    .product-description {
        margin-top: 20px;
    }
    .product-description h5 {
        margin-bottom: 15px;
    }
    .product-image {
        max-width: 100%;
        height: auto;
        border: 1px solid #eaeaea;
        padding: 5px;
        background: #fff;
    }
</style>
<script>
	$(document).ready(function(){

	})
</script>
</head>
<body>
<c:if test="${not empty sessionScope.success}">
		<script>
			alert('장바구니에 상품이 추가되었습니다.')
		</script>
		<c:remove var="success" scope="session" />
	</c:if>
<jsp:include page="/jsp/include/topMenu.jsp" />
<header class="bg-dark py-4">
  <div class="container px-4 px-lg-5 my-4">
    <div class="text-center text-white">
      <h1 class="display-5 fw-bolder">상품 상세정보</h1>
    </div>
  </div>
</header>
	<section>
<div class="container product-detail">
    <div class="row">
        <div class="col-md-5 text-center">
            <!-- 상품 이미지 -->
            
            <img src="https://via.placeholder.com/400x400" alt="상품이미지" class="product-image">
        </div>
        <div class="col-md-7">
            <!-- 상품명 -->
            <div class="product-title mb-3">
                ${item.name}
            </div>
            <!-- 상품 정보 테이블 -->
            <table class="table table-borderless product-info-table">
                <tbody>
                    <tr>
                        <th>가격</th>
                        <td>${item.price}원</td>
                    </tr>
                    <tr>
                        <th>재고</th>
                        <td>${item.stock}개</td>
                    </tr>
                    <tr>
                        <th>제조사</th>
                        <td>${item.manufacturer}</td>
                    </tr>
                    <tr>
                        <th>등록일</th>
                        <td> ${item.regDate}</td>
                    </tr>
                </tbody>
            </table>

            <!-- 상품 설명 -->
            <div class="product-description">
                <h5>상품 설명</h5>
                ${item.description}
            </div>
            
            <!-- 액션 버튼 영역 -->
            <div class="mt-4">
                <a href="/item/list.do" class="btn btn-secondary">목록</a>
                <button class="btn btn-primary" onclick="location.href='/keyboard-WEB/cart/insert.do?no=${ item.no }'">장바구니 담기</button>
                <button class="btn btn-success" onclick="location.href='/keyboard-WEB/cart/cart.do'">구매하기</button>
            </div>
        </div>
    </div>
</div>
	</section>
	<footer class="py-5 bg-dark mt-5">
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>