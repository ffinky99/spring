<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
	<table class="table table-striped">
	

		<tr>
			<th scope="col">email</th>
			<th scope="col">닉네임</th>
			<th scope="col">가입날짜</th>

			<th scope="col">마지막 로그인</th>
		</tr>

		<c:forEach items="${list}" var="list">
			<tr>

			
				<td>${list.email}</td>
			
				<td>${list.nickName }</td>
				<td>${list.regAt }</td>
				<td>${list.lastLogin }</td>
				
			</tr>
			<br>
		</c:forEach>
	</table>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>