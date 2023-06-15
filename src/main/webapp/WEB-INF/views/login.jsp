<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
     <link rel="stylesheet" href="/resources/css/login.css"/>
    <title>Login</title>
</head>
<body>
<%@ include file="include/header.jsp" %><br><br>
<div class="container">
    <form action="loginOk" method="post">
        <table border="0" cellspacing="0" cellpadding="10">
            <tr>
                <td>아 이 디 :</td>
                <td><input type="text" name="userid"></td>
            </tr>
            <tr>
                <td>비밀번호 :</td>
                <td><input type="password" name="userpw"></td>
            </tr>
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="로그인">
                </td>
            </tr>
        </table>
    </form>
</div>
<%@  include file= "include/footer2.jsp" %>
</body>
</html>