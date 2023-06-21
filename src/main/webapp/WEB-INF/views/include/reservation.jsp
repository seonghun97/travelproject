<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 예약</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="/resources/css/reservation.css"/>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- datepicker 한국어로 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <script type="text/javascript" src="/resources/js/calendar.js"></script>
</head>
<body>
<div class="container">
    <h1>숙소 예약</h1>
    <form id="locationForm" action="/AccommodationForm" onsubmit="return validateForm()">
        <label for="city">도시</label>
        <select name="city">
            <option value="도시를선택해주세요">도시를선택해주세요</option>
            <c:forEach items="${cityList }" var="cityName">
                <option value="${cityName }">${cityName }</option>
            </c:forEach>
        </select>
        <br>
        <label for="fromDate">체크인</label>
        <div class="date-range-inputs">
            <input type="text" name="fromDate" id="fromDate" readonly>
            <span class="date-range-label">체크아웃</span>
            <input type="text" name="toDate" id="toDate" readonly>
        </div>
        <br>
        <input type="submit" class="submit-button" value="선택">
    </form>
        <script>
        function validateForm() {
            var city = document.getElementsByName("city")[0].value;
            if (city === "도시를선택해주세요") {
                alert("도시를 선택해주세요.");
                return false;
            }

            var fromDate = document.getElementById("fromDate").value;
            var toDate = document.getElementById("toDate").value;
            if (fromDate === "" || toDate === "") {
                alert("날짜를 선택해주세요.");
                return false;
            }

            return true;
        }
    </script>
</div>
</body>
</html>






