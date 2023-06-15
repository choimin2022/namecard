<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>-->
<c:if test="${empty loginUser}">
  <jsp:forward page="member.do?command=loginForm"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Main Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 0;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .main-content {
      max-width: 800px;
      padding: 20px;
      margin: auto;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 5px;
    }

    .greeting {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    .user-info {
      margin-bottom: 20px;
    }

    .user-info p {
      margin: 5px 0;
    }

    .actions {
      text-align: center;
    }

    .actions input[type="button"] {
      margin-right: 10px;
      padding: 8px 20px;
      color: #fff;
      background-color: #343d46;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .actions input[type="button"]:hover {
      background-color: #000000;
    }

    .admin-table {
      margin-top: 20px;
      width: 100%;
      border-collapse: collapse;
    }

    .admin-table th,
    .admin-table td {
      padding: 10px;
      border: 1px solid #ccc;
      text-align: center;
    }

    .admin-table th {
      background-color: #555;
      color: #fff;
    }

    .admin-table tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    .admin-table tr:nth-child(odd) {
      background-color: #fff;
    }

    .admin-table td {
      color: #333;
    }
  </style>
  <script src="script/member.js"></script>
</head>
<body>
  <div class="container">
    <div class="main-content">
      <h1 class="greeting">안녕하세요, ${loginUser.name} (${loginUser.userid})님!</h1>
      <div class="user-info">
        <p>email: ${loginUser.email}</p>
        <p>phone: ${loginUser.phone}</p>
      </div>
      <div class="actions">
        <input type="button" value="로그아웃" onClick="location.href='member.do?command=logout'">
        <input type="button" value="회원정보 변경" onClick="location.href='member.do?command=updateForm'">
        <input type="button" value="회원탈퇴" onClick="deleteMember()">
        <input type="button" value="명함 등록" onClick="location.href='member.do?command=departmember'">
        <input type="button" value="명함 목록" onClick="location.href='member.do?command=departlistaction'">
      </div>
      <c:if test="${loginUser.admin==1}">
        <table class="admin-table">
          <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>등급</th>
            <th>등급 변경</th>
          </tr>
          <c:forEach items="${mList}" var="member">
            <tr>
              <td>${member.userid}</td>
              <td>${member.name}</td>
              <td>${member.phone}</td>
              <td>${member.email}</td>
              <td>
                <c:if test="${member.admin==1}">관리자</c:if>
                <c:if test="${member.admin==0}">일반회원</c:if>
              </td>
              <td>
                <c:if test="${loginUser.userid != member.userid}">
                  <c:if test="${member.admin==0}">
                    <input type="button" value="관리자로 변경" onClick="location.href='member.do?command=editAdmin&userid=${member.userid}'">
                  </c:if>
                  <c:if test="${member.admin==1}">
                    <input type="button" value="일반 회원으로 변경" onClick="location.href='member.do?command=editAdmin&userid=${member.userid}'">
                  </c:if>
                </c:if>
              </td>
            </tr>
          </c:forEach>
        </table>
      </c:if>
    </div>
  </div>
</body>
</html>
