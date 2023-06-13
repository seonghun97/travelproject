<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <style>
        /* datepicker에서 사용한 이미지 버튼 스타일 적용 */
        img.ui-datepicker-trigger {
            margin-left: 5px;
            vertical-align: middle;
            cursor: pointer;
        }
    </style>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- datepicker 한국어로 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <script type="text/javascript" src="/resources/js/calendar.js"></script>
    <script>
        function validateForm() {
            var city = document.getElementsByName("city")[0].value;
            if (city === "--도시를선택해주세요--") {
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
</head>
<body>
  <form id="locationForm" action="/AccommodationForm" onsubmit="return validateForm()">
    숙소
    <select name="city">
        <option value="--도시를선택해주세요--">--도시를선택해주세요--</option>
        <c:forEach items="${cityList}" var="cityName">
            <option value="${cityName}">${cityName}</option>
        </c:forEach>
    </select>
        <br>
        오늘 날짜: <span id="today"></span><br>
        <label>출발일</label>
        <input type="text" name="fromDate" id="fromDate" readonly>
        ~
        <label>도착일</label>
        <input type="text" name="toDate" id="toDate" readonly>
        <input type="submit" value="선택">
    </form>
</body>
</html>