<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>글쓰기</title>

<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet" />

<link href="resources/css/sideBar.css" rel="stylesheet">
<link href="resources/css/writeCommuFrm.css?after" rel="stylesheet">
<link href="resources/css/headerstyle.css?after" rel="stylesheet">


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/sideBar.js"></script>


<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<!-- calendar -->
<script src="resources/js/jquery-3.1.1.min.js"></script>
<!-- 값 제어를 위해 jquery -->
<link href="resources/css/datepicker.min.css" rel="stylesheet"
	type="text/css" media="all">
<!-- Air datepicker css -->
<script src="resources/js/datepicker.js"></script>
<!-- Air datepicker js -->
<script src="resources/js/i18n/datepicker.ko.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="all">
		<jsp:include page="youtubeNav.jsp"></jsp:include>
		<div id="page-wrapper" class="clearfix">

			<h1>Write</h1>

			<form action="writecom" method="GET" id="file-form">
				<!-- POST로 나중에 바꾸기 -->
				<div class="field">
					<input type="text" name="filename" id="filename"
						placeholder="제목을 입력하세요.">
				</div>
				<div class="opt">
					<div id="type">
						<input class="tgl tgl-flip" id="cb10" type="checkbox" /><label
							class="tgl-btn" data-tg-off="건별" data-tg-on="정기" for="cb10"></label>
					</div>
					<div id="pri">
						금액: <input type="number" name="price" id="price"
							placeholder="금액을 입력하세요.">
					</div>
					<div id="date">
						마감일: <input type="text" id="datepicker">
					</div>
				</div>
				<div class="checkBox">
				<div class="cpack">
					<input class="ckb" id="check1" type="radio" name="check"
						> <label id="che" for="check1">게임 방송</label>
				</div>
				<div class="cpack">
					<input class="ckb" id="check2" type="radio" name="check"
						> <label id="che" for="check2">먹방</label>
				</div>
				<div class="cpack">
					<input class="ckb" id="check3" type="radio" name="check"
						> <label id="che" for="check3">브이로그</label>
				</div>
				<div class="cpack">
					<input class="ckb" id="check4" type="radio" name="check"
						> <label id="che" for="check4">뷰티</label>
				</div>
				<div class="cpack">
					<input class="ckb" id="check5" type="radio" name="check"
						> <label id="che" for="check5">음악 방송</label>
				</div>
				<div class="cpack">
					<input class="ckb" id="check6" type="radio" name="check"
						> <label id="che" for="check6">기타</label>
				</div>
				</div>
				<div class="field">
					<textarea name="content" id="content" placeholder="내용을 입력하세요."></textarea>
				</div>
				<div class="btn-field">
					<button type="button" id=cancel
						onclick="location.href='./youtuberBoard'">취소</button>
					<button type="submit">저장</button>
					<div id="messages"></div>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
	$("#datepicker").datepicker({
		language : 'ko'
	});
</script>

</html>