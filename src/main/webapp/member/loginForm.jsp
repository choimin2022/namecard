<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
      font-family: Arial, sans-serif;
    }

    .container {
      width: 400px;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      animation: fade-in 0.5s ease-in-out;
      border-radius: 5px;
    }

    @keyframes fade-in {
      0% {
        opacity: 0;
        transform: translateY(-20px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .container h1 {
      text-align: center;
      margin-bottom: 30px;
      color: #333;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: #555;
    }

    .form-group input {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      background-color: #f9f9f9;
      color: #333;
    }

    .form-group input[type="submit"],
    .form-group input[type="reset"],
    .form-group input[type="button"] {
      width: auto;
      padding: 8px 20px;
      color: #fff;
      background-color: #343d46;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .form-group input[type="submit"]:hover,
    .form-group input[type="reset"]:hover,
    .form-group input[type="button"]:hover {
      background-color: #000000;
    }

    .message {
      text-align: center;
      color: red;
    }
  </style>
  <script src="script/member.js"></script>
</head>
<body>
  <div class="container">
    <h1>로그인</h1>
    <form action="member.do" method="post" name="frm">
      <input type="hidden" name="command" value="login">
      <div class="form-group">
        <label for="userid">아이디</label>
        <input type="text" name="userid" id="userid" required>
      </div>
      <div class="form-group">
        <label for="pwd">비밀번호</label>
        <input type="password" name="pwd" id="pwd" required>
      </div>
      <div class="form-group">
        <input type="submit" value="로그인" onClick="return loginCheck()">
        <input type="reset" value="취소">
        <input type="button" value="회원가입" onClick="location.href='member.do?command=joinForm'">
      </div>
      <div class="message">${message}</div>
    </form>
 
