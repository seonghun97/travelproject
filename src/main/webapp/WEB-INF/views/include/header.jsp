<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더 입니다 .</title>
</head>
<body>
<table boarder ="2" cellspacing= "2" cellpadding ="2" width ="80%" >
 <tr class=" headerline">
 	<td class="margin00">&nbsp;</td>
 	<td class= "headertext"><a href="index"> HOME</a></td>
 	<td class="margin01">&nbsp;</td>
 	
 	<%
 	     String sessionId =(String) session.getAttribute("sessionId");
     %>
     
 
 
 
 
 </tr>










    </table>

</body>
</html>