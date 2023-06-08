<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="reservationOk" method="post">
		<table>
			<tr>
				<td>숙소 이름 :</td>
				<td><input type="text" name="accomname" value="${accommodation.accomname}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>숙소 사진 :</td>
				<td><img src="${accommodation.accompic}" alt="숙소 사진"></td>
			</tr>
			<tr>
				<td>숙소 설명 :</td>
				<td><textarea class="textareabox" rows="8" cols="30" name="accomdes" readonly="readonly">${accommodation.accomdes}</textarea></td>
			</tr>
			<tr>
				<td>숙소 위치 :</td>
				<td><input type="text" name="accomlocation" value="${accommodation.accomlocation}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>숙박 가격 :</td>
				<td><input type="text" name="accomprice" value="${accommodation.accomprice}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="예약하기" onclick="script:window.location.href='reservation?accomcode=${accommodation.accomcode}'">&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</form>
</body>
</html>	