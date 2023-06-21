<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            text-align: center;
            margin-top: 50px;
        }

        p {
            text-align: center;
            font-size: 18px;
            margin-bottom: 20px;
        }

        a {
            display: block;
            text-align: center;
            font-size: 16px;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <h1>Error</h1>
    <p>${error }</p>
    <a href="login">로그인</a>
</body>
</html>