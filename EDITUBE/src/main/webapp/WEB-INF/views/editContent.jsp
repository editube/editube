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
<title>편집자 컨텐츠</title>

<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet" />
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<link href="resources/css/sideBar.css?after" rel="stylesheet">
<link href="resources/css/editContent.css?after" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/sideBar.js"></script>

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

<!-- Custom styles for this template -->
<link href="resources/css/landing-page.min.css?after" rel="stylesheet">

</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	<!-- <div class="wrap"> -->
	<jsp:include page="commuNav.jsp"></jsp:include>
	<div id="top" class="wrapper">
		<div>
			<h1>'###님의 편집자 게시물'</h1>
			<img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">평점|1명의 평가
			<div class="video">
				<iframe width="1280" height="720"
					src="https://www.youtube.com/embed/aYh-0FyEtAA" width="640"
					height="360" frameborder="0"></iframe>
			</div>
			<table class="4input">
				<tr>
					<td><a href="#intro" class="button"
						style="width: 240px; border: 1px solid; padding: 10px 20px;">편집자 소개</a></td>
					<td><a href="#QA" class="button"
						style="width: 240px; border: 1px solid; padding: 10px 20px;">Q&A</a></td>
					<td><a href="#eval" class="button"
						style="width: 240px; border: 1px solid; padding: 10px 20px;">평가</a></td>
					<td><a href="#notice" class="button"
						style="width: 240px; border: 1px solid; padding: 10px 20px;">주의사항</a></td>
				</tr>
			</table>
			<div class="table-users">
				<div id="intro" class="titleheader">편집자 소개</div>
				<table>
					<tr height="200">
						<td width="938">오늘이 월요일이라니</td>
					</tr>
				</table>
			</div>
			<div class="table-users">
				<div class="titleheader">세부사항</div>
				<table>
					<tr height="200">
						<td width="940">집에 얼른 가장</td>
					</tr>
				</table>
				<div class="titlefoot">가격:50000원</div>
			</div>
			<div>
				<button type="button" class="list">목록</button>
				<button type="button" class="req">요청</button>
			</div>
			<div class="econtent">
				<div>
					<div id="QA" class="titleheader">Q&A</div>
					<!-- 나중에 입력받는걸로 바뀜 -->
				</div>
				<div class="data-area">
					<div class="title-row">
						<div class="t-bnum p-10">번호</div>
						<div class="t-name p-13">닉네임</div>
						<div class="t-title p-60">Q&A</div>
						<div class="t-date p-13">등록일</div>
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 오늘 야근있나요? </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13">오늘</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div>
						<button class="evalmore">평가 더보기+</button>
					</div>
				</div>
			</div>
			<div class="econtent">
				<div>
					<div id="eval"class="titleheader">평가</div>
					<!-- 나중에 입력받는걸로 바뀜 -->
				</div>
				<div class="data-area">
					<div class="title-row">
						<div class="t-bnum p-10">번호</div>
						<div class="t-name p-13">닉네임</div>
						<div class="t-title p-60">후기</div>
						<div class="t-date p-13">평점</div>
					</div>
					<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
						<div class="data-row">
						<div class="u-bnum p-10">1</div>
						<!-- ${bitem.bnum} -->
						<div class="u-name p-13">집에가고싶은 남자</div>
						<!-- ${bitem.mname} -->
						<div class="u-title p-60">
							<a href="contents?bnum=${bitem.bnum}"> 깔끔하고 좋네요 </a>
							<!-- ${bitem.btitle} -->
						</div>
						<div class="u-date p-13"><img class="user-profile " src="resources/images/star.png"
				style="width: 25px; height: 10px;">5.0점</div>
						<!-- ${bitem.bdate} -->
					</div>
					<div>
						<button class="evalmore">평가 더보기+</button>
					</div>
				</div>
			</div>
			<div class="table-users">
				<div id="notice" class="titleheader">주의사항</div>
				<table>
					<tr height="200">
						<td width="940">어떻게 벌써 12시~나는 신데렐라 일해라</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<a href="#top"><img src="resources/images/up.PNG" class="up"></a>
</body>
</html>