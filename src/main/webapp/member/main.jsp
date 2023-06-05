<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>-->
<c:if test="${empty loginUser}">
	<jsp:forward page="member.do?command=loginForm"/>
</c:if>
<c:if test="${empty departCheck}">
	<jsp:forward page="member.do?command=departForm"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main.jsp</title>
	<script src="script/member.js"></script>
</head>
<body>
		<table>
		<tr><label>명함정보</label></tr>
				
		
		<tr>
			<td>글넘버</td>
			<td>아이디</td>
			<td>이름</td>
			<td>직급</td>
			<td>주소</td>
			<td>등록날짜</td>
		</tr>
		
		<tr>
			<td>${loginUser.d_code}</td>
			<td>${loginUser.userid}</td>
			<td>${loginUser.d_name}</td>
			<td>${loginUser.d_task}</td>
			<td>${loginUser.d_date}</td>
			<td>${loginUser.d_adr}<td>
		</tr>
		
	
	
	
	</table>
	

	<table>
		<tr><td>안녕하세요. ${loginUser.name}(${loginUser.userid})님</td></tr>
		<tr><td>email : ${loginUser.email}</td></tr>
		<tr><td>phone : ${loginUser.phone}</td></tr>
		<tr>
			<td>
				<input type="button" value="로그아웃" 
				       onClick="location.href='member.do?command=logout'">
				<input type="button" value="회원정보변경" 
					   onClick="location.href='member.do?command=updateForm'">
				<input type="button" value="회원 탈퇴" 
					   onClick="deleteMember();">
				<input type="button" value="명함등록" 
					   onClick="location.href='member.do?command=departForm'">
			</td>
		</tr>
	</table>
	<br><br>
		<c:if test="${loginUser.admin==1}">
		<table align="left" width="800" bgcolor="black" cellspacing="1">
			<tr bgcolor="white">
				<th>아이디</th><th>이름</th><th>전화번호</th>
				<th>이메일</th><th>등급</th><th>등급변경</th>
			</tr>
			<c:forEach items="${mList}" var="member">
				<tr bgcolor="white" align="center">
					<td>${member.userid}</td><td>${member.name}</td>
					<td>${member.phone}</td><td>${member.email}</td>
					<td>
						<c:if test="${member.admin==1}">관리자</c:if>
						<c:if test="${member.admin==0}">일반회원</c:if>
					</td>
					<td width="180">
						<c:if test="${loginUser.userid != member.userid}">
							<c:if test="${member.admin==0}">
								<input type="button" value="관리자로 변경"
								onClick="location.href='member.do?command=editAdmin&userid=${member.userid}'">
							</c:if>
							<c:if test="${member.admin==1}">
								<input type="button" value="일반회원으로 변경"
								onClick="location.href='member.do?command=editAdmin&userid=${member.userid}'">
							</c:if>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>