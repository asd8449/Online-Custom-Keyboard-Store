<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <!-- 로고 -->
        <a class="navbar-brand" href="/keyboard-WEB">
            <img src="/keyboard-WEB/resources/images/logo.png" alt="Logo" style="width: 160px; height: 45px;">
        </a>

        <!-- 사용자 상태 표시 -->
        <c:if test="${not empty user}">
            <span class="navbar-text me-auto">
                ${user.name} (${user.id})님 로그인 중...
            </span>
        </c:if>

        <!-- 네비게이션 메뉴 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/keyboard-WEB">HOME</a>
                </li>
                <c:if test="${user.type eq 'S'}">
                    <li class="nav-item">
                        <a class="nav-link" href="/keyboard-WEB/admin/adminPage.do">관리자 페이지</a>
                    </li>
                </c:if>
                <c:choose>
                    <c:when test="${empty user}">
                        <li class="nav-item">
                            <a class="nav-link" href="/keyboard-WEB/member/register.do">회원가입</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/keyboard-WEB/member/loginPage.do">로그인</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="#">마이페이지</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">장바구니</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/keyboard-WEB/member/logout.do">로그아웃</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <li class="nav-item">
                    <a class="nav-link" href="/keyboard-WEB/board/list.do">문의 및 공지</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
