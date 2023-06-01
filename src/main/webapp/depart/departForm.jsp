<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 가입</h2> '*' 표시 항목은 필수 입력 항목입니다.
	<form action=""member.do?command=departBoard" method="post" name="frm">
		<input type="hidden" name="command" value="join">
		<table>
			<tr>
				<td>이름</td>
				<td>${loginUser.name}</td>
			</tr>
			<tr>
				<td>아이디</td>
<					<td>${loginUser.userid}</td>
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
				<td>등급</td>
				<td>
					<input type="radio" name="admin" value="0" checked="checked">일반회원
					&nbsp;&nbsp;<input type="radio" name="admin" value="1">관리자
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
</body>
</html>