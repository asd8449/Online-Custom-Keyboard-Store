<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .table thead th {
        background: #f8f9fa;
    }
    .page-header {
        margin-bottom: 30px;
    }
</style>
</head>
<body>
<header class="bg-dark py-4">
  <%@ include file="/jsp/include/topMenu.jsp"%>
</header>
<div class="container form-section">
    <div class="page-header">
        <h1>상품 수정</h1>
        <hr>
    </div>
    
    <!-- 상품 수정 폼 -->
    <!-- 기존 상품 정보를 EL로 받아와서 수정 가능하도록 -->
    <form action="/keyboard-WEB/admin/${ empty item ? 'itemInsert':'itemUpdate' }.do" method="post">
        <!-- 상품코드 (수정 불가능한 경우 readonly 처리) -->
        <div class="mb-3">
            <label for="itemNo" class="form-label">상품코드</label>
            <input type="hi" class="form-control" id="itemNo" name="no" value="${item.no}" readonly>
        </div>
        
        <div class="mb-3">
            <label for="itemName" class="form-label">상품명</label>
            <input type="text" class="form-control" id="itemName" name="name" value="${item.name}" required>
        </div>
        
        <div class="mb-3">
            <label for="itemCategory" class="form-label">카테고리</label>
            <input type="text" class="form-control" id="itemCategory" name="category" value="${item.category}">
        </div>

        <div class="mb-3">
            <label for="itemStock" class="form-label">재고</label>
            <input type="number" class="form-control" id="itemStock" name="stock" value="${item.stock}" required>
        </div>

        <div class="mb-3">
            <label for="itemManufacturer" class="form-label">제조사</label>
            <input type="text" class="form-control" id="itemManufacturer" name="manufacturer" value="${item.manufacturer}">
        </div>

        <div class="mb-3">
            <label for="itemPrice" class="form-label">가격</label>
            <input type="number" class="form-control" id="itemPrice" name="price" value="${item.price}" required>
        </div>

        <div class="mb-3">
            <label for="itemRegDate" class="form-label">등록일</label>
            <input type="text" class="form-control" id="itemRegDate" name="regDate" value="${item.regDate}" readonly>
        </div>

        <div class="mb-3">
            <label for="itemDescription" class="form-label">상품설명</label>
            <textarea class="form-control" id="itemDescription" name="description" rows="4">${item.description}</textarea>
        </div>

        <div class="mt-4">
            <button type="submit" class="btn btn-primary">${ empty item ? '등록하기':'수정하기' }</button>
            <button class="btn btn-danger" onclick="location.href='/keyboard-WEB/admin/itemDelete.do?no=${item.no}'">삭제</button>
            <a href="${pageContext.request.contextPath}/admin/itemManage.do" class="btn btn-secondary">취소</a>
        </div>
    </form>
</div>
<footer class="py-5 bg-dark mt-5">
  <%@ include file="/jsp/include/footer.jsp"%>
</footer>
</body>
</html>