<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/chargeStyle.css?after" rel="stylesheet">
</head>

<div class="wrap">
<div class="container">
    <div class="card"></div>
    <div class="card">
    	<img src="resources/images/logo.png" width="100px" class="logo-center" onclick="gohome();">
        <h1 class="title">Cash Transform</h1>
        <form action="access" method="post">
            <div class="input-container"><input type="text" id="money" name="" required autofocus><label>전환할 캐쉬</label>
                <div class="bar"></div>
            </div>
            
            <div class="input-container"><input type="text" id="money" name="" required autofocus><label>계좌번호</label>
                <div class="bar"></div>
            </div>
          
            <div class="button-container">
            <button type="button" onclick="location.href='myEPageCash'" style=width:240px;><span>캐시 전환</span></button>
            </div>
            <div>
            <span><br></span>
            </div>
        </form>
    </div>
</div>
</div>	 

     
   </html>