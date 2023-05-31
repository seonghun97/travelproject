<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		int checkId = Integer.parseInt(request.getAttribute("checkId").toString());
		
		if(checkId == 1) {
	%>
		<script type="text/javascript">
			alert("입력하신 아이디는 이미 가입된 아이디 입니다. 다시 입력해 주세요.");
			history.go(-1);
		</script>
	<%
		}
	%>
	<center>
	<div>
	<table border="0" cellspacing="20" width="75%" >
		<table border="0" cellspacing="10" width="80%">
			<tr>
				<td>
		  			<table border ="0" cellspacing="10">
		  				<tr>
		  					<td>
							${userName }님 회원가입이 되셨습니다<br>
							가입하신 아이디는 ${userId }입니다.<br><br>
							<input type ="button" value="로그인 바로가기" onclick="script:window.location.href='login'">
							</td>
		  				</tr>
		  					</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</div>
	</center>
</body>
</html>