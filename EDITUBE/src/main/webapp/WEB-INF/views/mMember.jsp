<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<link href="resources/css/myEPageNav.css?after" rel="stylesheet">
<link href="resources/css/myEPageStyle.css?after" rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
<div class="myEPageReqMWrap">
<aside class="myEPageReqMaside">
<jsp:include page="mMypageNav.jsp"></jsp:include>
</aside>
<div class="myEPageReqMSection">
	<div class="myEPageReqMTitle">
		<p>전체 내역</p>
	</div>
	<div class="myEPageReqMSearch">
		<p>
		날짜조회 
		<input type="date" name="reqDatestart"> 부터
		<input type="date" name="reqDateend"> 까지 
		<input type="button" class="reqDateBtn" value="조회">
		검색
		<input type="text" placeholder="닉네임 검색"/>&nbsp;<img src="resources/images/돋보기.png" width="20px"> 	
		</p>	
	</div>
	<div class="myEPageReqMContentWrap">
		<div class="myEPageReqMContentTitle">
			<div class="dateMenu"><p>날짜</p></div>
			<div class="nickMenu"><p>닉네임</p></div>
			<div class="adminMenu"><p>관리</p></div>
		</div>
		<div class="myEPageReqMIncontent">
			<div class="inDate">
			<p>2020-06-07</p>			
			<p>2020-06-07</p>			
			<p>2020-06-07</p>			
			<p>2020-06-07</p>
			</div>
			<div class="inNickname">
			<p>파리갬성</p>			
			<p>두빵댕</p>			
			<p>마장동</p>		
			<p>엘블랑</p>			
			</div>
			<div class="inAdmin">
			<input type="button" class="memOutbtn" value="회원탈퇴">
			</div>
		</div>
	</div>
</div>
</div>	
</body>
</html>