<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소</title>
    <%@  include file= "/WEB-INF/views/include/header.jsp" %>
    <style>
    #map {
        width: 1000px;
        height: 600px;
    }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key="></script>
    <script type="text/javascript" src="/resources/js/map.js"></script>
</head>
<body onload="initializeMap()">
    <form id="reservationForm" method="post" action="reservationOk">
        <p>선택한 예약 날짜: ${fromDate}부터 ${toDate}</p>
        <table>
            <tr>
                <td>숙소 코드:</td>
                <td><input type="text" name="accomcode" value="${accommodation.accomcode}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>숙소 이름:</td>
                <td><input type="text" name="accomname" value="${accommodation.accomname}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>숙소 사진:</td>
                <td><img src="${accommodation.accompic}" alt="숙소 사진" width="200" height="200"></td>
            </tr>
            <tr>
                <td>숙소 설명:</td>
                <td><textarea class="textareabox" rows="8" cols="130" name="accomdes" readonly="readonly">${accommodation.accomdes}</textarea></td>
            </tr>
            <tr>
                <td>숙소 위치:</td>
                <td>
                    <input type="hidden" id="accomlocation" name="accomlocation" value="${accommodation.accomlocation}">
                    <div id="map" style="height: 400px;"></div>
                </td>
            </tr>
            <tr>
                <td>숙박 가격:</td>
                <td><input type="text" name="resprice" value="${accommodation.accomprice}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>
                    <input type="hidden" name="fromDate" value="${fromDate}">
                    <input type="hidden" name="toDate" value="${toDate}">
                    <input type="submit" value="예약하기">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>