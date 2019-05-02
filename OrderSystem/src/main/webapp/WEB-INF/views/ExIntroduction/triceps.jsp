<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/triceps.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/ExIntroduction/triceps.js"></script>
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
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/abs">복근</a></li>
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/shoulder">어깨</a></li>
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/biceps">이두</a></li>
					<li class="part" id="opened_page"><a
						href="${pageContext.request.contextPath}/ExIntroduction/triceps">삼두</a></li>
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/lowbody">하체</a></li>
				</ul>
			</div>
			<div class="info">
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/cable_overhead_extension.jpg"
						alt="sample72" />
					<figcaption>
						<h3>케이블 오버헤드 익스텐션</h3>
					</figcaption>
					<a href="#" id="triceps_btn1"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/cable_triesps_pushdown.jpg"
						alt="sample21" />
					<figcaption>
						<h3>케이블 트라이셉스 푸시 다운</h3>
					</figcaption>
					<a href="#" id="triceps_btn2"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/close_grip_bench_press.jpg"
						alt="sample86" />
					<figcaption>
						<h3>클로즈 그립 벤치 프레스</h3>
					</figcaption>
					<a href="#" id="triceps_btn3"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/dips.jpg"
						alt="sample72" />
					<figcaption>
						<h3>딥스</h3>
					</figcaption>
					<a href="#" id="triceps_btn4"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/dumbbell_kickback.jpg"
						alt="sample21" />
					<figcaption>
						<h3>덤벨 킥 백</h3>
					</figcaption>
					<a href="#" id="triceps_btn5"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/lying_triesps_extension.jpg"
						alt="sample86" />
					<figcaption>
						<h3>라잉 트라이셉스 익스텐션</h3>
					</figcaption>
					<a href="#" id="triceps_btn6"></a>
				</figure>
			</div>
		</div>
	</div>
	<div id="ModalContentTotalBox">
		<!-- The Modal -->
		<div id="triceps1" class="tricepsModal">
			<!-- Modal content -->
			<div class="tricepsModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/cable_overhead_extension.jpg"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>케이블 오버헤드 익스텐션</h3>
					<p>케이블 링크에 걸어주고 하이풀리 위치에 걸어서 본인 신장 위로 위치하게끔 합니다. 다리를 교차되도록 엇갈려
						서서 전후방 밸런스를 잡기 용이학끔 스탠스를 유지한 후 정수리 뒤로부터 머리 앞으로 팔꿈치를 펴주며 삼두를
						수축시킵니다. 호흡은 팔꿈치를 모두 펴는 2/3 지점에서 날숨을 쉬어주시면 됩니다.</p>
				</div>
			</div>
		</div>
		<div id="triceps2" class="tricepsModal">
			<!-- Modal content -->
			<div class="tricepsModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/cable_triesps_pushdown.jpg"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>케이블 트라이셉스 푸쉬다운</h3>
					<p>케이블 머신에 핸들을 준비 자세로 가져갔을 때보다 좀 더 높게 조정하여 세트 내내 근육이 무게의 힘을 받고
						있도록 한다. 기구와 몸 사이의 거리나 상체가 기울어진 정도는 개인의 기호에 따라 다르지만, 팔꿈치가 골반보다 앞에
						위치해서 운동 내내 고정된 상태를 유지하는 것만 지켜주면 된다. 또한 운동 반경을 팔꿈치가 90도쯤 접어지는 선에서
						끝내거나 팔꿈치가 완전히 굽어지는 선까지 올라오거나 하는데, 트레이너에 따라 전자는 팔꿈치 관절에 무리를 주기 때문에
						후자를 권하는 트레이너들도 있다.</p>
				</div>
			</div>
		</div>
		<div id="triceps3" class="tricepsModal">
			<!-- Modal content -->
			<div class="tricepsModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/close_grip_bench_press.jpg"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>클로즈 그립 벤치 프레스</h3>
					<p>바를 벌어지지 않게끔 몸통에 잘 붙여주는것이 중요합니다. 바벨을 드는것보다는 밀고 당기는 느낌으로
						실시해야합니다.</p>
				</div>
			</div>
		</div>
		<div id="triceps4" class="tricepsModal">
			<!-- Modal content -->
			<div class="tricepsModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/dips.jpg"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>딥스</h3>
					<p>바를 잡을땐 손목이 1자로 바르게 설수 있도록 잡아 운동해야합니다. 몸통이 바닥쪽으로 숙인 자세를 유지하며
						시선은 항상 바닥을 향하며 상체는 바닥을 향해 숙여줘야합니다. 딥스 자세에서 팔꿈치가 양쪽으로 벌어지지 않도록
						조심해야하며 몸통과의 간격도 너무 붙지도 떨어지지도 않는 적당한 거리를 유지하며 발은 항상 모아서 뒤로 보낸 자세로
						운동해야합니다.</p>
				</div>
			</div>
		</div>
		<div id="triceps5" class="tricepsModal">
			<!-- Modal content -->
			<div class="tricepsModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/dumbbell_kickback.jpg"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>덤벨 킥백</h3>
					<p>무릎을 살짝 구부리고 상체는 앞으로 약간 숙이는 동시에 등은 곧게 폅니다. 양손에 덤벨을 쥐고 팔을 안쪽으로
						살짝 구부려 옆구리에 고정시킵니다. 이자세에서 팔이 지면과 수평을 이룰 때까지 덤벨을 뒤로 당깁니다. 이 자세에서
						1~2초간 정지합니다. 천천히 저항을 느끼며 덤벨을 내리면서 처음 시작자세로 돌아옵니다.</p>
				</div>
			</div>
		</div>
		<div id="triceps6" class="tricepsModal">
			<!-- Modal content -->
			<div class="tricepsModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/lying_triesps_extension.jpg"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>라잉 트라이셉스 익스텐션</h3>
					<p>바벨을 어깨보다도 좁게 잡아야하며 잡은 뒤에는 바벨을 위로 들어주는데, 이때 위치는 이마쪽에 위치할수 있도록
						팔의 각도를 비스듬히 하여 올려준다. 윗쪽의 팔과 팔꿈치는 움직이지 않고 고정하면서 그대로 굽혀 머리 윗쪽으로 천천히
						바벨을 내려준다. 팔꿈치는 운동 중 움직이지 않고 최대한 고정하는것이 중요하다.</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>