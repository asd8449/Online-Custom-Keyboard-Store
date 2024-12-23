<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    .cart-table th {
        background: #f8f9fa;
    }
    .quantity-controls {
        display: inline-flex;
        align-items: center;
    }
    .quantity-controls input {
        width: 60px;
        text-align: center;
    }
    .quantity-controls button {
        margin: 0 5px;
    }
    .summary {
        margin-top: 30px;
        text-align: right;
    }
    .summary .total-text {
        font-weight: bold;
        font-size: 1.2rem;
    }
</style>
</head>
<body>
<header class="bg-dark py-4">
  <%@ include file="/jsp/include/topMenu.jsp"%>
</header>
<div class="container">
    <h1 class="mt-5 mb-4">장바구니</h1>
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle cart-table">
            <thead>
                <tr>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>합계</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <!-- 예시 상품 1 -->
                <c:forEach items="${ cartList }" var="cartVO">
                <tr>
                    <td>${cartVO.itemNm }</td>
                    <td>${ cartVO.price }원</td>
                    <td>
                        <div class="quantity-controls">
                            <button class="btn btn-outline-secondary btn-sm">-</button>
                            ${ cartVO.quantity }
                            <button class="btn btn-outline-secondary btn-sm">+</button>
                        </div>
                    </td>
                    <td>${ cartVO.price * cartVO.quantity }원</td>
                    <td><button class="btn btn-danger btn-sm" onclick="location.href='/keyboard-WEB/cart/delete.do?no=${cartVO.cartId}'">삭제</button></td>
                </tr>
                </c:forEach>
        </table>
    </div>

    <!-- 요약 섹션 -->
    <div class="summary">
        <!-- 총 수량, 총액 예시
        <p>총 수량: <span id="totalQuantity">3</span>개</p>
        <p class="total-text">총액: <span id="totalPrice">25,000</span>원</p> -->
        <button class="btn btn-primary btn-lg mt-3">주문하기</button>
    </div>
</div>
<footer class="py-5 bg-dark mt-5">
	<%@ include file="/jsp/include/footer.jsp"%>
</footer>
</body>
</html>