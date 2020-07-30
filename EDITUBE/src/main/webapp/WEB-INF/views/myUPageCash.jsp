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
<div class="myEPageCashWrap">
<aside class="myEPageCashaside">
<jsp:include page="myUPage.jsp"></jsp:include>
</aside>
<div class="myEPageCashSection">
<div class="myEPageCashTitle">
	<div class="CashTitleName">
		<p>캐쉬 관리</p>
	</div>
	<div class="myCash">
		<p>50,000 원</p>
		<p>보유 캐쉬</p>
	</div>
	</div>
	<div class="myEPageCashSearch">
		<p>
		날짜조회 
		<input type="date" name="CashDatestart"> 부터
		<input type="date" name="CashDateend"> 까지 
		<select>
			<option value="전체내역">전체내역</option>
			<option value="입금내역">입금내역</option>
			<option value="출금내역">출금내역</option>
		</select>
		<input type="button" class="CashDateBtn" value="조회">
		</p>
	</div>
	<div class="myEPageCashContentWrap">
		<div class="myEPageCashContentTitle">
			<div class="CashdateMenu"><p>날짜</p></div>
			<div class="CashcontentMenu"><p>내역</p></div>
		</div>
		<div class="myEPageCashIncontent">
			<div class="CashinDate">
			<p>2020-06-08</p>
			<p>2020-06-09</p>
			<p>2020-06-10</p>
			</div>
			<div class="CashinContent">
			<p>에디 튜브 캐쉬 50,000원 충전완료</p>
			<p>'파리갬성P박S성G기'님에게 편집요청으로 50,000원 지급</p>
			<p>에디 튜브 캐쉬 50,000원 충전완료</p>
</div>
</div>
</div>

</div>
</div>
</body>


</html>  