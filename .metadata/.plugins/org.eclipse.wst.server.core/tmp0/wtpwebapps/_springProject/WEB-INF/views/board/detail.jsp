<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/brddetail.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<sec:authorize access="isAuthenticated()">
		<!-- 현재 인증한 사용자의 정보를 가져와서 해당 권한이 있는 케이스를 open -->
		<!-- 사용자 정보는 , principal -->
		<sec:authentication property="principal.mvo.email" var="authEmail" />

		<c:choose>
			<c:when
				test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_USER')).get() }">


			</c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>
	</sec:authorize>
	<div>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<jsp:include page="../common/nav.jsp"></jsp:include>

		<div id="box">
			<div id="title">${bdto.bvo.title }</div>

			<div id="writer">${bdto.bvo.writer }|${btdo.bvo.regAt }</div>
			<br>
			<c:forEach items="${bdto.flist }" var="flist">

				<img alt="어쩌라고"
					src="/upload/${fn:replace(flist.saveDir,'\\', '/')}/${flist.uuid}_${flist.fileName}">
				<br>
			</c:forEach>
			<div id="content">${bdto.bvo.content }</div>

			<c:if test="${bdto.bvo.writer eq authEmail }">
				<a href="/board/modify?bno=${bdto.bvo.bno }">수정</a>
				<a href="/board/delete?bno=${bdto.bvo.bno }">삭제</a>
			</c:if>
		</div>

		<!-- 댓글 구역 -->
		<div>
			<!-- 댓글 등록 라인 -->
			<div class="input-group mb-3">



				<span class="input-group-text" id="cmtWriter"> <c:if
						test="${authEmail ne null}">${authEmail }</c:if> <c:if
						test="${authEmail eq null}">비회원</c:if>
				</span> <input type="text" class="form-control" placeholder="username"
					aria-label="CommentContent" aria-describedby="basic-addon1"
					id="cmtText">
				<button class="btn btn-success" id="cmtPostBtn">post</button>
			</div>


			<!-- 댓글 표시라인 -->
			<ul class="list-group list-group-flush" id="cmtListArea">
				<li class="list-group-item">
					<div class="mb-3">
						<div class="fw-bold">writer</div>
						content
					</div>
					<button type="button" class="btn btn-primary"
						style="-bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;"
						id="modBtn">수정</button>
					<button type="button" class="btn btn-primary"
						style="-bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;"
						id="delBtn">삭제</button> <span
					class="badge rounded-pill text-bg-secondary">regAt</span>

				</li>

			</ul>

			<!-- modal창 -->
			<div class="modal" id="myModal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Modal title</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>Modal body text goes here.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 댓글 페이징 라인 -->
			<div>
				<div>
					<button type="button" id="moreBtn" data-page="1"
						class="btn btn-outline-dark" style="visibility: hidden">More</button>
				</div>

			</div>


		</div>
	</div>
	<script>
		let email = `<c:out value="${authEmail}"/>`;
		let bnoVal = `<c:out value="${bdto.bvo.bno}"/>`;
		console.log(bnoVal);
	</script>
	<script type="text/javascript" src="/resources/js/BoardComment.js"></script>
	<script type="text/javascript">
		spreadCmtList(bnoVal);
	</script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>