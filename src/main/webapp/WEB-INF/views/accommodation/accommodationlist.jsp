<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/accomlist.css"/>
    <meta charset="UTF-8">
    <title>숙소 목록</title>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
    <div class="container">
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
                    <th width="10%">객실 가격</th>
	                </tr>
            </thead>
            <tbody>
                <c:forEach items="${accommodationDtos}" var="accommodation">
                    <tr onclick="location.href='accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}';">
                        <th>
                            <a href="accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}">
                                ${accommodation.accomname}
                            </a>
                        </th>
                        <td>
                            <a href="accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}">
                                <img src="${accommodation.accompic}" alt="숙소 사진" width="200" height="200">
                            </a>
                        </td>
                        <td>
                            <a href="accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}">
                                ${accommodation.accomcode}
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
                        <td>
                            <a href="accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}">
                                ${accommodation.accomlocation}
                            </a>
                        </td>
                        <td>
                            <a href="accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}">
                                ${accommodation.cityname}
                            </a>
                        </td>
                        <td>
                            <a href="accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}">
                                ${accommodation.accomprice}
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>