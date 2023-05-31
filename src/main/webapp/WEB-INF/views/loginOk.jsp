<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <%
        int checkIdPwFlag = Integer.parseInt(request.getAttribute("checkIdPwFlag").toString());

        if (checkIdPwFlag == 0) {
    %>
    <script type="text/javascript">
        alert("입력하신 아이디 또는 비밀번호가 일치하지 않습니다 ");
        history.go(-1);
    </script>
    <%
        }
    %>
    <table border="0" cellspacing="10" width="80%">
        <tr>
            <td>
                <table border="0" cellspacing="10">
                    <tr>
                        <td>
                            ${userDto.username}님 로그인 하셨습니다. 반갑습니다!<br>
                            ${userDto.userid}님의 가입일은 ${userDto.userdate}입니다.<br><br>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>