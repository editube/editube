<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/myInfoUp.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/myInfoUp.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var msg = "${msg}";
		console.log(msg);
		if (msg != "") {
			alert(msg);
			location.reload(true);
		}
	});
</script>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="card"></div>
			<div class="card">
				<img src="resources/images/logo.png" width="100px"
					class="logo-center" onclick="gohome();">
				<div>
					<img class="user-profile" src="resources/images/아이유.jpg" alt="">
				</div>
				<div class="button-container">
					<input id="Storage" type="submit" value="사진 수정"
						style="width: 200px;"> <input id="Storage" type="submit"
						value="사진 삭제" style="width: 200px;">
				</div>
				<div class="input-container">
					아이디 : <input type="text" id="mid" name="m_id" disabled
						value="1223seho" required /> <span class="bar"></span>
				</div>
				<div class="input-container">
					이름 : <input type="text" id="mname" name="m_name" disabled
						value="조서호" required /> <span class="bar"></span>
				</div>
				<div class="input-container">
					생년월일 : <input type="text" id="mbirth" name="m_birth" disabled
						value="1996-12-23" required /> <span class="bar"></span>
				</div>
				<div class="input-container">
					닉네임 : <input type="text" id="mnick" name="m_nick" disabled
						value="장마" required /> <span class="bar"></span>
				</div>

				<form name="myInfoUp" action="main" method="post"
					onsubmit="return check()">
					<div class="input-container">
						<input type="password" name="m_password" required /><label>비밀번호
							변경</label>
						<div class="bar"></div>
					</div>
					<div class="input-container">
						<input type="password" required /><label>비밀번호 확인</label>
						<div class="bar"></div>
					</div>
					<div class="button-container">
						<input id="Storage" type="submit" value="변경내용 저장"
							style="width: 240px;">
					</div>

				</form>
				<div class="button-container">
					<a href="#layer" class="btn-example" style="width: 240px;">회원탈퇴</a>
				</div>
				<div class="dim-layer">
					<div class="dimBg"></div>
					<div id="layer" class="pop-layer">
						<div class="pop-container">
							<div class="pop-conts">
								<!--content //-->
								<h2 class="title">회원 탈퇴</h2>
								<div class="popc">
									<div class="s_title">탈퇴 회원 설문 조사</div>
									<div class="agree">
										<ul>
											<li><input type="checkbox" id="a2" name="전체동의" /> <label
												for="a2"><span>사이트의 필요성을 못 느껴서</span></label></li>
											<li><input type="checkbox" id="a3" name="전체동의" /> <label
												for="a3"><span>다른 아이디로 가입하려고</span></label></li>

											<li><input type="checkbox" id="a4" name="전체동의" /> <label
												for="a4"><span>회원이 너무 적어서</span></label></li>
										</ul>
									</div>
									<p2 style="font-weight:bold; font-size:20px;">기타</p2>
									<div class="field">
										<textarea name="content" id="content" placeholder="내용을 입력하세요."></textarea>
									</div>
								</div>

								<div class="button-container">
									<input id="Storage" type="button" value="회원 탈퇴"
										style="width: 240px;">
								</div>

								<div class="btn-r">
									<a href="#" class="btn-layerClose">Close</a>
								</div>
								<!--// content-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	function check() {
		//form 태그의 내용을 전부 가져오기
		var frm = document.signPageFrm;

		//submit 버튼을 뺀 나머지 input태그의 개수
		var length = frm.length - 1;

		//input 태그 중에 입력이 안된 요소를 확인
		for (var i = 0; i < length; i++) {
			if (frm[i].value == "" || frm[i].value == null) {
				alert(frm[i].title + " 입력!");
				frm[i].focus();
				return false;//action이 실행 안됨.
			}
		}
		//모든 input에 입력이 다 되었을 경우.
		return true;//action이 실행됨.
	}

	//아이디 중복 여부 확인 함수
	//이 함수의 ajax를 실행하기 위해서 
	//인터셉터 대상에서 제외해야 함.
	//servlet-context.xml에 exclude-mapping을 처리.
	function idcheck() {
		var id = $('#mid').val();
		if (id == "") {
			alert("아이디를 입력하세요.");
			$('#mid').focus();
			return;
		}
		var ckObj = {
			"mid" : id
		};
		console.log(ckObj);

		$.ajax({
			url : "idCheck",
			type : "get",
			data : ckObj,
			success : function(data) {
				if (data == "success") {
					alert('사용 가능한 ID입니다.');
				} else {
					alert('이미 등록된 ID입니다.');
					$('#mid').val('');//입력 초기화
					$('#mid').focus();//ID 부분에 포커스 주기
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

	function nickcheck() {
		var nickname = $('#mnickname').val();
		if (nickname == "") {
			alert("닉네임을 입력하세요.");
			$('#mnickname').focus();
			return;
		}
		var ckObj = {
			"mnickname" : nickname
		};
		console.log(ckObj);

		$.ajax({
			url : "nickCheck",
			type : "get",
			data : ckObj,
			success : function(data) {
				if (data == "success") {
					alert('사용 가능한 닉네임입니다.');
				} else {
					alert('이미 등록된 닉네임입니다.');
					$('#mnickname').val('');//입력 초기화
					$('#mnickname').focus();//ID 부분에 포커스 주기
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

	function gohome() {
		var id = '${mb.m_id}';

		if (id == '') {
			location.href = './';
		} else if (id != '') {
			location.href = './';
		}
	}

	$('.btn-example').click(function() {
		var $href = $(this).attr('href');
		layer_popup($href);
	});
	function layer_popup(el) {

		var $el = $(el); //레이어의 id를 $el 변수에 저장
		var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

		var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el.outerHeight()), docWidth = $(
				document).width(), docHeight = $(document).height();

		// 화면의 중앙에 레이어를 띄운다.
		if ($elHeight < docHeight || $elWidth < docWidth) {
			$el.css({
				marginTop : -$elHeight / 2,
				marginLeft : -$elWidth / 2
			})
		} else {
			$el.css({
				top : 0,
				left : 0
			});
		}

		$el.find('a.btn-layerClose').click(function() {
			isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
			return false;
		});

		$('.layer .dimBg').click(function() {
			$('.dim-layer').fadeOut();
			return false;
		});

	}
</script>
</html>
