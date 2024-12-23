<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${category}</title>
<link rel="stylesheet" href="/keyboard-WEB/resources/css/styles.css">
<script src="keyboard-WEB/resources/js/scripts.js"></script>
</head>
<body>

	<header class="bg-dark py-4">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
		<jsp:include page="/jsp/include/category.jsp" />
	<section class="container">
    <h2 class="text-primary">${category}</h2>
    <div class="row">
        <c:forEach items="${ itemList }" var="itemVO">
            <!-- 카드 형태로 상품 표시 -->
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">${ itemVO.name }</h5>
                        <p class="card-text">${ itemVO.price }원</p>
                        <a href="/keyboard-WEB/item/detail.do?no=${ itemVO.no }" class="btn btn-primary">자세히 보기</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
	<footer class="py-5 bg-dark mt-5">
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
	
</body>
</html>