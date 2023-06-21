<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 목록</title>
    <link rel="stylesheet" href="/resources/css/accomlistview.css"/>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
    <div class="container">
        <h1>숙소 목록</h1>
        <p>선택한 예약 날짜: ${fromDate}부터 ${toDate}</p>
        <table>
            <thead>
                <tr>
                    <th>숙소 이름</th>
                    <th>숙소 사진</th>
                    <th>위치</th>
                    <th>도시 이름</th>
                    <th>객실 호수</th>
                    <th>객실 가격</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${accommodationDtos}" var="accommodation">
                    <tr>
                        <td class="accommodation-name">
                            <a href="accommodationview?accomcode=${accommodation.accomcode}&fromDate=${fromDate}&toDate=${toDate}">
                                ${accommodation.accomname}
                            </a>
                        </td>
                        <td class="accommodation-image">
                            <a href="accommodationview?accomcode=${accommodation.accomcode}&fromDate=${fromDate}&toDate=${toDate}">
                                <img src="${accommodation.accompic}" alt="숙소 사진">
                            </a>
                        </td>
                        <td>
                            <a href="accommodationview?accomcode=${accommodation.accomcode}&fromDate=${fromDate}&toDate=${toDate}">
                                ${accommodation.accomlocation}
                            </a>
                        </td>
                        <td>
                            <a href="accommodationview?accomcode=${accommodation.accomcode}&fromDate=${fromDate}&toDate=${toDate}">
                                ${accommodation.cityname}
                            </a>
                        </td>
                        <td>
                            <a href="accommodationview?accomcode=${accommodation.accomcode}&fromDate=${fromDate}&toDate=${toDate}">
                                ${accommodation.roomname}
                            </a>
                        </td>
                        <td>
                            <a href="accommodationview?accomcode=${accommodation.accomcode}&fromDate=${fromDate}&toDate=${toDate}">
                                ${accommodation.accomprice}
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div style="text-align: center;">
        <a href="javascript:history.go(-1);" class="btn-go-back">전페이지로 이동</a>
    </div>
</body>
</html>