<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 목록</title>
    <link rel="stylesheet" href="/resources/css/accomlist.css"/>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
    <div class="container">
        <h1>숙소 목록</h1>
        <p>선택한 예약 날짜: ${fromDate}부터 ${toDate}</p>
        <c:forEach items="${accommodationDtos}" var="accommodation">
            <div class="accommodation" onclick="location.href='accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}';">
                <img src="${accommodation.accompic}" alt="숙소 사진">
                <div class="info">
                    <div class="name">
                        <a href="accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}">
                            ${accommodation.accomname}
                        </a>
                    </div>
                    <div class="location">
                        <a href="accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}">
                            ${accommodation.accomlocation}
                        </a>
                    </div>
                    <div class="city">
                        <a href="accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}">
                            ${accommodation.cityname}
                        </a>
                    </div>
                    <div class="price">
                        <a href="accomlistview?pcode=${accommodation.pcode}&fromDate=${fromDate}&toDate=${toDate}">
                            ${accommodation.accomprice}
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
        <input type="button" onclick="history.go(-1);" class="btn-go-back" value="전페이지로 이동">
    </div>
</body>
</html>