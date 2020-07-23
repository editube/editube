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
	<section>
		<div class="content-login">
		<img class="top-left logo" src="resources/images/mainlogo.png">
			<p>고객님의 아이디는</p>
			${mb.m_id}
			<p>입니다.</p>
			<input type="button" class="idcheck-btn" value="비밀번호 찾기" onclick="location.href='./findPwFrm'"> 
			<input type="button" class="idcheck-btn" value="Login" onclick="location.href='./loginFrm'"> `
		</div>
	</section>
</body>
</html>