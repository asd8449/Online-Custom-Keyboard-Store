<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<link rel="stylesheet" href="/keyboard-WEB/resources/css/styles.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>

$(document).ready(function() {
	$('#listBtn').click(function() {
		location.href = 'list.jsp'
	})
	const quill = new Quill('#editor', {
		  modules: {
		    toolbar: [
		      [{ header: [1, 2, false] }],
		      ['bold', 'italic', 'underline'],
		      ['image', 'code-block'],
		    ],
		  },
		  placeholder: 'Compose an epic...',
		  theme: 'snow', // or 'bubble'
		});
})

let checkForm = function() {
	let title = document.loginForm.title;
	let content = document.loginForm.content;
	
	if(title.value.trim() === '') {
		alert('제목 입력하세요');
		title.focus();
		return false;
	}
	
	if(content.value.trim() === '') {
		alert('내용을 입력하세요');
		content.focus();
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
	<section>
		<div align="center">
			<br>
			<hr>
			<h1>문의하기</h1>
			<hr>
			<br>
<%-- 			<form action="/Mission-WEB-MVC/board/write.do" method="post" name="inputForm" --%>
			<form action="${ pageContext.request.contextPath }/board/write.do" method="post" name="inputForm"
				  enctype="multipart/form-data"	>
				<input type="hidden" name="writer" value="${ user.id }">				  
				<table border="1" style="width:100%">
					<tr>
						<th width="23%">제목</th>
						<td>
							<input type="text" name="title">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
 							<c:out value="${ user.id }" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="7" cols="80" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<th>파일</th>
						<td>
							<input type="file" name="attachfile1"><br>
							<input type="file" name="attachfile2">
						</td>
					</tr>
				</table>
				<br>
				<button type="submit">문의등록</button>
				<button type="button" id="listBtn">취소</button>
			</form>
		</div>
		<div id="editor"></div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>

