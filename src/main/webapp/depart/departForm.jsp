<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Become a Member</title>
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
			width: 400px;
			padding: 20px;
			background-color: #fff;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			border-radius: 5px;
		}

		.form-container h2 {
			text-align: center;
			margin-bottom: 20px;
		}

		.form-container p {
			text-align: center;
			margin-bottom: 20px;
			color: #888;
		}

		.form-container table {
			width: 100%;
		}

		.form-container table td {
			padding: 5px;
		}

		.form-container table td input[type="text"] {
			width: 100%;
			padding: 8px;
			border: 1px solid #ccc;
			border-radius: 4px;
		}

		.form-container table td input[type="submit"],
		.form-container table td input[type="reset"],
		.form-container table td input[type="button"] {
			padding: 8px 16px;
			background-color: #343d46;
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
</head>
<body>
	<div class="container">
		<div class="form-container">
			<h2>명함 등록</h2>
			<p>'*' 표시 항목은 필수 입력 항목입니다.</p>
			<form action="member.do" method="post" name="businesscard">
				<input type="hidden" name="command" value="departaction">
				<table>
					<tr>
						<td>코드</td>
						<td><input name="d_code" type="text"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${loginUser.name}</td>
					</tr>
					<tr>
						<td>부서</td>
						<td><input name="d_name" type="text"></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${loginUser.userid}</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${loginUser.email}</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>${loginUser.phone}</td>
					</tr>
					<tr>
						<td>직급</td>
						<td><input name="d_task" type="text"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input name="d_address" type="text"></td>
					</tr>
					<tr>
						<td>이미지</td>
						<td><input type="text" name="d_img"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="명함 등록">
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
