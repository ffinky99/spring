<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<jsp:include page="../common/nav.jsp"></jsp:include>
	<h3>로그인</h3>
	<form action="/member/login" method="post">
	<div class="mb-3">
		Email : <input type="email" name="email" placeholder="email"><br>
	</div>
	<div class="mb-3">
		Password : <input type="password" name="pwd" placeholder="비밀번호"><br>
	</div>
	
	<c:if test="${not empty param.errMsg}">
		<div class="text-danger mb-3">
		<c:choose>
			<c:when test="${param.errMsg eq 'Bad credentials'}">
				<c:set var="errText" value="이메일 & 비밀번호가 일치하지 않습니다."></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="errText" value="이메일을 확인해주세요.">
					
				</c:set>
			</c:otherwise>
		</c:choose>
		${errText}
		</div>
	</c:if>
		<button type="submit">로그인</button>
	</form>


<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>