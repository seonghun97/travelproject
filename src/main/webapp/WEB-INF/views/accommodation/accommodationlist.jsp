<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 목록</title>
</head>
<body>
    <h1>숙소 목록</h1>
    <p>선택한 예약 날짜: ${fromDate}부터 ${toDate}</p>
    <table>
        <thead>
            <tr>
                <th>숙소 이름</th>
                <th>숙소 사진</th>
                <th>숙소 설명</th>
                <th>위치</th>
                <th>안내사항</th>
                <th>도시 이름</th>
                <th>객실 이름</th>
                <th>객실 가격</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${accommodationDtos}" var="accommodation">
                <tr>
                    <td>${accommodation.accomname}</td>
                    <td><img src="${accommodation.accompic}" alt="숙소 사진"></td>
                    <td>
                    <a href="accommodationview?accomcode=${accommodation.accomcode}">
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
                    <td>${accommodation.accomnotice}</td>
                    <td>${accommodation.cityname}</td>
                    <td>${accommodation.roomname}</td>
                    <td>${accommodation.accomprice}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>