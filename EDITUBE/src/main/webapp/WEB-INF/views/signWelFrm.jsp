<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<div class="">
		<img class="" src="resources/images/mainlogo.png">
		<h3>EDITUBE</h3>
		<h3>가입을 환영합니다.</h3>
	</div>
	<div class="content-login">
		<form name="signPageFrm" class="login-form" action="memInsert" method="post" onsubmit="return check()">		
			<input type="text" class="login-input" id="mid" title="이메일아이디"
				name="m_id" autofocus placeholder="이메일아이디">
			<input type="button" class="idcheck-btn" value="메인으로" onclick="location.href='./main'">
			<input type="button" class="idcheck-btn" value="마이페이지" onclick="location.href='./myUPageSc'">
			<input type="button" class="idcheck-btn" value="에디캐쉬 충전하기" onclick="location.href='./chargeCash'">			`
		</form>
	</div>
	</section>
</body>
</html>