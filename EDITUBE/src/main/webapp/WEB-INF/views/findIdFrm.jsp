<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/style.css">
<title>Insert title here</title>
</head>
<body>
	<div class="content-left">
		<img class="top-left logo" src="resources/images/mainlogo.png"	onclick="gohome();">

		<h3>ID 찾기</h3>
	</div>
	<div class="content">
		<form class="login-form" action="findIdMatch" method="post">
			<input type="text" class="login-input" 
				name="m_name" required autofocus placeholder="이름">
			<input type="password" class="login-input" 
				name="m_phonenum" required placeholder="전화번호">
			<input type="submit" class="login-btn" value="ID 찾기">
		</form>
	</div>
</body>
<script type="text/javascript">
function check(){
	//form 태그의 내용을 전부 가져오기
	var frm = document.signPageFrm;
	
	//submit 버튼을 뺀 나머지 input태그의 개수
	var length = frm.length - 1;
	
	//input 태그 중에 입력이 안된 요소를 확인
	for(var i = 0; i < length; i++){
		if(frm[i].value == "" 
				|| frm[i].value == null){
			alert(frm[i].title + " 입력!");
			frm[i].focus();
			return false;//action이 실행 안됨.
		}
	}
	//모든 input에 입력이 다 되었을 경우.
	return true;//action이 실행됨.
}

function gohome() {
	var id = '${mb.m_id}';

	if (id == '') {
		location.href = './';
	} else if (id != '') {
		location.href = './list';
	}
}

</script>
</html>