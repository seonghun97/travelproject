<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@  include file= "include/header.jsp" %><br><br>
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
				<td>
				<input type="submit" value="로그인">&nbsp;&nbsp;
				<input type="button" value="회원가입" onclick="script:window.location.href='join'">
				</td>
			</tr>
			</form>
	</table>
</body>
</html>