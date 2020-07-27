<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 관리</title>
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<link href="resources/css/myEPageNav.css?after" rel="stylesheet">
<link href="resources/css/myEPageStyle.css?after" rel="stylesheet">
<link href="resources/css/mDealReason.css?after" rel="stylesheet">
</head>
<body>
<dialog id="confirm-modal" class="modal">
  <div class="modal-content">
    <h4 class="modal-title">거래 취소 요청</h4>
    <p>'위즈덤'님의 취소 요청입니다. </p>
    <article class="modal-description">
      <div class="container">
        <p>거래 조건이 맞지 않아서 취소 요청합니다.</p>
      </div>
    </article>
    <div class="modal-options">
      <input type="button"
        value="수락"
       type="button"
        onclick="document.querySelector('#confirm-modal').close()"
      >
      <input type="button"
             value="거절"
        onclick="document.querySelector('#confirm-modal').close()"
      >
    </div>
  </div>
</dialog>
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
		</p>
	</div>
	<div class="myEPageReqMContentWrap">
		<div class="myEPageReqMContentTitle">
			<div class="dateMenu"><p>날짜</p></div>
			<div class="contentMenu" style=width:400px;><p>내역</p></div>
			<div class="statusMenu"><p>상태</p></div>
		</div>
		<div class="myEPageReqMIncontent">
			<div class="inDate">
			<p>2020-06-07</p>			
			<p>2020-06-07</p>			
			<p>2020-06-07</p>			
			<p>2020-06-07</p>
			</div>
			<div class="inContent" style=width:400px;>
			<p>'파리갬성PSG' 님의 거래 취소 요청</p>			
			<p>'파리갬성PSG' 님의 입금 완료</p>			
			<p>'파리갬성PSG' 님의 입금 완료</p>		
			<p>'파리갬성PSG' 님의 입금 완료</p>
			</div>
			<div class="inStatus">
			<input type="button" onclick="document.querySelector('#confirm-modal').showModal()" class="statusbtn" value="상세내역">
			</div>
		</div>
	</div>
</div>
</div>

</body>
</html>