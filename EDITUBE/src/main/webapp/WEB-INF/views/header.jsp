<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

 <div class="header">
  <div class="headerWidth">
  <div class="header-left">
   <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" style="width: 35px;">
    <path d="M3 12h18M3 6h18M3 18h18" /></svg>
   <div class="headerlogo">
   <img class="top-left logo" src="resources/images/logo.png" onclick="gohome();">   
   </div>
  </div>
   <div class="search-bar">
    <input type="text" placeholder="Search..." />
   </div>
  <div class="user-settings">
   <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" style="width: 35px;">
    <path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9M13.73 21a2 2 0 01-3.46 0" /></svg>
      <nav class="t_nav">
         <ul id="userDrop">
            <li class="headerdrop"><a href="#" class="headerbtn"><img class="user-profile " src="resources/images/pororo.png" alt=""></a>
               <div class="dcont">
                  <a href="#" class="headerdropbox">My Page</a> 
                  <a href="#">계정설정</a> 
                  <a href="#">Logout</a>
               </div>
            </li>
         </ul>
      </nav>
   </div>
   </div>
</div>
<script>
   function gohome() {
      var id = '${mb.m_id}';

      if (id == '') {
         location.href = './';
      } else if (id != '') {
         location.href = './myEPageSc';
      }
   }   
</script>