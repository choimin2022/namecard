<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Join Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .form-container {
      max-width: 400px;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 5px;
    }

    .form-container h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    .form-container table {
      width: 100%;
    }

    .form-container table td {
      padding: 5px;
    }

    .form-container table td input[type="text"],
    .form-container table td input[type="password"],
    .form-container table td input[type="email"] {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .form-container table td input[type="radio"] {
      margin-right: 5px;
    }

    .form-container table td input[type="button"],
    .form-container table td input[type="submit"],
    .form-container table td input[type="reset"] {
      padding: 8px 16px;
      background-color: #343d46;
      border: none;
      border-radius: 4px;
      color: #fff;
      cursor: pointer;
      margin-top: 5px;
    }

    .form-container table td input[type="button"]:hover,
    .form-container table td input[type="submit"]:hover,
    .form-container table td input[type="reset"]:hover {
      background-color: #000000;
    }

    .form-container table td.error {
      color: red;
    }
  </style>
  <script src="script/member.js"></script>
</head>
<body>
  <div class="container">
    <div class="form-container">
      <h2>회원가입</h2>
      <p>'*' 표시 항목은 필수 입력 항목입니다.</p>
      <form action="member.do" method="post" name="frm">
        <input type="hidden" name="command" value="join">
        <table>
          <tr>
            <td>이름</td>
            <td><input type="text" name="name" size="20"> *</td>
          </tr>
          <tr>
            <td>아이디</td>
            <td>
              <input type="text" name="userid" size="20"> *
              <input type="button" value="중복 체크" onClick="idCheck();">
              <input type="hidden" name="reid" value="">
            </td>
          </tr>
          <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pwd" size="20"> *</td>
          </tr>
          <tr>
            <td>비밀번호 확인</td>
            <td><input type="password" name="pwd_check" size="20"> *</td>
          </tr>
          <tr>
            <td>이메일</td>
            <td><input type="text" name="email" size="20"></td>
          </tr>
          <tr>
            <td>전화번호</td>
            <td><input type="text" name="phone" size="20"></td>
          </tr>
          <tr>
            <td>등급</td>
            <td>
              <input type="radio" name="admin" value="0" checked="checked">일반회원
              <input type="radio" name="admin" value="1">관리자
            </td>
          </tr>
          <tr>
            <td colspan="2" align="center">
              <input type="submit" value="회원가입" onclick="return joinCheck()">
              <input type="reset" value="취소">
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</body>
</html>
