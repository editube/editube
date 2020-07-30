<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(document).ready(function(){
   var mnickname = '${mb.m_nickname}';
   if(mnickname == '') {
   $('#suc').css('display','none');
   $('#bef').css('display','block');
   }
   else if(mnickname != '') {
   $('#suc').css('display','block');
   $('#bef').css('display','none');
}
});
</script>
<div class="header">
   <div class="headerWidth">
      <div class="header-left">

         <!-- 메뉴창  -->

         <!-- start header -->
         <div class="hmenu">
            <div id="h2menu">
               <div class="container">
                  <nav id="Hmenu">

                     <input type="checkbox" id="toggle-nav" /> 
                     <label id="toggle-nav-label" for="toggle-nav">
                     	<img id="xicon" src="resources/images/xicon.png">
                     </label>
                     <div class="box">

                        <ul>
                           <li class="h3menu"><a class="h4menu"
                              href="doubleBoard.jsp"> <img
                                 src="resources/images/moni.png"
                                 style="margin-right: 10px; width: 30px;"> Editer
                           </a></li>
                           <ul class="sumenuicon">
                              <li><a href="./doubleBoard">Game</a></li>
                              <li><a href="./doubleBoard">Eating Show</a></li>
                              <li><a href="./doubleBoard">V Log</a></li>
                              <li><a href="./doubleBoard">Beauty</a></li>
                              <li><a href="./doubleBoard">music</a></li>
                              <li><a href="./doubleBoard">Etc</a></li>
                           </ul>

                           <li class="h3menu"><a class="h4menu"
                              href="youtuberBoard.jsp"> <img
                                 src="resources/images/utubeicon.png"
                                 style="margin-right: 10px; width: 30px;"> Youtuber
                           </a></li>

                           <ul class="sumenuicon">
                              <li><a href="./youtuberBoard">Regular</a></li>
                              <li><a href="./youtuberBoard">One-off</a></li>
                           </ul>

                           <li class="h3menu"><a class="h4menu" href="commuBoard.jsp">
                                 <img src="resources/images/gigu.png"
                                 style="margin-right: 8px; width: 30px;"> Community
                           </a></li>

                           <ul class="sumenuicon">
                              <li><a href="./commuBoard">Notice</a></li>
                              <li><a href="./commuBoard">Free Board</a></li>
                              <li><a href="./commuBoard">Together</a></li>
                              <li><a href="./commuBoard">Casting</a></li>
                           </ul>
                        </ul>
                     </div>
                  </nav>
               </div>
            </div>
         </div>

         <!-- 메뉴창 -->
         <svg id="hmicon" xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24" fill="none" stroke="currentColor"
            stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"
            style="width: 35px;">
    <path d="M3 12h18M3 6h18M3 18h18" /></svg>
         <div class="headerlogo">
            <img class="top-left logo" src="resources/images/logo.png"
               onclick="gohome();">
         </div>
      </div>


      <div class="search-bar">
         <input type="text" placeholder="Search..."/>
      </div>

      <div id="bef">
         <div>
            <a href="./loginFrm">Login</a> &nbsp; / &nbsp; <a href="./signPageFrm">Sign Up</a>
         </div>
      </div>
      
         
      <div class="user-settings" id="suc">
         
       <a href="#" id="cart">  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
            fill="currentColor" stroke="currentColor" stroke-width="1.5"
            stroke-linecap="round" stroke-linejoin="round" style="width: 35px; float: left;">
            
            <img src="resources/images/bell.png" alt="" style="width: 35px; float: left;">
            
         </svg>
       </a>
       
<div class="container">
  <div class="shopping-cart">
    <div class="shopping-cart-header">
      <a href="#" id="toggle1"> 
   			 <span id="badge1">알림</span>
   	  </a>
   	  <a href="#" id="toggle2"> 
   			 <span id="badge2">1:1문의</span>
   	  </a>
    </div>
  
  	<div class="mesege">
  
    <ul class="shopping-cart-items">
      <li class="clearfix">
        <span class="item-name">"파리갬성박성기"</span>
        <span class="item-price">님 으로부터 알림 도착</span>
       </li>

     
       <li class="clearfix">
        <span class="item-name">"사다리싫어하는정혜명"</span>
        <span class="item-price">님 으로부터 알림 도착</span>
       </li>
      </li>

    
       <li class="clearfix">
        <span class="item-name">"먹방요정심형용"</span>
        <span class="item-price">님 으로부터 알림 도착</span>
       </li>
      </li>
    </ul>

    <a href="./myEPageReqM" class="button">전체보기</a>
    
   </div><!-- mesege end -->
   
   
   <div class="mesege2">
  
    <ul class="shopping-cart-items">
      <li class="clearfix">
        <span class="item-name">"위즈덤"</span>
        <span class="item-price">님 으로부터 메세지 도착</span>
       </li>

     
       <li class="clearfix">
        <span class="item-name">"두빵댕"</span>
        <span class="item-price">님 으로부터 메세지 도착</span>
       </li>
      </li>

    
       <li class="clearfix">
        <span class="item-name">"먹방요정심형용"</span>
        <span class="item-price">님 으로부터 메세지 도착</span>
       </li>
      </li>
    </ul>

    <a href="./myEPageReqM" class="button">전체보기</a>
    
   </div><!-- mesege end -->
   
  </div> <!--end shopping-cart -->
</div> <!--end container -->
       
         <nav class="t_nav">
            <ul id="userDrop">
            	<li class="headerdrop">
            		<a href="#" class="headerbtn">
            			<img class="user-profile " src="resources/images/${mb.m_oriName}" alt="">
					</a>
            	<div class="dcont">
                    <a onclick ="mypage()" class="headerdropbox"> My Page</a> 
                    <a href="./myInfo"> 계정설정</a>
                    <a href="./logout"> Logout</a>
                </div>
               </li>
            </ul>
         </nav>
      </div>
</div>

   <script>
      function gohome() {
         var id = '${mb.m_id}';

         if (id == '') {
            location.href = './';
         } else if (id != '') {
            location.href = './';
         }
      }
      function mypage() {
         var nickname = "${mb.m_nickname}";
         var usertype = "${mb.m_usertype}";         
         
         if(usertype == 1){
            if(nickname == '관리자'){
               location.href = './mDeal'
            }
            else{
               location.href = './myUPageSc'
            }
         }
         if(usertype == 2){
            location.href = './myEPageSc'
         }
      }
      
      
      (function(){
    	  $("#cart").on("click", function() {
    	    $(".shopping-cart").fadeToggle("fast");
    	  })
    	  
    	})();
      
      
      
      (function(){
    	  $("#toggle1").on("click", function() {
    	    $(".mesege").fadeIn();
    	    $("#badge1").css("background-color", "#0a4bd3");
    	    $("#badge2").css("background-color", "#6394f8");
    	  });
    	  
    	})();
      
      
      (function(){
    	  $("#toggle2").on("click", function() {
    	    $(".mesege2").fadeIn();
    	    $("#badge1").css("background-color", "#6394f8");
    	    $("#badge2").css("background-color", "#0a4bd3");
    	  });
    	  
    	})();
      
      
      (function(){
    	  $("#toggle2").on("click", function() {
    	    $(".mesege").hide();
    	  });
    	  
    	})();
      
      
      (function(){
    	  $("#toggle1").on("click", function() {
    	    $(".mesege2").hide();
    	  });
    	  
    	})();
      
      
           
      
      
       
   </script>