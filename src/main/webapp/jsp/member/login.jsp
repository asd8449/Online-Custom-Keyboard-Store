<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/keyboard-WEB/resources/css/styles.css">
<script>
let checkForm = function() {
	let id = document.loginForm.id;
	let password = document.loginForm.password;
	
	if(id.value.trim() === '') {
		alert('ID를 입력하세요');
		id.focus();
		return false;
	}
	
	if(password.value.trim() === '') {
		alert('PASSWORD를 입력하세요');
		password.focus();
		return false;
	}
		
	return true;
}
</script>
</head>
<body>
<c:if test="${not empty sessionScope.error}">
    <script>alert('아이디 혹은 비밀번호가 틀렸습니다.')</script>
    <c:remove var="error" scope="session"/>
</c:if>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<br>
			<hr>
			<h2>로그인</h2>
			<hr>
			<br>
			<form name="loginForm" action="${ pageContext.request.contextPath }/member/login.do" method="post"
			 	  onsubmit="return checkForm()">
				<table>
					<tr>
						<th>ID</th>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td>
							<input type="password" name="password">
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" value="로그인" >
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>