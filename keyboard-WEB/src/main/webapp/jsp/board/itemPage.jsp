<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>${category}</title>
</head>
<body>
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
        <jsp:include page="/jsp/include/category.jsp" />
    </header>

    <!-- 상단 카테고리 제목 -->
    <section class="bg-dark text-white py-5">
        <div class="container text-center">
            <h1 class="display-4">${category}</h1>
            <p class="lead">해당 카테고리에 있는 상품을 확인하세요.</p>
        </div>
    </section>

    <!-- 상품 목록 -->
    <section class="container py-5">
        <div class="row g-4">
            <c:forEach items="${itemList}" var="itemVO">
                <div class="col-md-3">
                    <div class="card h-100 shadow-sm">
                        <!-- 상품 이미지 -->
                        <img src="/keyboard-WEB/resources/images/item_placeholder.png" class="card-img-top" alt="${itemVO.name}">
                        <div class="card-body text-center">
                            <!-- 상품 이름 -->
                            <h5 class="card-title">${itemVO.name}</h5>
                            <!-- 상품 가격 -->
                            <p class="card-text">
                                <c:if test="${itemVO.sale}">
                                    <span class="text-muted text-decoration-line-through">₩${itemVO.originalPrice}</span>
                                    <span class="text-danger">₩${itemVO.salePrice}</span>
                                </c:if>
                                <c:if test="${not itemVO.sale}">
                                    ₩${itemVO.price}
                                </c:if>
                            </p>
                            <!-- 상품 상세 링크 -->
                            <a href="/keyboard-WEB/item/detail.do?no=${itemVO.no}" class="btn btn-outline-dark">Add to cart</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- 푸터 -->
    <footer>
        <jsp:include page="/jsp/include/footer.jsp" />
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
