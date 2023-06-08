<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
<body>
    <table>
        <tr>
            <th>예약 정보</th>
        </tr>
        <tr>
            <td>예약 번호</td>
            <td>${reservationDto.resnum}</td>
        </tr>
        <tr>
            <td>체크인</td>
            <td>${fn:substring(reservationDto.checkindate, 0, 10)}</td>
        </tr>
        <tr>
            <td>체크아웃</td>
            <td>${fn:substring(reservationDto.checkoutdate, 0, 10)}</td>
        </tr>
        <tr>
            <td>가격</td>
            <td>${reservationDto.resprice}</td>
        </tr>
    </table>

    <table>
        <tr>
            <th>숙소 정보</th>
        </tr>
        <tr>
            <td>위치</td>
            <td>${accommodationDto.accomlocation}</td>
        </tr>
        <tr>
            <td>사진</td>
            <td><img src="${accommodationDto.accompic}" alt="숙소 사진"></td>
        </tr>
        <tr>
            <td>정보</td>
            <td>${accommodationDto.accomdes}</td>
        </tr>
    </table>
</body>
</html>