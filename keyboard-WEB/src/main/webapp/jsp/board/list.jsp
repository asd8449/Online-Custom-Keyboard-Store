<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>게시판 목록</title>
    <script src="/keyboard-WEB/resources/js/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function(){
            $('#write').click(function(){
                location.href='/keyboard-WEB/board/writeForm.do';
            });
            $('table tbody').on('click', 'tr', function() {
                const no = $(this).data('no'); // 게시글 번호 가져오기
                if (no) {
                    location.href = '/keyboard-WEB/board/detail.do?no=' + no;
                }
            });
        });
    </script>
    <style>
            /* tr에 커서 모양 변경 */
        table tbody tr {
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        /* tr hover 효과 */
        table tbody tr:hover {
            background-color: #f1f3f5; /* 연한 회색 배경 */
        }
    </style>
</head>
<body>
    <c:if test="${not empty alertMsg}">
        <script>
            alert("${alertMsg}");
        </script>
        <c:remove var="alertMsg" />
    </c:if>
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>

    <section class="container my-5">
        <h2 class="mb-4">공지 및 문의 게시판</h2>
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th scope="col">카테고리</th>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">등록일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${boardList}" var="boardVO">
                    <tr data-no="${boardVO.oriNo}">
                        <td>
                            <c:choose>
                                <c:when test="${boardVO.type eq 'N'}">공지</c:when>
                                <c:when test="${boardVO.type eq 'I'}">문의</c:when>
                                <c:otherwise>기타</c:otherwise>
                            </c:choose>
                        </td>
                        <td>${boardVO.no}</td>
                        <td><c:out value="${boardVO.title}"/></td>
                        <td>${boardVO.writer}</td>
                        <td>${boardVO.regDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-end">
            <button id="write" class="btn btn-primary">문의하기</button>
        </div>
    </section>

    <footer>
        <%@ include file="/jsp/include/footer.jsp" %>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>