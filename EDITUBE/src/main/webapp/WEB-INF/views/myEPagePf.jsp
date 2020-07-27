<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<link href="resources/css/myEPageNav.css?after" rel="stylesheet">
<link href="resources/css/myEPageStyle.css?after" rel="stylesheet">

</head>
<body>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<div class="myEPagePfWrap">
<aside class="myEPagePfaside">
<jsp:include page="myEPage.jsp"></jsp:include>
</aside>
<div class="myEPagePfSection">
	<div class="myEPagePfTitle">
		<div class="CashTitleName">
			<p>먹방요정S심H형Y용 님의 포트폴리오</p>
		</div>
		<div class="myCash">
			<p>50,000 원</p>
			<p>금액 :</p>
		</div>
	</div>
	<div class="UVideoBox">
		<iframe width="880" height="495" src="https://www.youtube.com/embed/eERSahizuuc" 
		frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
		</iframe>
	</div>
	<div class="hashTag">
		<p>#게임방송</p>
		<p>#먹방</p>
	</div>
	<div class="introduceWrap">
		<div class="introduce">
			<p>소개글</p>
		</div>
	</div>
	<div class="introduceContentWrap">
		<div class="introduceContent">
			<p>두그릇 세그릇 네그릇.. 님 햄최몇? 세계최고 먹방요정 샤이보이 심형용입니다.<p>
			<p>후후...</p>
		</div>
	</div>
	<div class="btnWrap">
		<div class="btnDiv">
			<button type="button" onclick="location.href='./upPortfolio'">수정</button>
			<button type="button">갱신</button>
		</div>
	</div>
</div>
</div>
</body>
</html>