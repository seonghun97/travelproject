<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/join.css"/>
    <title>회원 정보 수정</title>
    <script type="text/javascript" src="/resources/js/modify.js"></script>
</head>
<body>
<div class="container">
<%@ include file="include/header.jsp" %>
    <div class="form-container">
        <form action="editMember" method="post" name="edit_frm" onsubmit="return validateForm()">
            <input type="text" name="userid" value="${user.userid}" readonly>
            <input type="password" name="userpw" placeholder="비밀번호" value="${member.userpw}">
            <input type="text" name="username" placeholder="이름" value="${member.username}">
            <input type="text" name="userbirth" placeholder="사용자 생일 (ex: 20230528)" value="${member.userbirth}">
            <input type="text" name="useremail" placeholder="이메일" value="${member.useremail}">
            <input type="text" name="usermobile" placeholder="전화번호 (예: 01012345678)" value="${member.usermobile}">
            <div class="buttons">
                <input type="submit" value="수정 완료">
                <input type="button" class="cancel-button" value="수정 취소" onclick="cancelEdit()">            
            </div>        
        </form>
    </div>
</div>
<%@ include file= "include/footer2.jsp" %>
<script type="text/javascript" src="/resources/js/modify.js"></script>
</body>
</html>