<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더블 보드</title>
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/sideBar.js"></script>
<link href="resources/css/sideBar.css?after" rel="stylesheet">
<link href="resources/css/commuBoard.css?after" rel="stylesheet">
<link href="resources/css/editBoard.css?after" rel="stylesheet">
<link href="resources/css/doubleBoard.css?after" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
</head>
<body>
<header>
		<jsp:include page="header.jsp"></jsp:include>
</header>
<div class="double-all">
<div class="side">
   <jsp:include page="doubleNav.jsp"></jsp:include>
</div>
<div id="wrap">
	<div id="accordian">
		<div class="step" id="step1">
			
			<div class="title">
				<h3>게임방송 편집자 프로필</h3>
			</div>
			<div class="modify" onclick="location.href='editBoard'">
				<i class="fa fa-plus-circle"></i>
			</div>
		</div>
		<div class="content">
		 <div class="double-card">
		   <a class="double-card-image" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-500.jpg">
		         <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg" alt="Psychopomp" style=height:100px; />
		   </a>
		      <a class="double-card-description" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank">
		         <h6>파리갬성으로 편집해드려요</h6>
		         <p>40,000원</p>
		      </a>
		  </div>
		  <div class="double-card">
		   <a class="double-card-image" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-500.jpg">
		         <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg" alt="Psychopomp" style=height:100px;/>
		   </a>
		      <a class="double-card-description" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank">
		         <h6>파리갬성으로 편집해드려요</h6>
		         <p>40,000원</p>
		      </a>
		  </div>
		  <div class="double-card">
		   <a class="double-card-image" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-500.jpg">
		         <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg" alt="Psychopomp" style=height:100px;/>
		   </a>
		      <a class="double-card-description" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank">
		         <h6>파리갬성으로 편집해드려요</h6>
		         <p>40,000원</p>
		      </a>
		  </div>
		</div>
		<div class="step" id="step2">
			<div class="title">
				<h3>게임방송 편집자 구합니다</h3>
			</div>
			<div class="modify">
				<i class="fa fa-plus-circle" onclick="location.href='youtuberBoard'"></i>
			</div>
		</div>
		<div class="content">
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
		
		</div>
		
	</div>	
</div>
</div>
</body>
</html>