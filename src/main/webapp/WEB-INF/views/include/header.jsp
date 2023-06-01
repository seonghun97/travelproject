<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<td class="headertext"><a href="index">일본여행사</a></td>
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
			<td class="headertext"><a href="MyPage">마이페이지</a></td>
			<%
				}
			%>
			<tr >
			<%
				if(sessionId == null ){
			%>
			<td>&nbsp;</td>
			<%
				} else {
			%>
			<td colspan="15" align="right"><b><c:out value="${sessionId }"/>님 로그인 중입니다.</b></td>
			<%
				}
			%>
			<td class="headertext"><a href="Accommodation">숙소</a>
			<td class="headertext"><a href="Aviation">항공</a>
			<td class="headertext"><a href="Review">리뷰</a>
			<td class="headertext"><a href="bulletin">문의게시판</a>			
		</tr>
	</table>

</body>
</html>