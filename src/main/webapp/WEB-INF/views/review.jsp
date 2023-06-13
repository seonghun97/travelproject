<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form id="reviewForm" method="post" action="reviewOk">
		<input type="button" value="후기글 쓰기" onclick="checkLoginAndSubmit()">
  </form>
</body>
<script>
function checkLoginAndSubmit() {
    <% String sessionId = (String) session.getAttribute("sessionId");
    if (sessionId == null) { %>
        alert("로그인이 필요한 페이지입니다. 로그인 후 이용해주세요.");
        window.location.href = "login";
    <% } else { %>
        document.getElementById("reviewForm").submit();
    <% } %>
}
</script>
</html>