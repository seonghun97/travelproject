<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation Details</title>
    <link rel="stylesheet" href="/resources/css/reserview.css"/>
    <script src="https://maps.googleapis.com/maps/api/js?key="></script>
    <script type="text/javascript" src="/resources/js/map.js"></script>
</head>
<%@  include file= "include/header.jsp" %><br><br>
<body>
    <table>
        <tr>
            <th colspan="2">예약 정보</th>
        </tr>
        <tr>
            <th>예약자 이름</th>
            <td>${user.username }</td>
        </tr>
        <tr>
            <th>예약 번호</th>
            <td>${selectedReservation.resnum }</td>
        </tr>
        <tr>
            <th>체크인</th>
            <td>${fn:substring(selectedReservation.checkindate, 0, 10) }</td>
        </tr>
        <tr>
            <th>체크아웃</th>
            <td>${fn:substring(selectedReservation.checkoutdate, 0, 10) }</td>
        </tr>
        <tr>
            <th>가격</th>
            <td>${selectedReservation.resprice }</td>
        </tr>
    </table>

    <table>
        <tr>
            <th colspan = "2">숙소 정보</th>
        </tr>
        <tr>
            <th>위치</th>
            <td>${accommodation.accomlocation }</td>
        </tr>
        <tr>
            <th>사진</th>
            <td><img src="${accommodation.accompic }" alt="숙소 사진" width="200" height="200"></td>
        </tr>
        <tr>
            <th>정보</th>
            <td>${accommodation.accomdes }</td>
        </tr>
        <tr>
            <th>방번호</th>
            <td>${accommodation.roomname }</td>
        </tr>
        <tr>
            <th>지도</th>
              <td>
                  <input type="hidden" id="accomlocation" name="accomlocation" value="${accommodation.accomlocation }">
                  <div id="map" style="height: 400px;"></div>
              </td>
        </tr>
    </table>
</body>
</html>