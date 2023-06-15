<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="/resources/js/join.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/header.css">
    <title>헤더입니다.</title>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr class="headerline">
        <td class="margin01">&nbsp;</td>
        <td class="specialhead"><a href="index">ICI TRAVEL PROJECT</a></td>
        <td class="margin02">&nbsp;</td>
        <% String sessionId = (String) session.getAttribute("sessionId");
        if (sessionId == null) { %>
        <td class="headertext"><a href="login">로그인</a></td>
        <% } else { %>
        <td class="headertext"><a href="logout">로그아웃</a></td>
        <% } %>
        <% if (sessionId == null) { %>
        <td class="headertext"><a href="join">회원가입</a></td>
        <% } else { %>
        <% } %>
        <td class="headertext"><a href="mypage" onclick="checkLogin()">마이페이지</a></td><br><br>
        <td class="headertext"><a href="review">후기게시판</a></td>
    </table>	
</body>
<script>
    function checkLogin() {
        <% if (sessionId == null) { %>
        alert("로그인이 필요한 페이지입니다. 로그인 후 이용해주세요.");
        return false;
        <% } %>
    }
</script>
</html>