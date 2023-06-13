<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Depart Board</title>
<link rel="stylesheet" type="text/css" href="/test/css//departBoard/Board.css">

<style type="text/css">
@charset "UTF-8";

        body {
            font-family: Arial, sans-serif;
            background-color: #F2F2F2;
            margin: 0;
            padding: 0;
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
            margin-right: 20px;
            margin-bottom: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card h3 {
            margin: 0;
        }

        .card p {
            margin: 0;
        }

        .card button {
            width: 100px;
            padding: 8px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
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
                    <p><strong>이미지:</strong> ${depart_member.d_img}</p>
                    <p><strong>날짜:</strong> ${depart_member.d_date}</p>
                    <!--원래는 d_num으로 불러오지만 계정에 따라 불러오는 방식을 다르게 할려면 userid를 불러와야 함 -->
                    <input type="button" value="상세보기" onclick="location.href='member.do?command=departdetail&userid=${depart_member.userid}'">
                </div>
            </div>

        </c:forEach>
    </div>
<c:choose>
    <c:when test="${pageInfo.maxPage > 1}">
        <div>
            <c:if test="${pageInfo.startPage > 0}">
                <a href="?command=departlistaction&page=1">처음</a>
                <a href="?command=departlistaction&page=${pageInfo.page - 1}">이전</a>
            </c:if>
            

            <c:forEach var="pageNum" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                <c:if test="${pageNum == pageInfo.page}">
                    <b>${pageNum}</b>
                </c:if>
                <c:if test="${pageNum != pageInfo.page}">
                    <a href="?command=departlistaction&page=${pageNum}">${pageNum}</a>
                
               
</c:if>
        </c:forEach>
            <c:if test="${pageInfo.startPage <= pageInfo.page}">
					<a href="?command=departlistaction&page=${pageInfo.page + 1}">다음</a>
            </c:if>
		<c:if test="${pageInfo.endPage <= pageInfo.maxPage}">        
		<!--  <a href="?command=departlistaction&page=${pageInfo.endPage + 1}">다음</a>-->
		<a href="?command=departlistaction&page=${pageInfo.maxPage}">마지막</a>
   
</c:if>
        </div>
            </c:when>
        </c:choose>
    </div>
</body>
</html>
