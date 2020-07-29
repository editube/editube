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
         <h1>Write</h1>

         <form action="writecom" method="GET" id="file-form">
            <!-- POST로 나중에 바꾸기 -->
            <div class="field">
               <input type="text" name="filename" id="filename"
                  placeholder="제목을 입력하세요.">
            </div>
            <div class="field">
               <textarea name="content" id="content" placeholder="내용을 입력하세요."></textarea>
            </div>
            <div class="btn-field">
               <button type="button" id=cancel
                  onclick="location.href='./commuBoard'">취소</button>
               <button type="submit">저장</button>
               <div id="messages"></div>
            </div>
         </form>
      </div>
   </div>
   
</body>
</html>