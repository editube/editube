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
<title>commuContent</title>

<link
   href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
   rel="stylesheet" />

<link href="resources/css/sideBar.css?after" rel="stylesheet">
<link href="resources/css/writeCommuFrm.css?after" rel="stylesheet">
<link href="resources/css/headerstyle.css?after" rel="stylesheet">

<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/sideBar.js"></script>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">

</head>
<body>
   <jsp:include page="header.jsp"></jsp:include>
   <div class="all">
      <jsp:include page="commuNav.jsp"></jsp:include>
      <div id="page-wrapper" class="clearfix">
         <h1>자유게시판</h1>
         <table>
            <tr height="30">
               <td bgcolor="red" align="center">작성자</td>
               <td width="150">누군지 맞춰봐용</td>
               <!-- ${board.mname} -->
               <td bgcolor="red" align="center">날짜</td>
               <td width="200">비밀~</td>
               <!-- ${board.bdate} -->
            </tr>
            <tr height="30">
               <td bgcolor="red" align="center">제목</td>
               <td colspan="5">내일은 금요일~</td>
               <!-- ${board.btitle} -->
            </tr>
            <tr height="200">
               <td bgcolor="red" align="center">내용</td>
               <td colspan="5">오늘은 목요일~</td>
               <!-- ${board.bcontents} -->
            </tr>
            <tr>
               <td colspan="6" align="right">
                  <button class="btn-sub" onclick="location.href='./commuBoard'">목록</button>
                  <button class="btn-write" id="upbtn"
                     onclick="location.hrdf='./updateFrm?bnum=${board.bnum}'">수정</button>
                  <button class="btn-write" id="delbtn"
                     onclick="goDelete(${board.bnum},'${mb.m_id }','${board.bid}')">삭제</button>
               </td>
            </tr>
         </table>

         <div class="write-form">
            <table style="width: 100%">
               <tr bgcolor="red" align="center" height="30">
                  <td width="20%">작성자</td>
                  <td width="50%">내용</td>
                  <td width="30%">날짜</td>
               </tr>
            </table>
            <table id="rTable" style="width: 100%">
               <tr height="25" align="center">
                  <td width="20%">나야</td>
                  <!-- ${r.r_id} -->
                  <td width="50%">맞춰보라니깐</td>
                  <!-- ${r.r_contents} -->
                  <td width="30%">비오는 어느날</td>
                  <!-- ${r.r_date} -->
               </tr>
               <!--<c:forEach var="r" items="${rList}">-->
               <tr height="25" align="center">
                  <td width="20%">나야</td>
                  <!-- ${r.r_id} -->
                  <td width="50%" align="left">맞춰보라니깐</td>
                  <!-- ${r.r_contents} -->
                  <td width="25%">비오는 어느날</td>
                  <!-- ${r.r_date} -->
                  <td width="5%"><button type="button" class="delreply"
                        onclick="Deletego(${board.bnum},${r.r_contents})">X</button>
               </tr>
               <!--</c:forEach>-->
            </table>
            <form name="rFrm" id="rFrm" class="write-form">
               <textarea rows="5" cols="110" class="write-input ta"
                  name="r_contents" id="comment" placeholder="댓글을 적어주세요"
                  style="resize: none"></textarea>
               <input class="btn-write" type="button" value="댓글전송"
                  onclick="replyInsert(${board.bnum})"
                  style="width: 100%; margin-bottom: 30px">
            </form>
         </div>
      </div>
   </div>
   <!-- Footer -->


</body>
</html>