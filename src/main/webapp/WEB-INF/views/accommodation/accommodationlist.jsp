<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 목록</title>
    <%@  include file= "/WEB-INF/views/include/header.jsp" %>
</head>
<body>
    <h1>숙소 목록</h1>
    <p>선택한 예약 날짜: ${fromDate}부터 ${toDate}</p>
    <table border="0" cellspacing="20" width="75%">
        <thead>
            <tr>
                <th>숙소 이름</th>
                <th>숙소 사진</th>
                <th>숙소 설명</th>
                <th>위치</th>
                <th width="10%">도시 이름</th>
                <th width="10%">객실 호수</th>
                <th width="10%">객실 가격</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${accommodationDtos}" var="accommodation">
                <tr>
                    <td>${accommodation.accomname}</td>
                    <td><img src="${accommodation.accompic}" alt="숙소 사진" width="200" height="200"></td>
                    <td>
                    <a href="accommodationview?accomcode=${accommodation.accomcode}&fromDate=${fromDate}&toDate=${toDate}">
                        <c:choose>
                        <c:when test="${fn:length(accommodation.accomdes) > 30}">
                            <c:out value="${fn:substring(accommodation.accomdes, 0, 29)}"></c:out>...
                        </c:when>
                        <c:otherwise>
                            <c:out value="${accommodation.accomdes}"></c:out>
                        </c:otherwise>
                        </c:choose>
                    </a>
                    </td>
                    <td>${accommodation.accomlocation}</td>
                    <td>${accommodation.cityname}</td>
                    <td>${accommodation.roomname}</td>
                    <td>${accommodation.accomprice}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>