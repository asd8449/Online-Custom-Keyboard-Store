<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/keyboard-WEB/resources/css/styles.css">
</head>
<body>
	<header class="bg-dark py-4">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<a href="/keyboard-WEB/admin/memberManage.do">회원관리</a>
		<a href="/keyboard-WEB/admin/itemManage.do">상품관리</a>
	</section>
	<footer class="py-5 bg-dark mt-5">
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>