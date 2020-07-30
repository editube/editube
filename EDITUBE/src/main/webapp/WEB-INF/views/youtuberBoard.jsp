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

<link href="resources/css/sideBar.css?after" rel="stylesheet">
<link href="resources/css/commuBoard.css?after" rel="stylesheet">
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/sideBar.js"></script>
<script src="resources/js/select.js"></script>
<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

</head>
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
	</header>
	<div class="all">
		<jsp:include page="youtubeNav.jsp"></jsp:include>
		<div class="ucontent">

			<div class="ya">
				<h2 class="yt">모집게시판</h2>
				<!-- 나중에 입력받는걸로 바뀜 -->
				<div class="yb">
					<input class="tgl tgl-flip" id="cb5" type="checkbox" /><label
						class="tgl-btn" data-tg-off="건별" data-tg-on="정기" for="cb5"></label>
				</div>

  <div class="dropdown">
    <span class="selLabel">정렬</span>
    <input type="hidden" name="cd-dropdown">
    <ul class="dropdown-list">
      <li data-value="1">
        <span>작성일순</span>
      </li>
      <li data-value="2">
        <span>마감일순</span>
      </li>
    </ul>
  </div>

			</div>

			<div class="data-area">
				<div class="title-row">
					<div class="u-name p-15">작성자</div>
					<div class="u-title p-50">제목</div>
					<div class="u-price p-15">가격</div>
					<div class="u-resdate p-10">작성일</div>
					<div class="u-findate p-10">마감일</div>
				</div>

				<c:forEach var="bitem" items="${bList}">
					<div class="data-row">
						<div class="u-name p-15">${bitem.bnum}</div>
						<div class="u-title p-50">
							<a href="contents?bnum=${bitem.bnum}"> ${bitem.btitle}</a>
						</div>
						<div class="u-price p-15">${bitem.mname}</div>
						<div class="u-date p-10">${bitem.bdate}</div>
						<div class="u-date p-10">${bitem.bdate}</div>
					</div>
				</c:forEach>
			</div>
			<div class="btn-area">
				<div class="paging">${paging}</div>
				<button class="cowr-btn" onclick="location.href='./writeUFrm'">글쓰기</button>
			</div>
		</div>
	</div>
	<!-- Footer -->

</body>
</html>