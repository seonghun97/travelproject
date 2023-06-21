<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="/resources/css/reviewwrite.css"/>
<%@ include file="include/header.jsp" %>
</head>
<body>
    <h3>게시글 작성</h3>
    <div>
        <form id="reviewWrite" method="post" action="/write" onsubmit="return validateForm()">
            <div>
                <label>제목</label>
                <input type="text" id="subject" name="subject" class="form-control">
            </div>
            <div>
                <label>작성자</label>
                <input type="text" name="writer" class="form-control" value="${sessionScope.sessionId}" readonly>
            </div>
            <div>
                <label>내용</label>
                <textarea id="content" name="content" class="form-control" rows="5"></textarea>
            </div>
            <input type="submit" value="글 작성" class="submit-btn">
            <input type="button" value="글 목록" onclick="script:window.location.href='review'" class="list-btn">
        </form>
    </div>
    <script>
        function validateForm() {
            var subject = document.getElementById("subject").value;
            var content = document.getElementById("content").value;
            
            if (subject.trim() === "" || content.trim() === "") {
                alert("제목과 내용을 모두 입력해주세요.");
                return false;
            }
            
            return true;
        }
    </script>
</body>
</html>