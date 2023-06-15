<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Depart Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F2F2F2;
            margin: 0;
            padding: 20px;
        }

        .business-card {
            width: 300px;
            background-color: #FFFFFF;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 0 auto;
            position: absolute;
 		    top: 50%;
 		    left: 50%;
 	 	    transform: translate(-50%, -50%);
        }

        .business-card h1 {
            font-size: 24px;
            font-weight: bold;
            margin: 0;
            color: #333333;
            text-align: center;
            margin-bottom: 10px;
        }

        .business-card table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .business-card th,
        .business-card td {
            padding: 8px;
        }

        .business-card th {
            text-align: left;
            font-weight: bold;
            color: #666666;
        }

        .business-card td {
            color: #333333;
        }

        .business-card .profile-picture {
            width: 100%;
            text-align: center;
            margin-bottom: 20px;
        }

        .business-card .profile-picture img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
        }

        .business-card button {
            display: block;
            width: 100%;
            padding: 8px;
            background-color: #343d46;
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .business-card button:hover {
            background-color: #000000;
        }
        
    </style>
</head>
<body>
    <div class="business-card">
        <h1>세부 정보</h1>
        
        <div class="profile-picture">
            <img src="path/to/profile-picture.jpg" alt="Profile Picture">
        </div>
        
        <table>
            <tr>
                <th>이름</th>
                <td>${depart_member.name}</td>
            </tr>
            <tr>
                <th>부서</th>
                <td>${depart_member.d_name}</td>
            </tr>   
            <tr>
                <th>아이디</th>
                <td>${depart_member.userid}</td>
            </tr>
            <tr>
                <th>직급</th>
                <td>${depart_member.d_task}</td>
            </tr>
            <tr>
                <th>주소</th>
                <td>${depart_member.d_address}</td>
            </tr>
            <tr>
                <th>이미지</th>
                <td>${depart_member.d_img}</td>
            </tr>
            <tr>
                <th>날짜</th>
                <td>${depart_member.d_date}</td>
            </tr>
        </table>
        
        <button onclick="location.href='member.do?command=departedit&userid=${depart_member.userid}'">명함 수정</button>
        <button onclick="location.href='member.do?command=departdel&userid=${depart_member.userid}'">명함 삭제</button>
    </div>
</body>
</html>
