<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reviewWatch.css"/>
<title>자유게시판 글 내용</title>
<%@ include file="include/header.jsp" %>
</head>
<body>
    <div class="container">
        <h1>${redto.reviewsubject }</h1>
        <p class="post-details">작성자: ${redto.userid } | 등록일: ${redto.reviewdate } | 조회수: ${redto.hit }</p>
        <div class="post-content">${redto.reviewcontent }</div>
        <div class="buttons-container">
            <c:if test="${delCheck == 1}">
                <input type="button" value="삭제" onclick="script:window.location.href='delete?reviewnum=${redto.reviewnum }'">
            </c:if>
            <input type="button" value="목록" onclick="script:window.location.href='review'">
        </div>
    </div>
</body>
</html>