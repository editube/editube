<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="MyPagenavwrap">
	<div class="profileimagebox">
		<figure class="snip0067 red">
	  		<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/pr-sample2.jpg" alt="sample8" />
	 		<figcaption>
	    		<h2>파리갬성P박S성G기</h2>
	  			<p>프로필사진을 변경하시겠습니까?</p>
	    		<div class="icons">
	    			<a href="#"><i class="ion-ios-home"></i></a>
	    			<a href="#"><i class="ion-email-unread"></i></a>
	    		</div>
	  		</figcaption>
	  		<div class="position">파리갬성P박S성G기</div>
		</figure>
	</div>

	<aside class="sidebar">
    	<nav class="nav">
     		<ul>
				<li class="active"><a  onclick="typechange()" style="cursor: pointer; color: black;" >에디터 모드로 변경</a></li>
				<li><a href="./myUPageSc">찜한 에디터</a></li>
				<li class="MnavMain"><a>요청관리</a>
					<ul class="MnavSub">
						<li><a href="./myUPageReqM">전체내역</a></li>
						<li><a href="./myUPageReqM">받은요청</a></li>
						<li><a href="./myUPageReqM">보낸요청</a></li>
						<li><a href="./myUPageReqM">진행 중</a></li>
						<li><a href="./myUPageReqM">완료</a></li>
						<li><a href="./myUPageReqM">거절 내역</a></li>
					</ul>
				</li>
				<li><a href="./myUPageCash">캐쉬 관리</a></li>
			</ul>
    	</nav>
  	</aside>
</div>
	<script >
		function typechange() {
			var usertype = "${mb.m_usertype}";	
			var nickname = "${mb.m_nickname}";
			
			if(usertype == 1){
					location.href = './typechange?nick='+nickname;
				}
		}
	</script>