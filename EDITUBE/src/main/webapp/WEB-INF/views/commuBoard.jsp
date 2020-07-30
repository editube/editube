<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>커뮤니티 보드</title>

<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet" />
<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/css/sideBar.css?after" rel="stylesheet">
<link href="resources/css/commuBoard.css?after" rel="stylesheet">
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/sideBar.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var chk = "${check}";
	
	if(chk=="2"){
		alert("글 등록 성공!");
		location.reload(true);
	}
	if(chk=="3"){
		alert("글 삭제 성공!");
		location.reload(true);
	}
	
});

</script>


</head>
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
	<div class="all">
		<jsp:include page="commuNav.jsp"></jsp:include>
		<div class="ucontent">
			<div>
				<h2>자유게시판</h2>
				<!-- 나중에 입력받는걸로 바뀜 -->
			</div>
			<div class="data-area">
				<div class="title-row">
					<div class="t-bnum p-10">글번호</div>
					<div class="t-title p-60">제목</div>
					<div class="t-name p-15">작성자</div>
					<div class="t-date p-15">작성일</div>
				</div>
				<c:forEach var="cbitem" items="${cbList}">
					<div class="data-row">
						<div class="u-bnum p-10">${cbitem.cbnum}</div>
						<div class="u-title p-60">
							<a href="commuContent?cbnum=${cbitem.cbnum}"> ${cbitem.cbtitle}</a>
						</div>
						<div class="u-name p-15">${cbitem.cbnickname}</div>
						<div class="u-date p-15">${cbitem.cbdate}</div>
					</div>
				</c:forEach>
			</div>
			<div class="btn-area">
				<div class="paging">${paging}</div>
				<button class="cowr-btn" onclick="location.href='./writeCommuFrm'">글쓰기</button>
			</div>
		</div>
	</div>
	<!-- Footer -->

</body>
</html>