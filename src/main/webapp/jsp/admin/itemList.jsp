<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    tr.clickable-row {
        cursor: pointer;
    }
    .table thead th {
        background: #f8f9fa;
    }
    .page-header {
        margin-bottom: 30px;
    }
</style>
</head>
<body>
		<c:if test="${not empty sessionScope.deleteSuccess}">
		<script>
			alert('삭제 완료')
		</script>
		<c:remove var="deleteSuccess" scope="session" />
	</c:if>
	<c:if test="${not empty sessionScope.deleteError}">

		<script>
			alert('삭제 실패')
		</script>

		<c:remove var="deleteError" scope="session" />
	</c:if>
	<c:if test="${!empty updateSuccess or !empty insertSuccess}">
		<script>
			alert('등록 완료')
		</script>
		<c:remove var="updateSuccess" scope="session" />
		<c:remove var="insertSuccess" scope="session" />
	</c:if>
	<c:if test="${!empty updateError or !empty insertError}">

		<script>
			alert('등록 실패')
		</script>

		<c:remove var="updateError" scope="session" />
		<c:remove var="insertError" scope="session" />
	</c:if>

	<header class="bg-dark py-4">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
<div class="container">
    <div class="page-header">
        <h1 class="mt-5">상품 목록</h1>
        <hr>
    </div>
    
    <!-- 상품 목록 테이블 -->
    <table class="table table-bordered table-hover align-middle">
        <thead>
            <tr>
                <th>상품코드</th>
                <th>상품명</th>
                <th>카테고리</th>
                <th>재고</th>
                <th>등록일</th>
                <th>제조사</th>
                <th>가격</th>
                <th>상품설명</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${itemList}" var="item">
                <tr onclick="location.href='${pageContext.request.contextPath}/admin/itemModify.do?no=${item.no}'">
                    <td>${item.no}</td>
                    <td>${item.name}</td>
                    <td>${item.category}</td>
                    <td>${item.stock}</td>
                    <td>${item.regDate}</td>
                    <td>${item.manufacturer}</td>
                    <td>${item.price}원</td>
                    <td>${item.description}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button onclick="location.href='${pageContext.request.contextPath}/admin/itemModify.do'">상품등록</button>
</div>
<footer class="py-5 bg-dark mt-5">
	<jsp:include page="/jsp/include/footer.jsp" />
</footer>
</body>
</html>