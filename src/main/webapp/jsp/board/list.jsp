<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/keyboard-WEB/resources/css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* tr에 마우스를 올렸을 때 커서가 손가락 모양으로 표시되도록 설정 */
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
<script src="/keyboard-WEB/resources/js/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('#write').click(function() {
			location.href = '/keyboard-WEB/board/writeForm.do'
		})
	})
</script>
</head>
<body>
	<c:if test="${not empty sessionScope.insertSuccess}">
		<script>
			alert('게시글 등록 완료')
		</script>
		<c:remove var="insertSuccess" scope="session" />
	</c:if>
	<c:if test="${not empty sessionScope.insertError}">

		<script>
			alert('게시글 등록 안됨')
		</script>

		<c:remove var="insertError" scope="session" />
	</c:if>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section class="container">
		    <div class="page-header">
        <h1 class="mt-5">글 목록</h1>
        <hr>
    </div>
		<table class="table table-bordered table-hover align-middle">
			<tr>
				<th>카테고리</th>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
			<c:forEach items="${ boardList }" var="boardVO">
				<tr class="clickable-row" onclick="location.href='${pageContext.request.contextPath}/board/detail.do?no=${boardVO.no}'">
					<td><c:choose>
							<c:when test="${ boardVO.type eq 'N' }">공지</c:when>
							<c:when test="${ boardVO.type eq 'I' }">문의</c:when>
							<c:otherwise>뭐냐너는</c:otherwise>
						</c:choose></td>
					<td>${ boardVO.num }</td>
					<td><c:out value="${ boardVO.title }" /></td>
					<td>${ boardVO.writer }</td>
					<td>${ boardVO.regDate }</td>
				</tr>
			</c:forEach>
		</table>
		<button id="write">문의하기</button>
	</section>
	<footer class="py-5 bg-dark mt-5">
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>

</body>
</html>