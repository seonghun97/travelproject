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

	<table border ="0" cellspacing="10">
		 <form action="joinOk" method="post" name="join_frm"> 
		  		<tr>
		  			<td>아 이 디 :</td>
		  			<td><input type="text" name="userid"></td>
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
		  			<td><input type="text" name="userbirth"></td>
		  		</tr>
		  		<tr>
		  			<td>이 메 일 :</td>
		  			<td><input type="text" name="useremail"></td>
		  		</tr>
		  		<tr>
		  			<td>전화 번호 :</td>
		  			<td><input type="text" name="usermobile"></td>
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