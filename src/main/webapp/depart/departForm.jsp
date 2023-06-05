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
				<td>부서명</td>
				<td>${loginUser.phone}</td>
			</tr>
			<tr>
				<td>직급</td>
				<td>${loginUser.phone}</td>
			</tr>
			<tr>
				<td>주소</td>
				<tr>
					<td><input name=address type="text"></td>
				</tr>
			</tr>
			<tr>
			<tr>
				<td>외부사용자 여부</td>
				<td>
					외부사용자:<input type="radio">
					내부사용자:<input type="radio">
				</td>
				
				<td>공개여부</td>
				<td>
					공개:<input type="radio">
					비공개:<input type="radio">
				</td>
			</tr>
			<tr>
				<td>비고</td>
				<td><input type="text"></td>
			</tr>
				<td colspan="2" align="center">
					<input type="submit" value="명함등록" onclick="return joinCheck()">
					<input type="reset" value="취소">
					<input type="button" value="목록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>