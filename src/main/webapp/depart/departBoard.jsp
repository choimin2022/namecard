<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Depart Board</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #F2F2F2;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
        }

        .card {
            width: 300px;
            height: 180px;
            margin: 10px;
            background-color: #FFFFFF;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card h3 {
            margin: 0;
            font-size: 18px;
            font-weight: bold;
            color: #333333;
        }

        .card p {
            margin: 0;
            font-size: 14px;
            color: #666666;
        }

        .card button {
            width: 100px;
            padding: 8px;
            background-color: #343d46;
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .pagination {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .pagination a {
            margin: 0 5px;
            padding: 8px 12px;
            font-size: 14px;
            color: #333333;
            text-decoration: none;
            border: 1px solid #CCCCCC;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .pagination a:hover {
            background-color: #343d46;
            color: #FFFFFF;
        }

        .pagination .current-page {
            font-weight: bold;
            color: #FFFFFF;
            background-color: #343d46;
        }
    </style>
</head>
<body>
    <div class="container">
        <c:forEach var="depart_member" items="${memberList}" varStatus="status">
            <div class="card">
                <h3>${depart_member.d_name}</h3>
                <div class="card-text">
                    <p><strong>직급:</strong> ${depart_member.d_task}</p>
                    <p><strong>이름:</strong> ${depart_member.name}</p>
                    <p><strong>이미지:</strong> ${depart_member.d_img}</p>
                    <p><strong>날짜:</strong> ${depart_member.d_date}</p>
                </div>
                <button onclick="location.href='member.do?command=departdetail&userid=${depart_member.userid}'">상세 정보</button>
            </div>
        </c:forEach>
    </div>
    <div class="pagination">
        <c:choose>
            <c:when test="${pageInfo.maxPage > 1}">
                <c:if test="${pageInfo.startPage > 0 and pageInfo.page != 1}">
                    <a href="?command=departlistaction&page=1">처음</a>
                    <a href="?command=departlistaction&page=${pageInfo.page - 1}">이전</a>
                </c:if>
                <c:forEach var="pageNum" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                    <c:if test="${pageNum == pageInfo.page}">
                        <a class="current-page" href="?command=departlistaction&page=${pageNum}">${pageNum}</a>
                    </c:if>
                    <c:if test="${pageNum != pageInfo.page}">
                        <a href="?command=departlistaction&page=${pageNum}">${pageNum}</a>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.endPage <= pageInfo.maxPage and pageInfo.page != pageInfo.maxPage}">
                    <a href="?command=departlistaction&page=${pageInfo.page + 1}">다음</a>
                    <a href="?command=departlistaction&page=${pageInfo.maxPage}">마지막</a>
                </c:if>
            </c:when>
        </c:choose>
    </div>
</body>
</html>
