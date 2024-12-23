<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
MemberVO member = new MemberVO("admin", "admin", "S");
//	session.setAttribute("user", member);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="/keyboard-WEB/resources/css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<style>
    /* 카테고리 버튼 스타일 */
    .category-filter {
        text-align: center;
        margin: 30px 0;
    }
    .category-btn {
        display: inline-block;
        margin: 0 10px;
        padding: 8px 16px;
        border: 1px solid #ccc;
        background: #fff;
        color: #333;
        cursor: pointer;
        transition: background 0.3s;
        text-transform: capitalize;
    }
    .category-btn:hover {
        background: #eee;
    }
</style>
</head>
<body>
	<c:if test="${not empty sessionScope.adminError}">

		<script>
			alert('권한이 없습니다. 로그인 후 관리자 권한을 갖춘 계정으로 접근해주세요.')
		</script>

		<c:remove var="adminError" scope="session" />
	</c:if>
		<c:if test="${not empty sessionScope.loginError}">

		<script>
			alert('권한이 없습니다. 로그인 후 이용해주세요.')
		</script>

		<c:remove var="loginError" scope="session" />
	</c:if>
	<header class="bg-dark py-4">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
		<jsp:include page="/jsp/include/category.jsp" />
	<section>
		메인페이지입니다. <br>이벤트 알림, 인기 상품 등을 보여줄 예정입니다.
	</section>
	<footer class="py-5 bg-dark mt-5">
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>