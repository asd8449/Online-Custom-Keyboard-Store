<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<style>
.category-filter {
        text-align: center;
        margin: 30px 0;
    }
    .category-btn {
        display: inline-block;
        margin: 0 10px;
        padding: 8px 16px;
        border: 1px solid #ccc;
        background: #fff;
        color: #333;
        cursor: pointer;
        transition: background 0.3s;
        text-transform: capitalize;
    }

</style>
    <div class="container">
        <div class="category-filter">
            <span class="category-btn"><a href="/keyboard-WEB/item/itemPage.do?category=키보드">완제품 키보드</a></span>
            <span class="category-btn"><a href="/keyboard-WEB/item/itemPage.do?category=베어본">베어본</a></span>
            <span class="category-btn"><a href="/keyboard-WEB/item/itemPage.do?category=스위치">스위치</a></span>
            <span class="category-btn"><a href="/keyboard-WEB/item/itemPage.do?category=키캡">키캡</a></span>
        </div>
    </div>