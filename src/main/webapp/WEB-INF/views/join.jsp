<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/join.css"/>
<script type="text/javascript" src="/resources/js/join.js"></script>
<title>Signup</title>
</head>
<body>
<div class="container">
<%@ include file="include/header.jsp" %>
    <div class="form-container">
        <form action="joinOk" method="post" name="join_frm">
            <input type="text" name="userid" placeholder="아이디는 4글자 이상이어야합니다">
            <input type="password" name="userpw" placeholder="비밀번호">
            <input type="password" name="userpw_check" placeholder="비밀번호 확인">
            <input type="text" name="username" placeholder="이름">
            <input type="text" name="userbirth" placeholder="사용자 생일 (ex: 20230528)">
            <input type="text" name="useremail" placeholder="이메일">
            <input type="text" name="usermobile" placeholder="전화번호 (예: 01012345678)">
            <input type="button" value="가입 완료" onclick="joinCheck()">
        </form>
    </div>
</div>
<%@  include file= "include/footer2.jsp" %>
</body>
</html>