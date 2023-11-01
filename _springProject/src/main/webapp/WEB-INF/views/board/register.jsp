<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
</head>
<body>
<sec:authentication property="principal.mvo.email" var="authEmail"/>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
	<article>
		<div class="container" role="main">
			<h2>board Form</h2>
			<form name="form" id="form" role="form" method="post"
				action="/board/register" enctype="multipart/form-data">
				<div class="mb-3">
					<label for="t">제목</label> <input type="text"
						class="form-control" name="title" id="t"
						placeholder="제목을 입력해 주세요" required>
				</div>
				<div class="mb-3">
					<label for="w">작성자</label> <input type="text"
						class="form-control" name="writer" id="w" value="${authEmail}" readonly="readonly" >
				</div>
				<div class="mb-3">
					<label for="c">내용</label>
					<textarea class="form-control" rows="5" id="c" name="content"
						placeholder="내용을 입력해 주세요" required></textarea>
				</div>
			<div>
			<!-- 파일 업로드 -->
					<div class="mb-3">
					<input type="file"
						class="form-control" name="files" id="files" style="display:none;"
						multiple="multiple">
				</div>
					<div class="mb-3" id="fileZone"></div>
						<!-- input button triger 용도의 button -->
						<button type="button" id="trigger" class="btn btn-outline-primary">File Upload</button>
			<!-- 파일 업로드 끝 -->
			
				<button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
			</div>
			</form>
		</div>
	</article>
	<script type="text/javascript" src="/resources/js/BoardRegister.js"></script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>