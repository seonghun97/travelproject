<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 예약 완료</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    .container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
        font-size: 24px;
        text-align: center;
        margin-bottom: 20px;
    }

    .message {
        text-align: center;
        font-size: 18px;
        margin-bottom: 20px;
    }

    .link {
        text-align: center;
        font-size: 16px;
    }

    .link a {
        color: #4CAF50;
        text-decoration: none;
    }
</style>
<script>
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }

    window.onload = function() {
        if (window.history && window.history.pushState) {
            window.history.pushState('forward', null, './#');
            window.onpopstate = function() {
                if (confirm('페이지를 떠나시겠습니까? 예약 확인 페이지로 돌아가시려면 확인을 누르세요.')) {
                    location.href = 'mypage';
                } else {
                    window.history.pushState('forward', null, './#');
                }
            };
        }
    };
</script>
</head>
<body>
<%@ include file="include/header.jsp" %><br><br>
<div class="container">
    <h1>숙소 예약 완료</h1>
    <div class="message">
        숙소 예약이 완료되었습니다.
    </div>
    <div class="link">
        <a href="mypage">예약 확인하러 가기</a>
    </div>
</div>
</body>
</html>