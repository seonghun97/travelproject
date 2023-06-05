<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/join.js"></script>
<title>Insert title here</title>
</head>
<body>
    <%@ include file="include/header.jsp" %>
	<table border ="0" cellspacing="20">
		 <form action="joinOk" method="post" name="join_frm"> 
		  		<tr>
		  			<td>아 이 디 :</td>
		  			<td><input type="text" name="userid" placeholder="아이디는 4글자 이상이어야합니다"></td>
		  		</tr>
		  		<tr>
		  			<td>비밀번호 : </td>
		  			<td><input type="password" name="userpw"></td>
		  		</tr>
		  		<tr>
		  			<td>비밀번호확인 :</td>
		  			<td><input type="password" name="userpw_check"></td>
		  		</tr>
		  		<tr>
		  			<td>이&nbsp;&nbsp;&nbsp;&nbsp;름 :</td>
		  			<td><input type="text" name="username"></td>
		  		</tr>
		  		<tr>
		  			<td>사용자 생일 :</td>
		  			<td><input type="text" name="userbirth" placeholder="생일 예시 ex)20230528"></td>
		  		</tr>
		  		<tr>
		  			<td>이 메 일 :</td>
		  			<td><input type="text" name="useremail"></td>
		  		</tr>
		  		<tr>
		  			<td>전화 번호 :</td>
		  			<td><input type="text" name="usermobile" placeholder="전화번호는 -없이적어주세요"></td>
		  		</tr>
		  		<tr>
		  			<td colspan="2" align="center">
		  				<input type="button" value="가입완료"onclick = "joinCheck()">&nbsp;&nbsp;
		  				<input type="button" value="로그인">
		  				
		  			</td>
		  		</tr>
		  	</form>
		 </table>
</body>
</html>