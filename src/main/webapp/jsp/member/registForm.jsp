<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/keyboard-WEB/resources/css/styles.css">
<script src="/keyboard-WEB/resources/js/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#listBtn').click(function(){
		location.href = '/keyboard-WEB/board/list.do'
	})
})
</script>
</head>
<body>
	<header class="bg-dark py-4">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
		<br>
		<hr>
		<h1>회원 등록폼</h1>
		<hr>
		<br>
		<form action="join.jsp" method="POST">
			<table border="1" style="width: 40%">
				<tr>
					<th width="23%">ID</th>
					<td>
						<input type="text" name="id" required>
					</td>
				</tr>
				<tr>
					<th>NAME</th>
					<td>
						<input type="text" name="name" required>
					</td>
				</tr>
				<tr>
					<th>PASSWORD</th>
					<td>
						<input type="password" name="password" required>
					</td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td>
						<input type="text" name="email_id" required>@<input type="text" name="email_domain" required>
					</td>
				</tr>
				<tr>
					<th>TELEPHONE</th>
					<td>
						<input type="text" name="ph_first" required> - <input type="text" name="ph_second" required> - <input type="text" name="ph_third" required>
					</td>
				</tr>
				<tr>
					<th>POST</th>
					<td>
						<input type="text" name="post" required>
					</td>
				</tr>
				<tr>
					<th>BASIC_ADDRESS</th>
					<td>
						<input type="text" name="b_addr" required style="width:90%">
					</td>
				</tr>
				<tr>
					<th>DETAIL_ADDRESS</th>
					<td>
						<input type="text" name="d_addr" required style="width:90%">
					</td>
				</tr>
			</table>
			<br>
			<button type="submit">회원가입</button>
			<button id="listBtn">취소</button>
		</form>
	</div>
	</section>
	<footer class="py-5 bg-dark mt-5">
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>