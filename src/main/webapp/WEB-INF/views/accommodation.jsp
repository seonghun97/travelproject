<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 페이지</title>
    <script>
        function validateForm() {
            var location = document.getElementsByName("location");
            var checked = false;
            for (var i = 0; i < location.length; i++) {
                if (location[i].checked) {
                    checked = true;
                    break;
                }
            }
            if (!checked) {
                alert("공항, 숙소 중 하나를 선택해주세요.");
                return false;
            }
        }

        function openCalendar(dateType) {
            var calendarWindow = window.open("cal?dateType=" + dateType, "_blank", "width=800,height=600");
            calendarWindow.addEventListener("message", function(event) {
                var selectedDate = event.data;
                if (selectedDate) {
                    var button;
                    if (dateType === "startDate") {
                        button = document.getElementById("departureButton");
                    } else if (dateType === "endDate") {
                        button = document.getElementById("returnButton");
                    }
                    button.innerText = selectedDate;
                    calendarWindow.close();
                }
            });
        }
    </script>
</head>	
<body>
    <form action="/processForm" method="POST" onsubmit="return validateForm()">
        <input type="radio" name="location" value="airplain"> 비행기
        <input type="radio" name="location" value="accommodation"> 숙소
        <select name="city">
            <c:forEach items="${cities}" var="city">
                <option value="${city}">${city}</option>
            </c:forEach>
        </select>
        <input type="submit" value="선택">
    </form>
    <button id="departureButton" onclick="openCalendar('startDate')">가는날</button>
    <button id="returnButton" onclick="openCalendar('endDate')">오는날</button>
</body>
</html>