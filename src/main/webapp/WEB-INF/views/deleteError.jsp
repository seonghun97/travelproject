<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cannot Delete Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }
        
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        
        p {
            margin-bottom: 10px;
        }
        
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원탈퇴를 할수없습니다</h1>
        <p>회원탈퇴를 위해서는 현재 로그인하신 아이디로 예약된 숙소가 없어야만 회원탈퇴가가능합니다</p>
        <p>회원탈퇴를 위해 숙소예약을 먼져 취소하시고 다시 탈퇴부탁드리겠습니다</p>
        <a href="/mypage" class="button">마이페이지</a>
    </div>
</body>
</html>