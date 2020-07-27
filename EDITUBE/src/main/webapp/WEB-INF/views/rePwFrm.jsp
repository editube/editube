<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/login.css">
<title>비밀번호 재설정</title>
</head>
<body>
<div class="wrap">
<div class="container">
    <div class="card"></div>
    <div class="card">
    	<img src="resources/images/logo.png" width="100px" class="logo-center">
        <h1 class="title">비밀번호 재설정</h1>
        <form>
            <div class="input-container"><input type="password" required/><label>비밀번호</label>
                <div class="bar"></div>
            </div>
            <div class="input-container"><input type="password" required/><label>비밀번호 확인</label>
                <div class="bar"></div>
            </div>
            <div class="button-container"><button type="button" onclick="location.href='comPwFrm'" style=width:240px;><span>비밀번호 변경</span></button></div>
        </form>
    </div>
</div>
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
		location.href = './';
	}
}
</script>
</html>