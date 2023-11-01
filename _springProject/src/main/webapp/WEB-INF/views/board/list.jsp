<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/brdlist.css" rel="stylesheet" type="text/css" />
</head>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<body>
	<div id="board_area">
		<h1>자유게시판</h1>
		<h4>자유롭게 글을 쓸 수 있는 게시판입니다.</h4>

		<!-- 검색 라인 -->

		<div class="input-group mb-3">
			<form class="d-flex" role="search" action="/board/list" method="get">
				<c:set value="${ph.pgvo.type }" var="typed"></c:set>
				<select name="type" class="form-select" id="inputGroupSelect01">
					<option ${typed eq null ? 'selected' : '' }>Choose...</option>
					<option value="t" ${typed eq 't' ? 'selected' : '' }>Title</option>
					<option value="w" ${typed eq 'w' ? 'selected' : '' }>Writer</option>
					<option value="c" ${typed eq 'c' ? 'selected' : '' }>Content</option>
					<option value="tw" ${typed eq 'tw' ? 'selected' : '' }>Title
						or Writer</option>
					<option value="tc" ${typed eq 'tc' ? 'selected' : '' }>Title
						or Content</option>
					<option value="cw" ${typed eq 'cw' ? 'selected' : '' }>Content
						or Writer</option>
					<option value="twc" ${typed eq 'twc' ? 'selected' : '' }>all</option>
				</select> <input class="form-control me-2" name="keyword"
					value="${ph.pgvo.keyword }" type="search" placeholder="Search"
					aria-label="Search"> <input type="hidden" name="pageNo"
					value="1"> <input type="hidden" name="qty"
					value="${ph.pgvo.qty }">
				<button class="btn btn-outline-success" type="submit">
				Search
				<span
					class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
					${ph.totalCount } <span class="visually-hidden">unread
						messages</span>
				</span>
				</button>
				
			</form>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>

					<th scope="col">작성자</th>
					<th scope="col">제목</th>
					<th scope="col">작성날짜</th>

					<th scope="col">댓글</th>
					<th scope="col">조회</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>

						<th scope="row"><a href="/board/detail?bno=${list.bno }">${list.bno }</a></th>

						<td>${list.writer }</td>
						<td><a href="/board/detail?bno=${list.bno }">${list.title }</a></td>
						<td>${list.regAt }</td>
						<td>${list.cmtQty }</td>
						<td>${list.readCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 페이징라인 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<!-- 이전 -->
				<li class="page-item ${(ph.prev eq false) ? 'disabled' : '' }">
				<a class="page-link"
					href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
					<li class="page-item"><a class="page-link"
						href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}">${i}</a></li>
				</c:forEach>
				<!-- 다음 -->
				<li class="page-item ${(ph.next eq false) ? 'disabled' : ''}"><a
					class="page-link"
					href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>

		<div id="write_btn">
			<a href="/board/register"><button>글쓰기</button></a>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>