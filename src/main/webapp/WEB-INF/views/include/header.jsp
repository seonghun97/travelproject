<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/join.js"></script>    
    <title>헤더 입니다.</title>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="" width="100%">
    <tr class="headerline">
        <td class="margin01">&nbsp;</td>
        <td class="headertext"><a href="index">HOME</a></td>
        <td class="margin02">&nbsp;</td>
        <% String sessionId = (String) session.getAttribute("sessionId");
        if (sessionId == null) { %>
        <td class="headertext"><a href="login">로그인</a></td>
        <% } else { %>
        <td class="headertext"><a href="logout">로그아웃</a></td>
        <% } %>
        <td class="margin02">&nbsp;</td>
        <% if (sessionId == null) { %>
        <td class="headertext"><a href="join">회원가입</a></td>
        <% } else { %>
        <% } %>
        <td class="headertext"><a href="mypage" onclick="checkLogin()">마이페이지</a></td><br><br>
        <tr>
            <% if (sessionId == null) { %>
            <td>&nbsp;</td>
            <% } else { %>
            <td colspan="15" align="right"><b><c:out value="${sessionId}"/>님 로그인 중입니다.</b></td>
            <% } %>
        </tr>
    </table>
    <table border="0" cellspacing="0" cellpadding="" width="50%">
    	<tr>
    		<td><a href="airplain">항공예매</a></td>
    		<td><a href="accommodation">숙소예매</a></td>
    		<td><a href="board">문의게시판</a></td>
    		<td><a href="review">후기게시판</a></td>
    	</tr>
    		
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