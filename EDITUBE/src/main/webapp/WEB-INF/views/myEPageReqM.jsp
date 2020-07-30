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
					<div class="reqBtn">
					 ㅜ	<!-- 관리자와의 요청대기중 상태 필요-->
						<c:if test="${reqItem.rq_status == 1}">
							<button type="button" class="btnReq1" 
							onclick="statusChange('${reqItem.rq_targetnickname}', 1, ${reqItem.rq_num})">수락</button>
							<button type="button" class="btnReq2"
							onclick="statusChange('${reqItem.rq_targetnickname}', 2, ${reqItem.rq_num})">거절</button>
						</c:if>
						<c:if test="${reqItem.rq_status == 2}">
							<button type="button" class="btnSend1" disabled="disabled">대기중</button>
							<button type="button" class="btnSend2"
							onclick="statusChange('${reqItem.rq_targetnickname}', 3, ${reqItem.rq_num})">취소</button>
						</c:if>
						<c:if test="${reqItem.rq_status == 3}">
							<button type="button" class="btnIng1">1:1문의</button>
							<button type="button" class="btnIng2"
							onclick="statusChange('${reqItem.rq_targetnickname}', 4, ${reqItem.rq_num})">취소</button>
							<button type="button" class="btnIng3"
							onclick="statusChange('${reqItem.rq_targetnickname}', 5, ${reqItem.rq_num})">완료요청</button>
						</c:if>
					</div>
			</c:forEach>
				</div>
		</div>
	</div>
	</div>
</body>
<script type="text/javascript">
function statusChange(nick,snum, rnum){
	console.log(nick,snum, rnum);
	
	var unum=0;
	
	if(snum == 1){
		unum=3;
		var stc1 = confirm("정말로진짜로 '"+nick+"'님의 요청을 수락하시겠습니까?");
		if(stc1 == true){
			alert("수락되었습니다.");
			location.href='./statusChange?rnum=' + rnum + "&unum=" + unum;
		}
		else{
			alert("취소되었습니다.");
		}
	}
	
	if(snum == 2){
		unum=5;
		var stc2 = confirm("정말로진짜로 '"+nick+"'님의 요청을 거절하시겠습니까?");
		if(stc2 == true){
			alert("거절되었습니다.");
			location.href='./statusChange?rnum=' + rnum + "&unum=" + unum;
		}
		else{
			alert("취소되었습니다.");
		}
	}
	
	if(snum == 3){
		unum=5;
		var stc3 = confirm("정말로진짜로 '"+nick+"'님에게 보낸요청을 취소하시겠습니까?");
		if(stc3 == true){
			alert("보낸요청이 취소되었습니다.");
			location.href='./statusChange?rnum=' + rnum + "&unum=" + unum;
		}
		else{
			alert("취소되었습니다.");
		}
	}
	
	if(snum == 4){
		unum=5;
		var stc4 = confirm("정말로진짜로 진행중인 거래를 취소하시겠습니까?");
		if(stc4 == true){
			alert("취소요청이 완료되었습니다.");
			location.href='./statusChange?rnum=' + rnum + "&unum=" + unum;
		}
		else{
			alert("취소되었습니다.");
		}
	}
	
	if(snum == 5){
		unum=4;
		var stc5 = confirm("거래 완료 요청을 진행하시겠습니까?");
		if(stc5 == true){
			alert("완료요청이 완료되었습니다.");
			location.href='./statusChange?rnum=' + rnum + "&unum=" + unum;
		}
		else{
			alert("취소되었습니다.");
		}
	}
}
</script>
</html>