<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .content-section {
        margin-top: 30px;
    }
    .answer-section {
        margin-top: 50px;
    }
    .post-info th {
        width: 100px;
        background: #f9f9f9;
        border-bottom: 1px solid #eaeaea;
    }
    .post-info td {
        border-bottom: 1px solid #eaeaea;
    }
    .post-title {
        font-size: 1.8rem;
        font-weight: bold;
        margin-bottom: 15px;
    }
</style>
<script src="/keyboard-WEB/resources/js/jquery-3.7.1.min.js"></script>
<script>

</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container px-4 px-lg-5">
    <a class="navbar-brand" href="#">My Board</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
      aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 ms-lg-4">
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">홈</a></li>
        <li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
        <li class="nav-item"><a class="nav-link" href="#">문의</a></li>
      </ul>
    </div>
  </div>
</nav>

<header class="bg-dark py-4">
  <%@ include file="/jsp/include/topMenu.jsp"%>
</header>

<div class="container content-section">
    <!-- 게시글 정보 영역 -->
    <div class="post-detail mb-4">
        <div class="post-title">
            ${board.title}
        </div>
        <table class="table table-borderless post-info">
            <tbody>
                <tr>
                    <th>작성자</th>
                    <td>${board.writer}</td>
                    <th>조회수</th>
                    <td>${ board.viewCnt }</td>
                </tr>
                <tr>
                    <th>게시일자</th>
                    <td colspan="3">${board.regDate}</td>
                </tr>
            </tbody>
        </table>
    </div>
    
    <!-- 게시글 내용 영역 -->
    <div class="post-content mb-5">
        ${board.content}

    </div>
    
    <!-- 답글 영역 -->
    <div class="answer-section">
        <h5>답글</h5>
        <hr>
        <!-- 답글 리스트 -->
        <div class="mb-4">
            <!-- 예: ${answerList} 반복 -->
            <div class="mb-3 p-3 border rounded">
                <strong>답글 작성자:</strong> 답글러1<br>
                <strong>작성일:</strong> 2024-12-16 10:00:00<br>
                <p>이것은 예시 답글 내용입니다.</p>
            </div>
            <div class="mb-3 p-3 border rounded">
                <strong>답글 작성자:</strong> 답글러2<br>
                <strong>작성일:</strong> 2024-12-16 10:30:00<br>
                <p>두 번째 답글 내용입니다.</p>
            </div>
        </div>
        
        <!-- 답글 작성 폼 -->
        <div class="answer-form mt-4">
            <h6>답글 달기</h6>
            <form action="/board/reply.do" method="post">
                <!-- 게시글 번호 hidden 예: <input type="hidden" name="boardNo" value="${board.no}"> -->
                <div class="mb-3">
                    <label for="replyWriter" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="replyWriter" name="replyWriter" required>
                </div>
                <div class="mb-3">
                    <label for="replyContent" class="form-label">내용</label>
                    <textarea class="form-control" id="replyContent" name="replyContent" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">등록</button>
            </form>
        </div>
    </div>
    
    <!-- 하단 버튼 영역 -->
    <div class="mt-4">
        <a href="/board/list.do" class="btn btn-secondary">목록</a>
        <c:if test="${ user.id eq board.writer }">
        	<a href="/board/editForm.do?no=" class="btn btn-warning">수정</a>
        </c:if>
		<c:if test="${ user.id eq board.writer or user.type eq 'S'}">
	        <a href="/board/delete.do?no=" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?')">삭제</a>			
    	</c:if>
    </div>
</div>

<footer class="py-5 bg-dark mt-5">
  <%@ include file="/jsp/include/footer.jsp"%>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>