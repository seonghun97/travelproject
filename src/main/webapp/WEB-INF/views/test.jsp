<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accommodation List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }

        h3 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            margin-bottom: 40px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
        }

        th {
            background-color: #f5f5f5;
        }

        img {
            max-width: 100%;
            height: auto;
        }
        
        .filter-container {
            margin-bottom: 20px;
        }
        
        .search-container {
            display: flex;
            align-items: center;
        }
        
        .search-container input[type="text"] {
            width: 200px;
            height: 30px;
            padding: 5px;
        }
        
        .filter-container .price-slider {
            width: 300px;
            margin-left: 20px;
        }
        
        .filter-container .price-slider input[type="range"] {
            width: 100%;
        }
        
        .filter-container .price-slider .values {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="filter-container">
        <div class="search-container">
            <label for="city">도시 검색:</label>
            <input type="text" id="city" name="city">
        </div>
        
        <div class="price-slider">
            <label for="price">1박 요금:</label>
            <input type="range" id="price" name="price" min="0" max="100" step="1">
            <div class="values">
                <span>0</span>
                <span>100</span>
            </div>
        </div>
    </div>
    
    <h3>숙소 목록</h3>
    <table>
        <thead>
            <tr>
                <th>숙소 이름</th>
                <th>가격</th>
                <th>사진</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="accommodation" items="${accommodationList}">
                <tr>
                    <td>${accommodation.name}</td>
                    <td>${accommodation.price}</td>
                    <td><img src="${accommodation.image}" alt="숙소 사진"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <script>
        // 필터링에 사용할 JavaScript 코드 작성
        // 도시 검색, 1박 요금 필터링 등을 구현할 수 있습니다.
    </script>
    <%@ include file="include/footer.jsp" %>
</body>
</html>