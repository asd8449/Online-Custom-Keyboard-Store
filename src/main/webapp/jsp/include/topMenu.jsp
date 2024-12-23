<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2" style="width: 160px; height: 45px;"><a
			href="/keyboard-WEB"> <img
				src="/keyboard-WEB/resources/images/logo.png"
				style="width: 160px; height: 45px;">
		</a></td>
		<c:if test="${not empty user }">
			<td>${user.name}(${user.id})님로그인중...</td>
		</c:if>
	</tr>
	<tr>
		<td>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container px-4 px-lg-5">
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
							<c:if test="${ user.type eq 'S'}">
								<li class="nav-item"><a class="nav-link"
									href="/keyboard-WEB/member/adminPage.do">관리자 페이지</a></li>
							</c:if>
							<c:choose>
								<c:when test="${empty user }">
									<li class="nav-item"><a class="nav-link"
										href="/keyboard-WEB/member/register.do">회원가입</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/keyboard-WEB/member/loginPage.do">로그인</a></li>
								</c:when>
								<c:otherwise>
							<li class="nav-item"><a class="nav-link"
										href="#">마이페이지</a></li>
							<li class="nav-item"><a class="nav-link"
										href="/keyboard-WEB/cart/cart.do">장바구니</a></li>
						<li class="nav-item"><a class="nav-link"
										href="/keyboard-WEB/member/logout.do">로그아웃</a></li>
						</c:otherwise>
							</c:choose>
							<li class="nav-item"><a class="nav-link"
										href="/keyboard-WEB/board/list.do">문의 및 공지</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</td>
	</tr>
</table>
<br>