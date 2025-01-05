<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>메인페이지</title>
</head>
<body>
    <c:if test="${not empty alertMsg}">
        <script>
            alert("${alertMsg}");
        </script>
        <c:remove var="alertMsg"/>
    </c:if>
    <!-- 헤더 -->
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
        <jsp:include page="/jsp/include/category.jsp" />
    </header>

    <!-- Hero Section -->
    <section class="bg-dark text-white py-5">
        <div class="container text-center">
            <h1 class="display-4">Shop in Style</h1>
            <p class="lead">Welcome to our store! Explore the latest products and exciting deals.</p>
        </div>
    </section>

    <!-- 이벤트 알림 섹션 -->
    <section class="container py-5">
        <div class="text-center mb-5">
            <h2 class="fw-bold">이벤트 알림</h2>
            <p class="text-muted">현재 진행 중인 이벤트를 확인하세요.</p>
        </div>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Event 1">
                    <div class="card-body">
                        <h5 class="card-title">이벤트 제목 1</h5>
                        <p class="card-text">이벤트 내용 요약입니다. 자세한 내용을 확인하세요.</p>
                        <a href="#" class="btn btn-primary">자세히 보기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Event 2">
                    <div class="card-body">
                        <h5 class="card-title">이벤트 제목 2</h5>
                        <p class="card-text">이벤트 내용 요약입니다. 자세한 내용을 확인하세요.</p>
                        <a href="#" class="btn btn-primary">자세히 보기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Event 3">
                    <div class="card-body">
                        <h5 class="card-title">이벤트 제목 3</h5>
                        <p class="card-text">이벤트 내용 요약입니다. 자세한 내용을 확인하세요.</p>
                        <a href="#" class="btn btn-primary">자세히 보기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 인기 상품 섹션 -->
    <section class="container py-5">
        <div class="text-center mb-5">
            <h2 class="fw-bold">인기 상품</h2>
            <p class="text-muted">고객들이 가장 선호하는 상품들을 확인하세요.</p>
        </div>
        <div class="row g-4">
            <c:forEach items="${itemList}" var="itemVO">
                <div class="col-md-3">
                    <div class="card h-100 shadow-sm">
                        <img src="/keyboard-WEB/resources/images/item_placeholder.png" class="card-img-top" alt="${itemVO.name}">
                        <div class="card-body text-center">
                            <h5 class="card-title">${itemVO.name}</h5>
                            <p class="card-text">
                                <c:if test="${itemVO.sale}">
                                    <span class="text-muted text-decoration-line-through">₩${itemVO.originalPrice}</span>
                                    <span class="text-danger">₩${itemVO.salePrice}</span>
                                </c:if>
                                <c:if test="${not itemVO.sale}">
                                    ₩${itemVO.price}
                                </c:if>
                            </p>
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
