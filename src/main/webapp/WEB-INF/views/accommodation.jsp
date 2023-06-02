<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accommodation Page</title>
</head>
<body>
	<form action="/processForm" method="POST">
	    <input type="radio" name="location" value="airplain"> 공항<br>
		<input type="radio" name="location" value="accommodation"> 숙소<br>
		<select name="city">
            <c:forEach items="${cities}" var="city">
                <option value="${city}">${city}</option>
            </c:forEach>
        </select>
        <input type="submit" value="선택">
	</form>
</body>
</html>