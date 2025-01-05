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
<title>회원가입</title>
<script src="/keyboard-WEB/resources/js/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function () {
    let isIdAvailable = false; // ID 중복 검사 여부 플래그

    // 취소 버튼 클릭
    $('#listBtn').click(function () {
        location.href = '/keyboard-WEB/';
    });

    // 아이디 중복확인
    $('#checkIdBtn').click(function () {
        const userId = $('#id').val().trim();
        if (userId === '') {
            alert('아이디를 입력하세요.');
            $('#id').focus();
            return;
        }

        $.ajax({
            url: '/keyboard-WEB/member/checkId.do',
            method: 'POST',
            data: { id: userId },
            success: function (response) {
                if (response === 'available') {
                    alert('사용 가능한 아이디입니다.');
                    isIdAvailable = true; // 중복검사 통과
                } else if (response === 'unavailable') {
                    alert('이미 사용 중인 아이디입니다.');
                    $('#id').focus();
                    isIdAvailable = false; // 중복검사 실패
                }
            },
            error: function () {
                alert('아이디 중복확인 중 오류가 발생했습니다.');
                isIdAvailable = false;
            }
        });
    });

    // 폼 유효성 검사
    $('#registerForm').submit(function (e) {
        // 중복검사 통과 여부 확인
        if (!isIdAvailable) {
            alert('아이디 중복검사를 통과해야 회원가입이 가능합니다.');
            $('#id').focus();
            e.preventDefault(); // 폼 제출 방지
            return;
        }

        // 일반적인 필드 유효성 검사
        const form = document.forms['registerForm'];

        if (checkBlank(form.id, 'ID를 입력하세요')) return false;
        if (checkBlank(form.name, '이름을 입력하세요')) return false;
        if (checkBlank(form.password, '비밀번호를 입력하세요')) return false;
        if (checkBlank(form.email_id, '이메일 ID를 입력하세요')) return false;
        if (checkBlank(form.email_domain, '이메일 도메인을 입력하세요')) return false;
        if (checkBlank(form.ph_first, '전화번호 앞자리를 입력하세요')) return false;
        if (checkBlank(form.ph_second, '전화번호 중간자리를 입력하세요')) return false;
        if (checkBlank(form.ph_third, '전화번호 뒷자리를 입력하세요')) return false;

        return true; // 모든 조건을 통과하면 폼 제출
    });
});

// 공백 체크 및 알림 함수
function checkBlank(input, message) {
    if (input.value.trim() === '') {
        alert(message);
        input.focus();
        return true;
    }
    return false;
}

    </script>
</head>
<body>
<c:if test="${not empty alertMsg}">
    <script>
        alert('${alertMsg}');
    </script>
    <c:remove var="alertMsg" />
</c:if>

	<!-- 헤더 -->
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>

	<!-- 회원가입 섹션 -->
	<section class="container my-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card shadow-sm">
					<div class="card-body">
						<h2 class="text-center mb-4">회원가입</h2>
						<form id="registerForm"
							action="${pageContext.request.contextPath}/member/regist.do"
							method="POST">
							<div class="mb-3">
								<label for="id" class="form-label">ID</label> <input type="text"
									class="form-control" id="id" name="id" placeholder="아이디를 입력하세요"
									required>
								<button type="button" id="checkIdBtn"
									class="btn btn-outline-secondary">중복확인</button>
							</div>
							<div class="mb-3">
								<label for="name" class="form-label">NAME</label> <input
									type="text" class="form-control" id="name" name="name"
									placeholder="이름을 입력하세요" required>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">PASSWORD</label> <input
									type="password" class="form-control" id="password"
									name="password" placeholder="비밀번호를 입력하세요" required>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">EMAIL</label>
								<div class="input-group">
									<input type="text" class="form-control" id="email_id"
										name="email_id" placeholder="이메일 ID" required> <span
										class="input-group-text">@</span> <input type="text"
										class="form-control" id="email_domain" name="email_domain"
										placeholder="도메인" required>
								</div>
							</div>
							<div class="mb-3">
								<label for="phone" class="form-label">TELEPHONE</label>
								<div class="input-group">
									<input type="text" class="form-control" id="ph_first"
										name="ph_first" placeholder="010" required> <span
										class="input-group-text">-</span> <input type="text"
										class="form-control" id="ph_second" name="ph_second"
										placeholder="1234" required> <span
										class="input-group-text">-</span> <input type="text"
										class="form-control" id="ph_third" name="ph_third"
										placeholder="5678" required>
								</div>
							</div>
							<div class="d-flex justify-content-between">
								<button type="submit" class="btn btn-primary">회원가입</button>
								<button type="button" id="listBtn" class="btn btn-secondary">취소</button>
							</div>
						</form>
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
