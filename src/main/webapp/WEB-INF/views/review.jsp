<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판 글 목록</title>
    <link rel="stylesheet" href="/resources/css/review.css"/>
    <%@ include file="include/header.jsp" %>
</head>
<body>
<div class="container">
    <h2>게시판 글 리스트</h2>
    <hr>
    <h3>총 게시글 수: ${total}</h3>
    <div class="table-container">
        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>아이디</th>
                <th>내용</th>
                <th>등록일</th>
            </tr>
            <c:forEach items="${list }" var="dto">
                <tr>
                    <td>${dto.reviewnum }</td>
                    <td>
			            <a href="reviewWatch?reviewnum=${dto.reviewnum }">
			                <c:choose>
			                    <c:when test="${fn:length(dto.reviewsubject) > 10 }">
			                        ${fn:substring(dto.reviewsubject, 0, 10) }...
			                    </c:when>
			                    <c:otherwise>
			                        ${dto.reviewsubject }
			                    </c:otherwise>
			                </c:choose>
			            </a>
			        </td>
                    <td>${dto.userid }</td>
                    <td>
                        <c:choose>
                            <c:when test="${fn:length(dto.reviewcontent) > 30 }">
                                ${fn:substring(dto.reviewcontent, 0, 30) }...
                            </c:when>
                            <c:otherwise>
                                ${dto.reviewcontent }
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${dto.reviewdate }</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="pagination">
        <c:if test="${pageMaker.prev }">
            <a href="review?pageNum=${pageMaker.startPage-5 }">◀</a>
        </c:if>
        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
            <c:choose>
                <c:when test="${currPage == num }">
                    <a href="review?pageNum=${num }" class="active">${num }</a>
                </c:when>
                <c:otherwise>
                    <a href="review?pageNum=${num }">${num }</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${pageMaker.next }">
            <a href="review?pageNum=${pageMaker.startPage+5 }">▶</a>
        </c:if>
    </div>
    <form id="reviewForm" action="/reviewWrite">
        <input type="button" value="글쓰기" onclick="checkLoginAndSubmit()" class="n-button">
    </form>
</div>
</body>
<%@  include file= "include/footer2.jsp" %>
<script>
    function checkLoginAndSubmit() {
        var sessionId = '<%= session.getAttribute("sessionId") %>';
        if (sessionId == null) {
            alert("로그인이 필요한 페이지입니다. 로그인 후 이용해주세요.");
            window.location.href = "login";
        } else {
            document.getElementById("reviewForm").submit();
        }
    }
</script>
</html>