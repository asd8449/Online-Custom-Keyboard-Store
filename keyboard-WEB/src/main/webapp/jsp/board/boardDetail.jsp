<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>게시글 상세보기</title>
</head>
<body>
	<!-- 헤더 -->
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>

	<!-- 게시글 상세보기 섹션 -->
	<section class="container my-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card shadow-sm">
					<div class="card-body">
						<!-- 제목 -->
						<h2 class="card-title mb-4">${board.title}</h2>
						<!-- 작성자, 등록일 -->
						<p class="text-muted">
							작성자: <strong>${board.writer}</strong> &nbsp;&nbsp;|&nbsp;&nbsp;
							등록일: <strong>${board.regDate}</strong>
						</p>
						<hr>
						<!-- 내용 -->
						<div class="mb-4">
							<p>${board.content}</p>
						</div>
						<!-- 파일 -->
						<c:if test="${board.hasFile == 'Y'}">
						    <h5>첨부파일:</h5>
						    <c:forEach var="file" items="${board.files}">
						        <c:choose>
						            <c:when test="${file.filePath.endsWith('.jpg') 
						                         or file.filePath.endsWith('.jpeg') 
						                         or file.filePath.endsWith('.png') 
						                         or file.filePath.endsWith('.gif')}">
						                <img src="${pageContext.request.contextPath}${file.filePath}" 
						                     alt="${file.fileOriName}" 
						                     class="img-fluid rounded mb-2">
						            </c:when>
						            <c:otherwise>
						                <p>
						                   <a href="${pageContext.request.contextPath}${file.filePath}" download>
						                       ${file.fileOriName}
						                   </a>
						                </p>
						            </c:otherwise>
						        </c:choose>
						    </c:forEach>
						</c:if>
						<!-- 하단 버튼 -->
						<div class="d-flex justify-content-between mt-4">
							<a href="${pageContext.request.contextPath}/board/list.do" 
							   class="btn btn-secondary">목록으로</a>
							<!-- 작성자와 로그인 유저가 같을 때 수정/삭제 표시 (예시) -->
							<c:if test="${user != null and board.writer == user.id}">
								<div>
									<a href="${pageContext.request.contextPath}/board/writeForm.do?no=${board.no}"
										class="btn btn-warning me-2">수정</a> 
									<a href="${pageContext.request.contextPath}/board/delete.do?no=${board.no}"
										class="btn btn-danger">삭제</a>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 푸터 -->
	<footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
