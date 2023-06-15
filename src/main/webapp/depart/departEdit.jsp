<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Depart Edit</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F2F2F2;
            margin: 0;
            padding: 20px;
        }

        .edit-form {
            width: 400px;
            background-color: #FFFFFF;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 0 auto;
        }

        .edit-form h1 {
            font-size: 24px;
            font-weight: bold;
            margin: 0;
            color: #333333;
            text-align: center;
            margin-bottom: 20px;
        }

        .edit-form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #666666;
        }

        .edit-form input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #CCCCCC;
            border-radius: 4px;
            font-size: 14px;
            margin-bottom: 16px;
        }

        .edit-form input[type="submit"] {
            width: 100%;
            padding: 8px;
            background-color: #343d46;
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .edit-form input[type="submit"]:hover {
            background-color: #000000;
        }
    </style>
</head>
<body>
    <div class="edit-form">
        <h1>명함 수정</h1>

        <form action="member.do" method="post">
            <input type="hidden" name="command" value="departeditaction">

            <label for="name">이름:</label>
            <input type="text" name="d_name" value="${depart_member.d_name}">

            <label for="task">직급:</label>
            <input type="text" name="d_task" value="${depart_member.d_task}">

            <label for="address">주소:</label>
            <input type="text" name="d_address" value="${depart_member.d_address}">

            <label for="image">이미지:</label>
            <input type="text" name="d_img" value="${depart_member.d_img}">

            <label for="readonly_field1">Num:</label>
            <input type="text" name="d_num" value="${depart_member.d_num}" readonly>

            <label for="readonly_field2">Code:</label>
            <input type="text" name="d_code" value="${depart_member.d_code}" readonly>

            <label for="readonly_field2">아이디:</label>
            <input type="text" name="userid" value="${depart_member.userid}" readonly>

            <label for="readonly_field2">날짜:</label>
            <input type="text" name="d_date" value="${depart_member.d_date}" readonly>

            <input type="submit" value="수정하기">
        </form>
    </div>
</body>
</html>
