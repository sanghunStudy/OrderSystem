<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/chest.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/ExIntroduction/chest.js"></script>
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
					<li class="part" id="opened_page"><a
						href="${pageContext.request.contextPath}/ExIntroduction/chest">가슴</a></li>
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/back">등</a></li>
					<li class="part"><a
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
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/cable_crossover.png"
						alt="sample72" />
					<figcaption>
						<h3>케이블 크로스오버</h3>
					</figcaption>
					<a href="#" id="chest_btn1"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dickle_bench_press.png"
						alt="sample21" />
					<figcaption>
						<h3>디클 벤치 프레스</h3>
					</figcaption>
					<a href="#" id="chest_btn2"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dumbbell_fly.png"
						alt="sample86" />
					<figcaption>
						<h3>덤벨 플라이</h3>
					</figcaption>
					<a href="#" id="chest_btn3"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dumbbell_pull_over.png"
						alt="sample72" />
					<figcaption>
						<h3>덤벨 풀 오버</h3>
					</figcaption>
					<a href="#" id="chest_btn4"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/flat_bench_press.png"
						alt="sample21" />
					<figcaption>
						<h3>플랫 벤치 프레스</h3>
					</figcaption>
					<a href="#" id="chest_btn5"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/incline_bench_press.png"
						alt="sample86" />
					<figcaption>
						<h3>인클라인 벤치 프레스</h3>
					</figcaption>
					<a href="#" id="chest_btn6"></a>
				</figure>
			</div>
		</div>
	</div>
	<div id="ModalContentTotalBox">
		<!-- The Modal -->
		<div id="chest1" class="chestModal">
			<!-- Modal content -->
			<div class="chestModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/cable_crossover.png"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>케이블 크로스오버</h3>
					<p>손잡이를 잡고 가운데 자리를 잡아 준비한다. 발의 간격은 약간 좁게 서도 좋고 동작을 수행하기 편한 보폭으로
						잡아준다. 상체는 살짝 앞으로 숙여주고 무릎도 살짝 굽혀준다. 손잡이를 중앙 하단으로 끌어 내려 모아주는데, 팔은 약간
						안쪽으로 굽혀져 있어야 한다.</p>
				</div>
			</div>
		</div>
		<div id="chest2" class="chestModal">
			<!-- Modal content -->
			<div class="chestModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dickle_bench_press.png"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>디클라인 벤치프레스</h3>
					<p>디클라인 벤치 또는 한쪽을 중량판으로 높여 기울인 벤치 위에 등을 대고 눕습니다. 양손을 어깨너비보다 약간
						넓게 벌려 오버핸드 그립으로 바벨을 잡습니다. 양팔을 완전히 펴서 가슴 위로 듭니다. 천천히 주의를 기울여 천천히 바를
						가슴 쪽으로 내립니다. 팔꿈치를 몸 옆에 가까이 붙여 아래로 내려왔을 때 팔이 몸통과 45도 각도를 이루도록 합니다.
						잠시 멈춘 후, 바를 다시 처음 위치로 밀어 올립니다.</p>
				</div>
			</div>
		</div>
		<div id="chest3" class="chestModal">
			<!-- Modal content -->
			<div class="chestModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dumbbell_fly.png"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>덤벨 플라이</h3>
					<p>손바닥이 서로 마주보게 덤벨을 잡아 허벅지에 올려 놓고, 뒤로 드러누운 후 가슴위로 양팔을 쭉 밀어서
						붙혀주세요. 팔꿈치를 자연스레 살짝 구부리며 가슴 옆방향으로 팔을 천천히 펼쳐줍니다. 호흡을 내쉬며 날개짓 하듯 반원을
						그리며 덤벨을 모으세요. 동작의 정접에서 가슴근육을 강하게 한번 짜준 후 호흡을 들이쉬며 팔꿈치를 자연스레 살짝
						구부리며 가슴 옆방향으로 팔을 천천히 펴주는동작을 반복한다.</p>
				</div>
			</div>
		</div>
		<div id="chest4" class="chestModal">
			<!-- Modal content -->
			<div class="chestModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dumbbell_pull_over.png"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>덤벨 풀 오버</h3>
					<p>먼저 양손을 포개서 헤드밑을 단단히 받쳐 아령을 세로로 세워잡아줍니다. 벤치는 옆으로 길게 놓습니다. 아령을
						위로 곧게 들어줄때 팔꿈치를 처음부터 다 펴지 않고 살짝 굽혀줍니다. 머리 윗쪽으로 넓게 포물선을 그리듯이 서서히
						그대로 팔꿈치를 내려줍니다 자연스럽게 아치형이 되도록 둡니다. 호흡은 들이마시고 멈춘 상황에서 동작을 1회 수행하고
						내쉽니다.</p>
				</div>
			</div>
		</div>
		<div id="chest5" class="chestModal">
			<!-- Modal content -->
			<div class="chestModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/flat_bench_press.png"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>플랫 벤치프레스</h3>
					<p>들어올릴 중량판을 바에걸고, 고정케이스의 핀을 돌려서 플레이트가 미끄러지지 않게 잘 조여줍니다. 벤치에 누운
						후 다리는 조금 벌린 상태로 발바닥을 지면에 안정적으로 밀착 시킵니다 상체는 등과 골반을 벤치에 밀착시키고 허리 부분만
						살짝 들어올려서 아치형을 만든 후 어깨너비보다 조금 넓게 바를 잡습니다. 바벨을 고정틀에서 들어올려 가슴 중앙쪽으로
						이동시킨 다음에 호흡을 들이쉬면서 바벨을 내리고, 호흡을 내쉬면서 들어올립니다 바벨을 내릴때 가슴에 밀착시키지 말고
						가슴위 1cm지점에서 멈춘후 반복합니다. 반복횟수는 10렙을 목표로 잡고 세트수는 4~5세트 정도로 설정합니다</p>
				</div>
			</div>
		</div>
		<div id="chest6" class="chestModal">
			<!-- Modal content -->
			<div class="chestModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/incline_bench_press.png"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>인클라인 벤치프레스</h3>
					<p>인클라인 벤치프레스는 평평한 벤치가 아니라 위로 비스듬히 올라온 벤치에 누워 실시합니다. 몸을 벤치에 바르게
						붙여 누웠다면 플랫 벤치프레스와 똑같이 바벨을 들었다가 내리며 운동하면 됩니다. 팔은 언제나 수직으로 똑바로
						올려야합니다. 바벨을 가슴에 가까이 내렸을때 가슴이 쭈우욱 펴지는것처럼 최대한 당겨줬다가 다시 밀어내야합니다.</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>