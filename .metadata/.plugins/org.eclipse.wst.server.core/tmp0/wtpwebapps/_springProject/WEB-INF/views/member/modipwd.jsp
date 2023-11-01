<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authorize access="isAuthenticated()">

		<sec:authentication property="principal.mvo.email" var="authEmail" />
	</sec:authorize>
	<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<h3>비밀번호 변경</h3>
	<form action="modipwd" method="post">
		<input type="hidden" name="email" value="${authEmail}" > 
		<input type="text" name="pwd">
		<button type="submit">수정</button>
	</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>