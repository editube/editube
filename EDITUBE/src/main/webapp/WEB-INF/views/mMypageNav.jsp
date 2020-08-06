<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이 페이지 nav</title>
<link rel="stylesheet" href="resources/css/myEPageNav.css">        
</head>
<body>
<div class="MyPagenavwrap">
	<div class="profileimagebox" style="height: 400px;">
	<figure class="snip0067 red">
	  		<img src="resources/images/${mb.m_oriName}" alt="" />
	  		<div class="position">관리자</div>
	</figure>
	</div>
	<aside class="sidebar">
    	<nav class="nav">
     		<ul>
				<li class="MnavMain"><a>거래관리</a>
					<ul class="MnavSub">
						<li><a href="./mDeal">전체</a></li>
						<li><a href="./mDeal">취소요청</a></li>
						<li><a href="./mDeal">진행 중</a></li>
						<li><a href="./mDeal">완료</a></li>
					</ul>
				</li>
				<li><a href="./Member">회원 관리</a></li>
				<li><a href="./mWarning">주의사항 관리</a></li>
			</ul>
    	</nav>
  	</aside>
</div>
</body>
</html>