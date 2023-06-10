<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Depart Details</title>
</head>
<body>
    <h1>Depart Details</h1>
    
    <table>
        <tr>
            <th>Num</th>
            <td>${depart_member.d_num}</td>
        </tr>
        <tr>
            <th>Name</th>
            <td>${depart_member.d_name}</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>${depart_member.d_code}</td>
        </tr>
        <tr>
            <th>UserID</th>
            <td>${depart_member.userid}</td>
        </tr>
        <tr>
            <th>Task</th>
            <td>${depart_member.d_task}</td>
        </tr>
        <tr>
            <th>Address</th>
            <td>${depart_member.d_address}</td>
        </tr>
        <tr>
            <th>Image</th>
            <td>${depart_member.d_img}</td>
        </tr>
        <tr>
            <th>Date</th>
            <td>${depart_member.d_date}</td>
        </tr>
    </table>
  	<input type="button" value="명함 수정하기" 
	 onClick="location.href='member.do?command=departedit&userid=${depart_member.userid}'">

    <!-- 명함 삭제하기 버튼 -->
    <input type="button" value="명함 삭제하기" 
	 onClick="location.href='member.do?command=departdel&userid=${depart_member.userid}'">

</body>
</html>