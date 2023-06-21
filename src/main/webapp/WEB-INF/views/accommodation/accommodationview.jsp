<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/accomview.css"/>
    <meta charset="UTF-8">
    <title>숙소</title>
    <%@  include file= "/WEB-INF/views/include/header.jsp" %>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx911_LS5VyvITAvu7qSnPtQmBJv9FZX4"></script>
    <script type="text/javascript" src="/resources/js/map.js"></script>
</head>
<body onload="initializeMap()">
    <div class="container">
        <h1>숙소</h1>
        <form id="reservationForm" method="post" action="reservationOk">
            <p>선택한 예약 날짜: ${fromDate}부터 ${toDate}</p>
            <table>
                <tr>
                    <th>숙소 코드:</th>
                    <td><input type="text" name="accomcode" value="${accommodation.accomcode}" readonly="readonly"></td>
                </tr>
                <tr>
                    <th>숙소 이름:</th>
                    <td><input type="text" name="accomname" value="${accommodation.accomname}" readonly="readonly"></td>
                </tr>
                <tr>
                    <th>숙소 사진:</th>
                    <td><img src="${accommodation.accompic}" alt="숙소 사진"></td>
                </tr>
                <tr>
                    <th>숙소 설명:</th>
                    <td><textarea class="textareabox" rows="8" cols="130" name="accomdes" readonly="readonly">${accommodation.accomdes}</textarea></td>
                </tr>
                <tr>
                    <th>숙소 위치:</th>
                    <td>
                        <input type="hidden" id="accomlocation" name="accomlocation" value="${accommodation.accomlocation}">
                        <div id="map"></div>
                    </td>
                </tr>
                <tr>
                    <th>숙박 가격:</th>
                    <td><input type="text" name="resprice" value="${accommodation.accomprice}" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="fromDate" value="${fromDate}">
                        <input type="hidden" name="toDate" value="${toDate}">
                    </td>
                    <td>
                    	<input type="button" onclick="history.go(-1);" class="btn-go-back" value="전페이지로 이동">
                    	<input type="submit" value="예약하기">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>