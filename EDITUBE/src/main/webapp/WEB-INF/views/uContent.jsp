<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDITUBE</title>

<link href="resources/css/sideBar.css?after" rel="stylesheet">
<link href="resources/css/content.css?after" rel="stylesheet">
<link href="resources/css/commuBoard.css?after" rel="stylesheet">
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
   var chk = '${uboard.chk}'
   
    if(chk == 1){
 	   $('#reqBtn').attr('disabled','disabled');
 	   $('#reqBtn').val('거래중');
    }
   
   var mnickname = '${mb.m_nickname}';
   if(mnickname == '${uboard.ubnickname}') {
   $('.btn4').css('display','block');
   $('.btn1').css('display','none');
   $('.btn3').css('display','none');
   $('.btn5').css('display','block');
   }
   else if(mnickname != '${uboard.ubnickname}') {
   $('.btn4').css('display','none');
   $('.btn1').css('display','block');
   $('.btn3').css('display','block');
   $('.btn5').css('display','none');
}
});
</script>
</head>
<body>
<header>
   <jsp:include page="header.jsp"></jsp:include>
</header>
<div class="uContentWrap">
   <aside class="uContentAside">
      <jsp:include page="youtubeNav.jsp"></jsp:include>
   </aside>
   <div class="mainSectionWrap">
      <div class="mainSectionWrap-top">
         <div class="pfImageBox">
            <img src="resources/images/${uboard.moriname}">
         </div>
         <div class="pfInfoWrap">
            <div class="pfInfoOne">[${uboard.ubstatus}]<h2>#${uboard.ubpositiontype}</h2></div>
            <div class="pfInfoTwo"><h1><span>${uboard.ubnickname}</span>님의 편집자를 구합니다</h1></div>
            <div class="pfInfoThree"><p>마감기한 : <span><fmt:formatDate value="${uboard.ubdeadline}" pattern="yyyy-MM-dd" /></span> 까지</p></div>
            <div class="pfInfoFour"><h2>${uboard.ubcost}원</h2></div>
            <div class="pfInfoFive">
               <input type="hidden" value="${uboard.chk}">
               <input type="button" id="reqBtn" class="btn1" onclick="goReq(${uboard.ubnum},'${uboard.ubnickname}')" value="요청하기">
               <button type="button" class="btn4" onclick="location.href='./updateUFrm?ubnum=${uboard.ubnum}'">수정하기</button>
               <button type="button" class="btn2" onclick="location.href='./timearry'">목록으로</button>
               <button type="button" class="btn3">찜하기</button>
               <button type="button" class="btn5" onclick="goDelete(${uboard.ubnum},'${mb.m_nickname}','${uboard.ubnickname}')">삭제하기</button>
            </div>
         </div>
      </div>
      <div class="mainSectionWrap-bottom">
         <div class="uContentTitleWrap">
            <div class="uContentTitle">
               <h2>${uboard.ubtitle}</h2>
               <img alt="포인트" src="resources/images/point01.png">
            </div>
         </div>
         <div class="uContentContentWrap">
            <div class="uContentContent">
               <p>${uboard.ubcontent}</p>
            </div>
         </div>
      </div>
   </div>
</div>
<script type="text/javascript">
function goDelete(ubnum, lnick, ubnick){
   if(lnick != ubnick){
      alert("본인이 작성한 글이 아니면 삭제할 수 없습니다.");
      return;
   }
   var del = confirm("정말로 삭제 하시겠습니까?");
   if(del == true){
      location.href='./udelete?ubnum=' + ubnum;
   }
   else{
      alert("취소되었습니다.");
   }
}

function goReq(bnum, nick){
	   var del = confirm(nick + "님에게 거래를 요청 하시겠습니까?");
	   if(del == true){
		   location.href='./goReq?bnum='+bnum+'&nick='+nick;
		   alert("요청이 완료되었습니다");
		   $("#reqBtn").attr("disabled");
	   }
	   else{
	      alert("취소되었습니다.");
	   }
	
}



</script>
</body>
</html>