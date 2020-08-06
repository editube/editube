<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<style type="text/css">
.chatingWrap{
	width: 500px;
	height: 600px;
}
.chatingContentWrap{
	width: 490px;
	height: 500px;
	border: 1px solid black;
	margin-bottom: 3px;
}

.chatingWrap .chatingContent{
	height: 500px;
	overflow: scroll;
}
.chatingInsertWrap{
	width: 490px;
	height: 100px;
}
.chatingInsertWrap textarea{
	width: 390px;
	height: 100px;
	float: left;
	border: 1px solid black;
	outline:none;
	resize: none;
}
.chatingInsertWrap .chatBtnWrap{
	width: 90px;
	height: 100px;
	float: left;
}
</style>
</head>
<body>
<div class="chatingWrap">
	<div class="chatingContentWrap">
		<div class="chatingContent" id="chatCon">
			<c:forEach var="cItem" items="${cList}">
					<p>${cItem.ch_mnickname}<p>
					<p>${cItem.ch_content}</p>
			</c:forEach>
		</div>
	</div>
	
 	<form action="chating" method="post" name="chating"> 
		<div class="chatingInsertWrap">
			<textarea name="ch_content" autofocus="autofocus" id="textarea"></textarea>
			<input type="hidden" name="ch_targetnickname" value="${nick}">
			<div class="chatBtnWrap">
			<input type="submit" id="submit" value="전송">
			</div>
		</div>
 	</form> 
</div>
</body>
<script type="text/javascript">
var objDiv = document.getElementById("chatCon"); 
objDiv.scrollTop = objDiv.scrollHeight;

$('#textarea').keypress(function(event){
	console.log("zzz");
    if ( event.which == 13 ) {
        $('#submit').click();
        return false;
    }
});
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
<script type="text/javascript">


// var auto_refresh = setInterval(
// 		function () {
// 		$('#chatCon').load('chating #chatCon').fadeIn("slow");
// 		console.log("ddd")[]' ;  '
// 		}, 3000); // 새로고침  1000은 1초를 의미
</script>

</html>