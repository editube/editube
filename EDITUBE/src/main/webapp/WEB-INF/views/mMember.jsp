<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<link href="resources/css/myEPageNav.css?after" rel="stylesheet">
<link href="resources/css/myEPageStyle.css?after" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
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
	<form action="dateSearch" method="get">
		<p>
		날짜조회 
		<input type="date" name="reqDatestart"> 부터
		<input type="date" name="reqDateend"> 까지 
		<input type="submit" class="reqDateBtn" value="조회">
		검색
		<input type="text" placeholder="닉네임 검색"/>&nbsp;<img src="resources/images/돋보기.png" width="20px"> 	
		</p>	
	</form>
	</div>
	<div class="myEPageReqMContentWrap">
		<div class="myEPageReqMContentTitle">
			<div class="dateMenu"><p>날짜</p></div>
			<div class="nickMenu"><p>닉네임</p></div>
			<div class="adminMenu"><p>관리</p></div>
		</div>
		<div class="myEPageReqMIncontent">
		<c:forEach var="mitem" items="${mList}">
			<div class="inDate">
			<fmt:formatDate value="${mitem.m_joindate}" pattern="yyyy-MM-dd" />			
			</div>
			<div class="inNickname">
			${mitem.m_nickname}					
			</div>
			<div class="inAdmin">
			<input type="button" class="memOutbtn" value="회원탈퇴" onclick="Deletego('${mitem.m_nickname}')">
			</div>
		</c:forEach>
		</div>
		
	</div>
</div>
</div>	
</body>
<script type="text/javascript">
function Deletego(m_nickname){
	var del = confirm("정말로 삭제 하시겠습니까?");
	if(del == true){
		location.href='./mdelete?m_nickname=' + m_nickname;
	}
	else{
		alert("취소되었습니다.");
	}
}
</script>
</html>