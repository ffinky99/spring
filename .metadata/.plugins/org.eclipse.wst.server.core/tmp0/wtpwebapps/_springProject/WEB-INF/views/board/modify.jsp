<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/brddetail.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<jsp:include page="../common/nav.jsp"></jsp:include>
		<form action="/board/modify?bno=${bdto.bvo.bno}" method="post" enctype="multipart/form-data">
			<input type="hidden" name="regAt" value="${bdto.bvo.regAt}">
		<div id="box">
		
		<div id="title"> <input name="title" value="${bdto.bvo.title }"> </div>
	
		<div id="writer"><input name="writer" value="${bdto.bvo.writer }" readonly="readonly"></div>
		<br>
		<c:forEach items="${bdto.flist }" var="flist" varStatus="i">
		<div  data-uuid="${flist.uuid}" id="img${i.index }">
			<img  alt="어쩌라고" src="/upload/${fn:replace(flist.saveDir,'\\', '/')}/${flist.uuid}_th_${flist.fileName}"> 
		
			<button type="button" id="delBtn${i.index}" class="btn btn-outline-danger" onClick="del(${i.index})">X</button>
			<br>
			</div>
			
			</c:forEach>
		<div id="content">  <textarea name="content" rows="3" cols="30">${bdto.bvo.content }</textarea>   </div>
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
	
		<button type="submit" id="btnSave">수정</button>
		</form>
		
		<a href="/board/delete?bno=${bdto.bvo.bno }">삭제</a>
		</div>
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script type="text/javascript" src="/resources/js/BoardRegister.js"></script>
		<script type="text/javascript" src="/resources/js/BoardModify.js"></script>
	</div>
</body>
</html>