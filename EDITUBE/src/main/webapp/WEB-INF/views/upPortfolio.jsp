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
<div class="upPfCashWrap">
	<aside class="upPfaside">
	<jsp:include page="myEPage.jsp"></jsp:include>
	</aside>
	<div class="upPfSection">
		<div class="upPfTitleWrap">
			<textarea class="upPfTitle" name="upPfTitleName" autofocus="autofocus" 
			placeholder="제목" required></textarea>
		</div>
		<div class="upPfContentWrap">
			<textarea class="upPfContent" placeholder="내용" required></textarea>
		</div>
		<div class="pfCheckboxWrap">
			<div class="pfCheckbox">
				카테고리 : 
				<input type="checkbox" value="1" name="cate" onclick="CountChecked(this)">게임방송
				<input type="checkbox" value="2" name="cate" onclick="CountChecked(this)">먹방
				<input type="checkbox" value="3" name="cate" onclick="CountChecked(this)">브이로그
				<input type="checkbox" value="4" name="cate" onclick="CountChecked(this)">뷰티
				<input type="checkbox" value="5" name="cate" onclick="CountChecked(this)">음악방송
				<input type="checkbox" value="6" name="cate" onclick="CountChecked(this)">기타
			</div>
		</div>
		
		<div class="linkboxWrap">
			<div class="linkbox">
				포트폴리오 홍보영상 공유링크주소 <textarea class="linkAdress"></textarea>
			</div>
		</div>
		<div class="btnWrap">
			<div class="btnDiv">
				<button type="submit">완료</button>
				<button type="reset">취소</button>
			</div>
		</div>
		
		
	</div>
</div>
</body>
<script type="text/javascript">
var maxChecked = 1;   //선택가능한 체크박스 갯수
var totalChecked = 0; // 설정 끝
function CountChecked(field) {
    if (field.checked) // input check 박스가 체크되면 
        totalChecked += 1; // totalChecked 증가
    else // 체크가 아니면
        totalChecked -= 1; // totalChecked 감소
    if (totalChecked > maxChecked) { // totalchecked 수가 maxchecked수보다 크다면
        alert ("최대 1개 까지만 가능합니다."); // 팝업창 띄움
    field.checked = false;
    totalChecked -= 1;
    }
}
</script>
</html>