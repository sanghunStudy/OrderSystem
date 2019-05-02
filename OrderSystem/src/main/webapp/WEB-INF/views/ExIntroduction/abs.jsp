<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/abs.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/ExIntroduction/abs.js"></script>
<script>
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>
</head>
<jsp:include page="../gnb/head.jsp" flush="true" />
<body>
	<div class="container">
		<h1>TRAINING</h1>
		<div class="train">
			<div class="train_menu">
				<ul class="menu">
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/chest">가슴</a></li>
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/back">등</a></li>
					<li class="part" id="opened_page"><a
						href="${pageContext.request.contextPath}/ExIntroduction/abs">복근</a></li>
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/shoulder">어깨</a></li>
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/biceps">이두</a></li>
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/triceps">삼두</a></li>
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/lowbody">하체</a></li>
				</ul>
			</div>
			<div class="info">
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/ab_wheel_rollout.jpg"
						alt="sample72" />
					<figcaption>
						<h3>앱 휠 롤아웃</h3>
					</figcaption>
					<a href="#" id="abs_btn1"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/decline_weighted_workout.jpg"
						alt="sample21" />
					<figcaption>
						<h3>디클라인 웨이트 워크아웃</h3>
					</figcaption>
					<a href="#" id="abs_btn2"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/deep_bar_L_sit_hold.jpg"
						alt="sample86" />
					<figcaption>
						<h3>딥 바 L 싯 홀드</h3>
					</figcaption>
					<a href="#" id="abs_btn3"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/leg_raise.jpg"
						alt="sample72" />
					<figcaption>
						<h3>레그 레이즈</h3>
					</figcaption>
					<a href="#" id="abs_btn4"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/plank.jpg"
						alt="sample21" />
					<figcaption>
						<h3>플랭크</h3>
					</figcaption>
					<a href="#" id="abs_btn5"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/tozutubar.jpg"
						alt="sample86" />
					<figcaption>
						<h3>토즈투바</h3>
					</figcaption>
					<a href="#" id="abs_btn6"></a>
				</figure>
			</div>
		</div>
	</div>
	<div id="ModalContentTotalBox">
		<!-- The Modal -->
		<div id="abs1" class="absModal">
			<!-- Modal content -->
			<div class="absModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/ab_wheel_rollout.jpg"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>앱 휠 롤아웃</h3>
					<p>무릎 꿇기 자세를 취한 후 바닥에 바벨을 하나 놓고 양손을 어깨너비로 벌려 오버핸드 그립으로 잡습니다.
						양어깨가 바벨 바로 위에 와야 합니다. 양무릎은 고정 자세로 유지하면서 앞에 있는 바를 밀어서 양팔이 몸 앞에서 완전히
						펴지도록 합니다. 잠시 멈췄다가 방향을 반대쪽으로 바꿔 다시 시작 위치로 돌아옵니다.</p>
				</div>
			</div>
		</div>
		<div id="abs2" class="absModal">
			<!-- Modal content -->
			<div class="absModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/decline_weighted_workout.jpg"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>디클라인 웨이트 워크아웃</h3>
					<p>디클라인 웨이트 워크아웃은 기존에 있는 운동인 디클라인 벤치 싯업에 중량을 추가한 운동이다. 벤치에 누워
						다리를 고정시킨다. 손은 가슴에 모으거나 머리뒤를 가볍게 감싼다. 천천히 복부의 힘을 이용하여 상체를 들어올린다. 정점
						수축시 잠시 멈춘 후 천천히 시작자세로 돌아간다.</p>
				</div>
			</div>
		</div>
		<div id="abs3" class="absModal">
			<!-- Modal content -->
			<div class="absModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/deep_bar_L_sit_hold.jpg"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>딥 바 L 싯 홀드</h3>
					<p>양손을 바에 고정하고몸을 띄워서 무릎을 접으면서 들어올려 L자 자세를 유지하며 버티는 동작입니다.</p>
				</div>
			</div>
		</div>
		<div id="abs4" class="absModal">
			<!-- Modal content -->
			<div class="absModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/leg_raise.jpg"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>레그 레이즈</h3>
					<p>바닥에 바르게 누워 다리를 모아 쭉 펴고 90도로 올렸다가 다시 내려주는 것입니다. 다리가 90도 이상을
						넘어가는것은 피하는 것이 좋고 골반이나 몸이 흔들리지 않도록 힘을줘 고정하고 운동해야 합니다.</p>
				</div>
			</div>
		</div>
		<div id="abs5" class="absModal">
			<!-- Modal content -->
			<div class="absModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/plank.jpg"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>플랭크</h3>
					<p>어깨가 올라가지 않도록 긴장을 푼다. 배는 일직선을 유지하며 힘을주고 엉덩이에도 힘을 준다. 종아리와
						허벅지는 최대한 모아주고 무릎은 굽히지 않는다.</p>
				</div>
			</div>
		</div>
		<div id="abs6" class="absModal">
			<!-- Modal content -->
			<div class="absModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/tozutubar.jpg"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>토즈투바</h3>
					<p>어깨를 흔들면서 몸의 중심선을 뒤에두고 당긴후 무릎을 들어줍니다. 무릎을 들어주는게 잘 될 경우 무릎을
						가슴쪽으로 올려줍니다. 마지막으로 발을 바에 닿게 다리를 뻗어줍니다.</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>