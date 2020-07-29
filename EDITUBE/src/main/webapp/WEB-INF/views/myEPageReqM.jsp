<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<link href="resources/css/myEPageNav.css?after" rel="stylesheet">
<link href="resources/css/myEPageStyle.css?after" rel="stylesheet">
</head>
<body>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<div class="myEPageReqMWrap">
	<aside class="myEPageReqMaside">
	<jsp:include page="myEPage.jsp"></jsp:include>
	</aside>
	<div class="myEPageReqMSection">
		<div class="myEPageReqMTitle">
			<p>전체 내역</p>
		</div>
		<div class="myEPageReqMSearch">
			<p>
			날짜조회 
			<input type="date" name="reqDatestart"> 부터
			<input type="date" name="reqDateend"> 까지 
			<input type="button" class="reqDateBtn" value="조회">
			</p>
		</div>
		<div class="myEPageReqMContentWrap">
			<div class="myEPageReqMContentTitle">
				<div class="dateMenu"><p>날짜</p></div>
				<div class="contentMenu"><p>내역</p></div>
			</div>
				<div class="myEPageReqMIncontent">
			<c:forEach var="reqItem" items="${reqList}">
					<div class="inDate">${reqItem.rq_date}</div>
					<div class="inContent">${reqItem.rq_msg}</div>
			</c:forEach>
				</div>
		</div>
	</div>
	</div>
</body>

<script type="text/javascript">

</script>
</html>