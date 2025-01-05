<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>관리자 페이지</title>
    <style>
        .admin-card {
            border: none;
            border-radius: 0.75rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
        .admin-card:hover {
            transform: scale(1.03);
            transition: transform 0.2s ease-in-out;
        }
        .card-body h5 {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>

    <!-- 관리자 메인 섹션 -->
    <section class="container py-5">
        <div class="text-center mb-4">
            <h1 class="fw-bold">관리자 페이지</h1>
            <p class="text-muted">사이트 관리 도구를 선택하세요</p>
        </div>
        <div class="row g-4">
            <!-- 게시글 관리 -->
            <div class="col-md-4">
                <div class="card admin-card h-100 text-center">
                    <div class="card-body">
                        <h5 class="card-title">게시글 관리</h5>
                        <p class="card-text">등록된 게시글을 관리하고 수정하세요.</p>
                        <a href="/keyboard-WEB/admin/manageBoard.do" class="btn btn-outline-dark">관리하기</a>
                    </div>
                </div>
            </div>
            <!-- 상품 관리 -->
            <div class="col-md-4">
                <div class="card admin-card h-100 text-center">
                    <div class="card-body">
                        <h5 class="card-title">상품 관리</h5>
                        <p class="card-text">등록된 상품을 관리하고 수정하세요.</p>
                        <a href="/keyboard-WEB/admin/manageItem.do" class="btn btn-outline-dark">관리하기</a>
                    </div>
                </div>
            </div>
            <!-- 사용자 관리 -->
            <div class="col-md-4">
                <div class="card admin-card h-100 text-center">
                    <div class="card-body">
                        <h5 class="card-title">사용자 관리</h5>
                        <p class="card-text">등록된 사용자 정보를 확인하고 관리하세요.</p>
                        <a href="/keyboard-WEB/admin/manageUser.do" class="btn btn-outline-dark">관리하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 푸터 -->
    <footer>
        <jsp:include page="/jsp/include/footer.jsp" />
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
