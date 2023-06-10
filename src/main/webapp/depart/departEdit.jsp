<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Depart Edit</title>
</head>
<body>
    <h1>Depart Edit</h1>
    
   <form action="member.do" method="post">
    <input type="hidden" name="command" value="departeditaction">
    <label for="name">Name:</label>
    <input type="text" name="d_name" value="${depart_member.d_name}">
    <br>
    <label for="task">Task:</label>
    <input type="text" name="d_task" value="${depart_member.d_task}">
    <br>
    <label for="address">Address:</label>
    <input type="text" name="d_address" value="${depart_member.d_address}">
    <br>
    <label for="image">Image:</label>
    <input type="text" name="d_img" value="${depart_member.d_img}">
    <br>
    
    	<label for="readonly_field1">Num:</label>
        <input type="text" name="d_num" value="${depart_member.d_num}" readonly>
        <br>
        <label for="readonly_field2">Code:</label>
        <input type="text" name="d_code" value="${depart_member.d_code}" readonly>
        <br>
        <label for="readonly_field2">Userid:</label>
        <input type="text" name="userid" value="${depart_member.userid}" readonly>
        <br>
        <label for="readonly_field2">Date:</label>
        <input type="text" name="d_date" value="${depart_member.d_date}" readonly>
        <br>
    
    <input type="submit" value="수정하기">
    
</form>
</body>
</html>