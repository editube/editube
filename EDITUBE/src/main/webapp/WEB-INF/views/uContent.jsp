<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/content.css?after" rel="stylesheet">
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<link href="resources/css/myEPageNav.css?after" rel="stylesheet">
</head>
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
<div class="uContentWrap">
	<aside class="uContentAside">
		<jsp:include page="myEPage.jsp"></jsp:include>
	</aside>
	<div class="mainSectionWrap">
		<div class="mainSectionWrap-top">
			<div class="pfImageBox">
				<img alt="형용이" src="resources/images/getcomoria.jpg">
			</div>
			<div class="pfInfoWrap">
				<div class="pfInfoOne"><p>[건별편집]</p><h2>#먹방</h2></div>
				<div class="pfInfoTwo"><h1><span>심형용</span>님의 편집자를 구합니다</h1></div>
				<div class="pfInfoThree"><p>마감기한 : <span>20-08-03</span> 까지</p></div>
				<div class="pfInfoFour"><h2>5,000원</h2></div>
				<div class="pfInfoFive">
					<button type="button" class="btn1" onclick="dealReq()">요청하기</button>
					<button type="button" class="btn2">목록으로</button>
					<button type="button" class="btn3">찜하기</button>
				</div>
			</div>
		</div>
		<div class="mainSectionWrap-bottom">
			<div class="uContentTitleWrap">
				<div class="uContentTitle">
					<h2>한국에서 햄버거 제일 많이먹는 유튜버 샤이보이 심형용입니다.</h2>
					<img alt="포인트" src="resources/images/point01.PNG">
				</div>
			</div>
			<div class="uContentContentWrap">
				<div class="uContentContent">
					<p>끈기있고 성실한 편집자를 구합니다 사랑해요</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
function dealReq(){
	
}
</script>
</html>