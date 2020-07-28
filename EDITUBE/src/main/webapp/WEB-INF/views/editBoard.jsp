<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>편집자 게시판</title>

<link
   href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
   rel="stylesheet" />

<link href="resources/css/sideBar.css?after" rel="stylesheet">
<link href="resources/css/editBoard.css?after" rel="stylesheet">
<link href="resources/css/headerstyle.css?after" rel="stylesheet">
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/sideBar.js"></script>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">

</head>
<body>
<header>
		<jsp:include page="header.jsp"></jsp:include>
</header>
<div class="all">
	<jsp:include page="editNav.jsp"></jsp:include>
<table class="editBoard">
	<th><h3>게임방송 편집자 프로필</h3></th>
	<span class="dropdown-el">
    <input type="radio" name="sortType" value="Relevance" checked="checked" id="sort-relevance"><label for="sort-relevance">선택</label>
    <input type="radio" name="sortType"  id="sort-best"><label for="sort-best">최신순</label>
    <input type="radio" name="sortType" id="sort-low"><label for="sort-low">거래순</label>
    <input type="radio" name="sortType" id="sort-high"><label for="sort-high">평점순</label>
    <input type="radio" name="sortType" id="sort-brand"><label for="sort-brand">인기순</label>
  </span>
	<tr class="tr">
	<td>
	<div class="card">
	<a class="card-image" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-500.jpg">
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg" alt="Psychopomp" />
	</a>
		<a class="card-description" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank">
			<h4>파리갬성으로 편집해드려요</h4>
			<p>40,000원</p>
		</a>
	</div>		
	</td>
	<td>
	<div class="card">
	<a class="card-image" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-500.jpg">
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg" alt="Psychopomp" />
	</a>
		<a class="card-description" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank">
			<h4>파리갬성으로 편집해드려요</h4>
			<p>40,000원</p>
		</a>	
	</div>
	</td>
	<td>
	<div class="card">
	<a class="card-image" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-500.jpg">
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg" alt="Psychopomp" />
	</a>
		<a class="card-description" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank">
			<h4>파리갬성으로 편집해드려요</h4>
			<p>40,000원</p>
		</a>
	</div>
	</td>	
	</tr>
	<tr>
	<td>
	<div class="card">
	<a class="card-image" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-500.jpg">
			<img style=width:auto; src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg" alt="Psychopomp" />
	</a>
		<a class="card-description" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank">
			<h4>파리갬성으로 편집해드려요</h4>
			<p>40,000원</p>
		</a>	
	</div>
	</td>
	<td>
	</td>
	<td>
	</td>	
	</tr>
	<tr>
	<td>
	<div class="card">
	<a class="card-image" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-500.jpg">
			<img style=width:auto; src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg" alt="Psychopomp" />
	</a>
		<a class="card-description" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank">
			<h4>파리갬성으로 편집해드려요</h4>
			<p>40,000원</p>
		</a>	
	</div>
	</td>
	<td>
	</td>
	<td>
	</td>	
	</tr>
	
</table>
</div>
<script type="text/javascript">
$('.dropdown-el').click(function(e) {
  e.preventDefault();
  e.stopPropagation();
  $(this).toggleClass('expanded');
  $('#'+$(e.target).attr('for')).prop('checked',true);
});
$(document).click(function() {
  $('.dropdown-el').removeClass('expanded');
});
</script>
</body>
</html>