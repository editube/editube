<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="MyPagenavwrap">
	<div class="profileimagebox">
		<figure class="snip0067 red">
	  		<img src="resources/images/${mb.m_oriName}" alt="sample8" />
	 		<figcaption>
	    		<h2>파리갬성P박S성G기</h2>
	  			<p>프로필사진을 변경하시겠습니까?</p>
	    		<div class="icons">
	    			<a href="./myInfo"><i class="ion-ios-home"><img alt="수정" src="../resources/images/연필.png"></i></a>
	    		
	    		</div>
	  		</figcaption>
	  		<div class="position">${mb.m_nickname}</div>
		</figure>
	</div>

	<aside class="sidebar">
    	<nav class="nav">
     		<ul>
				<li class="active"><a  href="./myEPageSc" >에디터 모드로 변경</a></li>
				<li><a href="./myUPageSc">찜한 에디터</a></li>
				<li class="MnavMain"><a>요청관리</a>
					<ul class="MnavSub">
						<li><a href="./myUPageReqM">전체내역</a></li>
						<li><a onclick="revReq(1)">받은요청</a></li>
						<li><a onclick="revReq(2)">보낸요청</a></li>
						<li><a onclick="revReq(3)">진행 중</a></li>
						<li><a onclick="revReq(4)">완료</a></li>
						<li><a onclick="revReq(5)">거절 내역</a></li>
					</ul>
				</li>
				<li><a href="./cashList">캐쉬 관리</a></li>
			</ul>
    	</nav>
  	</aside>
</div>



<script type="text/javascript">
function revReq(num){
 	location.href='./myUPageReqM?status=' + num;
 }
</script>