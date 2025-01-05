<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>로그인</title>
    <script>
        let checkBlank = function(input, message) {
            if (input.value.trim() === '') {
                alert(message);
                input.focus();
                return true;
            }
            return false;
        };

        // 폼 유효성 검사
        let checkForm = function() {
            let id = document.loginForm.id;
            let password = document.loginForm.password;

            if (checkBlank(id, 'ID를 입력하세요')) return false;
            if (checkBlank(password, 'PASSWORD를 입력하세요')) return false;

            return true; // 모든 유효성 검사를 통과하면 true 반환
        };
    </script>
</head>
<body>
    <c:if test="${not empty alertMsg}">
        <script>
            alert('${alertMsg}');
        </script>
        <c:remove var="alertMsg" />	
    </c:if>
    <c:if test="${not empty loginErrorMsg}">
        <script>
            alert('${loginErrorMsg}');
        </script>
        <c:remove var="loginErrorMsg" />
    </c:if>

    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>

    <section class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card shadow">
                    <div class="card-body">
                        <h2 class="text-center mb-4">로그인</h2>
                        <form name="loginForm" action="${pageContext.request.contextPath}/member/login.do" method="post" onsubmit="return checkForm()">
                            <div class="mb-3">
                                <label for="id" class="form-label">ID</label>
                                <input type="text" class="form-control" id="id" name="id" placeholder="ID를 입력하세요">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">PASSWORD</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="PASSWORD를 입력하세요">
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">로그인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <jsp:include page="/jsp/include/footer.jsp" />
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
