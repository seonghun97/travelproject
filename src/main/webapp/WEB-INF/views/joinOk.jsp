<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 완료</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        
        h2 {
            text-align: center;
            margin-top: 0;
        }
        
        .message {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .btn-login {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            float : right;
        }
        
        .btn-login:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
            int checkId = Integer.parseInt(request.getAttribute("checkId").toString());
            
            if (checkId == 1) { 
        %>
        <script type="text/javascript">
            alert("입력하신 아이디는 이미 가입된 아이디입니다. 다시 입력해 주세요.");
            history.go(-1);
        </script>
        <% } %>
        <h2>회원가입 완료</h2>
        <div class="message">
            ${userName }님 회원가입이 완료되었습니다.<br>
            가입하신 아이디는 ${userId }입니다.
        </div>
        <div class="text-center">
            <a href="login" class="btn-login">로그인 바로가기</a>
        </div>
    </div>
</body>
</html>