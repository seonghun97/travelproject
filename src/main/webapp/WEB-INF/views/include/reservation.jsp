<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약</title>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <style>
        /*datepicker에서 사용한 이미지 버튼 style적용*/
        img.ui-datepicker-trigger {
            margin-left:5px; vertical-align:middle; cursor:pointer;
        }
    </style>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- datepicker 한국어로 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <script>
    $(function() {
        // 오늘 날짜를 출력
        $("#today").text(new Date().toLocaleDateString());

        // datepicker 한국어로 사용하기 위한 언어설정
        $.datepicker.setDefaults($.datepicker.regional['ko']);

        $('#fromDate').datepicker({
            showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
            buttonImage: "calendar.png",        // 버튼 이미지
            buttonImageOnly: true,              // 버튼 이미지만 표시할지 여부
            buttonText: "날짜선택",              // 버튼의 대체 텍스트
            dateFormat: "yy-mm-dd",             // 날짜의 형식
            changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
            minDate: 0,                         // 오늘 이전 날짜 선택 불가
            onClose: function(selectedDate) {
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#toDate").datepicker("option", "minDate", selectedDate);
            }
        });

        $('#toDate').datepicker({
            showOn: "both",
            buttonImage: "calendar.png",
            buttonImageOnly: true,
            buttonText: "날짜선택",
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            onClose: function(selectedDate) {
                // 종료일(toDate) datepicker가 닫힐때
                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
                $("#fromDate").datepicker("option", "maxDate", selectedDate);
            }
        });
     
    });
    
    </script>
	<script>
	function changeFormAction(locationValue) {
	    var form = document.getElementById("locationForm");
	    if (locationValue === "airplane") {
	        form.action = "/AirplaneForm";
	    } else if (locationValue === "accommodation") {
	        form.action = "/AccommodationForm";
	    }
	}
	
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
    <% String[] cities = {"--도시를선택해주세요--", "도쿄", "쿄토", "오사카", "오키나와", "삿포루", "요코하마", "나고야"}; %>

    <form id="locationForm" onsubmit="return validateForm()">
      <!-- <input type="radio" name="location" value="airplane" onclick="changeFormAction(this.value)"> 비행기 -->  
        <input type="radio" name="location" value="accommodation" onclick="changeFormAction(this.value)" checked> 숙소
        <select name="city">
            <c:forEach items="<%= cities %>" var="city">
                <option value="${city}">${city}</option>
            </c:forEach>
        </select>
        <br>
        오늘 날짜: <span id="today"></span><br>
        <label>출발일</label>
        <input type="text" name="fromDate" id="fromDate">
        ~
        <label>도착일</label>	
        <input type="text" name="toDate" id="toDate">
        <input type="submit" value="선택">
    </form>
</body>
</html>