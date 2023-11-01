<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	
		<table class="table table-hover">
			<thead>
				<sec:authorize access="isAuthenticated()">

					<sec:authentication property="principal.mvo.email" var="authEmail" />
					<sec:authentication property="principal.mvo.nickName" var="authName" />
					<sec:authentication property="principal.mvo.regAt" var="authRegAt" />
					<sec:authentication property="principal.mvo.lastLogin" var="authLastLogin" />
					


				</sec:authorize>

				<tr>
					<th>Email</th>
					<td><input type="email" name="email" readonly="readonly" id="email" value="${authEmail }">
					
					</td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" value="55555aaazzzzzzzzzz5"
						readonly="readonly"></td>
				</tr>
				<tr>
					<th>NickName</th>
					<td><input type="text" name="NickName"  value="${authName }"></td>
				</tr>
				<tr>
					<th>RegDate</th>
					<td><input type="text" name="RegDate" readonly="readonly" value="${authRegAt}"></td>
				</tr>
				<tr>
					<th>lastLogin</th>
					<td><input type="text" name="lastLogin" readonly="readonly" value="${authLastLogin }"></td>
				</tr>



			</thead>
		</table>
			<button class="btn btn-outline-primary" type="button"><a href="/member/modipwd"> 비밀번호변경</a></button>
			<button class="btn btn-outline-primary" id="delBtn" type="button"> 회원탈퇴</button>
			



	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	document.getElementById('delBtn').addEventListener('click',()=>{
		if (!confirm("탈퇴하면 모든 정보가 사라집니다 탈퇴하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
	    } else {
	    	let mail = document.getElementById('email').value;
	    	
	    	  location.href="/member/delete/?email="+mail;
	    }
	})
</script>
</html>