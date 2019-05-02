<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/back.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/ExIntroduction/back.js"></script>
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
					<li class="part" id="opened_page"><a
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
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/babel_row.jpg"
						alt="sample72" />
					<figcaption>
						<h3>바벨 로우</h3>
					</figcaption>
					<a href="#" id="back_btn1"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/inverted_row.JPG"
						alt="sample21" />
					<figcaption>
						<h3>인버티드 로우</h3>
					</figcaption>
					<a href="#" id="back_btn2"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/lat_pull_down.jpg"
						alt="sample86" />
					<figcaption>
						<h3>랫 풀 다운</h3>
					</figcaption>
					<a href="#" id="back_btn3"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/pull_up.jpg"
						alt="sample72" />
					<figcaption>
						<h3>풀 업</h3>
					</figcaption>
					<a href="#" id="back_btn4"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/romanian_dead_lift.jpg"
						alt="sample21" />
					<figcaption>
						<h3>루마니안 데드 리프트</h3>
					</figcaption>
					<a href="#" id="back_btn5"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/seated_cable_row.jpg"
						alt="sample86" />
					<figcaption>
						<h3>시티드 케이블 로우</h3>
					</figcaption>
					<a href="#" id="back_btn6"></a>
				</figure>
			</div>
		</div>
	</div>
	<div id="ModalContentTotalBox">
		<!-- The Modal -->
		<div id="back1" class="backModal">
			<!-- Modal content -->
			<div class="backModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/babel_row.jpg"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>바벨 로우</h3>
					<p>바벨로우는</p>
				</div>
			</div>
		</div>
		<div id="back2" class="backModal">
			<!-- Modal content -->
			<div class="backModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/inverted_row.JPG"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>인버티드 로우</h3>
					<p>인버티드로우는 턱걸이를 못할때 대체 보조운동으로 아주 좋은 운동이다. 주요 운동 근육은 광배근, 능형근,
						승모근 이며 어깨를 안정화 시키는 어깨주변부 근육까지도 운동 할 수 있다. 또한 체중부하로 운동하기때문에 난이도 조절이
						쉽고 다른 등 운동들에비해 허리에 대한 부담도 거의 없다.</p>
				</div>
			</div>
		</div>
		<div id="back3" class="backModal">
			<!-- Modal content -->
			<div class="backModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/lat_pull_down.jpg"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>랫 풀 다운</h3>
					<p>랫 풀 다운은 몸통은 그대로 두고 케이블을 자신의 몸으로 끌어당기고 풀면서 저항을 주는 운동입니다. 기구를
						끌어당겼을때는 상체가 조금 뒤로 젖혀지는것이 좋습니다.랫 풀 다운의 효과는 광배근의 전반적인 부분에 영향을 미칩니다.
						랫풀다운은 기초를 다지는 차원에서 이용하는것이 효과적이다.</p>
				</div>
			</div>
		</div>
		<div id="back4" class="backModal">
			<!-- Modal content -->
			<div class="backModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/pull_up.jpg"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>풀 업</h3>
					<p>철봉을 손으로 잡고 당겨 턱을 철봉 위까지 끌어 올리는 운동. 맨손 운동의 시작이자 끝. 상완이두근과
						등근육, 전완이 발달되며, 기본적으로 매달리는 힘이 없다면 상완이두고 등이고 힘을 써 볼 기회도 없기 때문에 철봉 바를
						강하게 쥐는 전완근의 힘, 악력과 매달려서 오래 버티기 위한 어깨 골격, 견갑골의 힘이 받쳐줘야 쉽게 올라간다. 거기다
						대흉근과 승모근에도 적지않은 자극을 준다. 결국 상체 전반을 단련하는 셈. 특히 광배근을 단련하는 데에 이 운동만한
						것이 없다고 전해진다. 광배근 발달에 최적인 운동인 만큼, 어깨와 등이 넓어지고 상체가 커보이는 효과를 가져온다.</p>
				</div>
			</div>
		</div>
		<div id="back5" class="backModal">
			<!-- Modal content -->
			<div class="backModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/romanian_dead_lift.jpg"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>루마니안 데드 리프트</h3>
					<p>데드리프트의 형태를 가지고 있으나 세분화된 근육 단련을 목적으로 하는 루마니안 데드리프트는 필수까지는
						아니어도 함께 병행되면 좋은 등운동이다. 일반적으로 데드리프트는 등근육의 중심인 광배근부터 대퇴사두근, 대퇴이두근 등의
						하체를 함께 훈련시키는데 루마니안의 경우 의의가 다르다. 그것은 루마니안 데드리프트가 의도적으로 하체를 배제하여 얻을
						수 있는 효율성을 높이는 운동이기 때문인데, 완벽한 정석의 자세로 루마니안 데드리프트를 진행한다면 근육의 협응력을 한껏
						올릴 수 있다.</p>
				</div>
			</div>
		</div>
		<div id="back6" class="backModal">
			<!-- Modal content -->
			<div class="backModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/seated_cable_row.jpg"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>시티드 케이블 로우</h3>
					<p>앉아서 실시하는 로우 운동의 발달 부위는 등 근육의 광배근 부위 등의 상단부터 중앙까지 넓은 부위를
						차지하고 있는 광배근을 주로 발달시키며, 등의 윗 상단에 있는 승모근과 능형근도 자극을 받게 된다. 시티드 로우는
						등근육을 두껍게 발달 시키는 효과 보다는 더욱 더 선명하고 섬세하게, 탄탄하게 발달시키는 효과를 위해 하는 운동이다.
						이러한 효과를 위해서는 중량은 적당히 잡고 많은 반복 횟수를 가져야한다</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>