<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더 입니다 .</title>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="" width="100%">
		<tr class="headerline">
			<td class="margin01">&nbsp;</td>
			<td class="headertext"><a href="index">HOME</a></td>
			<td class="margin02">&nbsp;</td>
			<%
				String sessionId = (String) session.getAttribute("sessionId");
				if(sessionId == null) {
			%>
			<td class="headertext"><a href="login">로그인</a></td>
			<%
				} else {
			%>
			<td class="headertext"><a href="logout">로그아웃</a></td>
			<%
				}
			%>
			<td class="margin02">&nbsp;</td>
			<%				
				if(sessionId == null) {
			%>
			<td class="headertext"><a href="join">회원가입</a></td>
			<%
				} else {
			%>
			<%
				}
			%>
			</tr>
		
	</table>

</body>
</html>