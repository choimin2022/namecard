<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Form</title>
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
		.form-container table td input[type="password"] {
			width: 100%;
			padding: 8px;
			border: 1px solid #ccc;
			border-radius: 4px;
		}

		.form-container table td input[type="radio"] {
			margin-right: 5px;
		}

		.form-container table td input[type="submit"],
		.form-container table td input[type="reset"],
		.form-container table td input[type="button"] {
			padding: 8px 16px;
			background-color:#343d46;
			border: none;
			border-radius: 4px;
			color: #fff;
			cursor: pointer;
		}

		.form-container table td input[type="submit"]:hover,
		.form-container table td input[type="reset"]:hover,
		.form-container table td input[type="button"]:hover {
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
			<h2>회원 정보 수정</h2>
			<form action="member.do" method="post" name="frm">
				<input type="hidden" name="command" value="update">
				<table>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" value="${loginUser.name}"></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${loginUser.userid}<input type="hidden" name="userid" value="${loginUser.userid}"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="pwd_check"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" value="${loginUser.email}"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="phone" value="${loginUser.phone}"></td>
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
							<input type="submit" value="변경" onClick="return updateCheck()">
							<input type="reset" value="취소">
							<input type="button" value="메인" onClick="location.href='member.do?command=main'">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
