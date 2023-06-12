<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation Details</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
        }
    </style>
</head>
<%@  include file= "include/header.jsp" %><br><br>
<body>
    <table>
        <tr>
            <th>예약 정보</th>
        </tr>
        <tr>
    		<td>예약자 이름</td>
    		<td>${user.username }</td>
    	</tr>
        <tr>
            <td>예약 번호</td>
            <td>${selectedReservation.resnum}</td>
        </tr>
        <tr>
            <td>체크인</td>
            <td>${fn:substring(selectedReservation.checkindate, 0, 10)}</td>
        </tr>
        <tr>
            <td>체크아웃</td>
            <td>${fn:substring(selectedReservation.checkoutdate, 0, 10)}</td>
        </tr>
        <tr>
            <td>가격</td>
            <td>${selectedReservation.resprice}</td>
        </tr>
    </table>

    <table>
        <tr>
            <th>숙소 정보</th>
        </tr>
        <tr>
            <td>위치</td>
            <td>${accommodation.accomlocation}</td>
        </tr>
        <tr>
            <td>사진</td>
            <td><img src="${accommodation.accompic}" alt="숙소 사진"></td>
        </tr>
        <tr>
            <td>정보</td>
            <td>${accommodation.accomdes}</td>
        </tr>
        <tr>
            <td>방번호</td>
            <td>${accommodation.roomname}</td>
        </tr>
    </table>
</body>
</html>