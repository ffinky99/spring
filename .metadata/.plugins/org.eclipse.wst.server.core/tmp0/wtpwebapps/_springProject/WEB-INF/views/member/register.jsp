<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
		<jsp:include page="../common/nav.jsp"></jsp:include>
	<h3>회원가입</h3>
	<form action="/member/register" method="post">
	<div class="mb-3">
		Email : <input type="email" name="email" placeholder="email"><br>
	</div>
	<div class="mb-3">
		Password : <input type="password" name="pwd" placeholder="비밀번호"><br>
	</div>
	<div class="mb-3">
		Name : <input type="text" name="nickName" placeholder="닉네임"><br>
	</div>

		<button type="submit">회원가입</button>
	</form>


<jsp:include page="../common/footer.jsp"></jsp:include>


</body>
</html>