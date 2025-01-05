<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 등록/수정</title>
    <!-- 예시: Bootstrap, jQuery -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
    $(document).ready(function(){
        $('#listBtn').click(function(){
            location.href='list.do';
        });
    });

    function checkForm() {
        let form = document.inputForm;
        if(form.title.value.trim() === '') {
            alert('제목을 입력하세요');
            form.title.focus();
            return false;
        }
        if(form.writer.value.trim() === '') {
            alert('작성자를 입력하세요');
            form.writer.focus();
            return false;
        }
        if(form.content.value.trim() === '') {
            alert('내용을 입력하세요');
            form.content.focus();
            return false;
        }
        return true;
    }
    </script>
</head>
<body>
<header>
    <jsp:include page="/jsp/include/topMenu.jsp" />
</header>

<section class="container my-5">
    <c:choose>
        <c:when test="${not empty board.no}">
            <h1>게시글 수정</h1>
        </c:when>
        <c:otherwise>
            <h1>문의하기</h1>
        </c:otherwise>
    </c:choose>
    <hr class="mb-4">

    <!-- action은 동일: /board/write.do  => BoardWriteController -->
    <form name="inputForm" method="post" action="${pageContext.request.contextPath}/board/write.do" 
          enctype="multipart/form-data" onsubmit="return checkForm();">

        <!-- 수정 모드이면 hidden으로 no 값 전달 -->
        <c:if test="${not empty board.no}">
            <input type="hidden" name="no" value="${board.no}">
        </c:if>

        <!-- 작성자 ID hidden -->
        <input type="hidden" name="writer" value="${user.id}">

        <!-- 관리자가 아니면 type=I 로 강제 -->
        <c:if test="${user.type eq 'U'}">
            <input type="hidden" name="type" value="I">
        </c:if>

        <!-- 제목 -->
        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title"
                   value="<c:out value='${board.title}'/>" 
                   placeholder="제목을 입력하세요">
        </div>

        <!-- 작성자 표시 (읽기전용) -->
        <div class="mb-3">
            <label class="form-label">작성자</label>
            <input type="text" class="form-control" 
                   value="<c:out value='${user.name}'/>" 
                   readonly>
        </div>

        <!-- 타입 : 관리자(S)만 선택 가능 -->
        <c:if test="${user.type eq 'S'}">
            <div class="mb-3">
                <label class="form-label">타입</label>
                <div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" id="typeInquiry" value="I"
                            <c:if test="${board.type=='I'}">checked</c:if>>
                        <label class="form-check-label" for="typeInquiry">문의</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" id="typeNotice" value="N"
                            <c:if test="${board.type=='N'}">checked</c:if>>
                        <label class="form-check-label" for="typeNotice">공지</label>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- 내용 -->
        <div class="mb-3">
            <label for="content" class="form-label">내용</label>
            <textarea class="form-control" id="content" name="content" rows="7"
                      placeholder="내용을 입력하세요"><c:out value='${board.content}'/></textarea>
        </div>

        <!-- 파일첨부(2개) -->
        <div class="mb-3">
            <label class="form-label">파일 첨부</label>
            <input type="file" class="form-control mb-2" name="attachfile1">
            <input type="file" class="form-control" name="attachfile2">
        </div>

        <div class="d-flex justify-content-end">
            <!-- 등록/수정 버튼 구분 -->
            <c:choose>
                <c:when test="${not empty board.no}">
                    <button type="submit" class="btn btn-primary me-2">수정하기</button>
                </c:when>
                <c:otherwise>
                    <button type="submit" class="btn btn-primary me-2">문의등록</button>
                </c:otherwise>
            </c:choose>
            <button type="button" id="listBtn" class="btn btn-secondary">취소</button>
        </div>
    </form>
</section>

<footer>
    <jsp:include page="/jsp/include/footer.jsp"/>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
