<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editube</title>
<!-- 앨범관련입니다 -->
<link href="resources/js/album.js">

<!-- 헤더, 네비게이션 관련 -->
<link href="resources/css/myEPageStyle.css?after" rel="stylesheet">
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<link href="resources/css/myEPageNav.css?after" rel="stylesheet">
<style type="text/css">
.myEPageScWrap{
	width:1400px;
	margin: 0px auto;
	background-color: #f9f9f9;
	height:1500px;
}
.myEPageScaside{
	float:left;
}
</style>
</head>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<div class="myEPageScWrap">
<aside class="myEPageScaside">
<jsp:include page="myUPage.jsp"></jsp:include>
</aside>
<div class="mainSection">
<ul class="card-list">
	
	<li class="card">
		<a class="card-image" href="./editContent" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-500.jpg">
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg" alt="Psychopomp" />
		</a>
		<a class="card-description" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank">
			<h2>지각쟁이조서호</h2>
			<p>50,000원</p>
		</a>
	</li>
	
	<li class="card">
		<a class="card-image" href="https://inlovewithaghost.bandcamp.com/album/lets-go" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/lets-go-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/lets-go-500.jpg">
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/lets-go-100.jpg" alt="let's go" />
		</a>
		<a class="card-description" href="https://inlovewithaghost.bandcamp.com/album/lets-go" target="_blank">
			<h2>5연벙 김지혜</h2>
			<p>3,000원</p>
		</a>
	</li>
	
	<li class="card">
		<a class="card-image" href="https://vulfpeck.bandcamp.com/album/the-beautiful-game" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/beautiful-game-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/beautiful-game-500.jpg">
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/beautiful-game-100.jpg" alt="The Beautiful Game" />
		</a>
		<a class="card-description" href="https://vulfpeck.bandcamp.com/album/the-beautiful-game" target="_blank">
			<h2>먹방요정 심혀ㅑㅇ용</h2>
			<p>90,000원</p>
		</a>
	</li>
	
</ul>
</div>
</div>
</body>
</html>