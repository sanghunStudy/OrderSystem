<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/lowbody.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/ExIntroduction/lowbody.js"></script>
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
					<li class="part"><a
						href="${pageContext.request.contextPath}/ExIntroduction/triceps">삼두</a></li>
					<li class="part" id="opened_page"><a
						href="${pageContext.request.contextPath}/ExIntroduction/lowbody">하체</a></li>
				</ul>
			</div>
			<div class="info">
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/hiba_squat.png"
						alt="sample72" />
					<figcaption>
						<h3>하이바 스쿼트</h3>
					</figcaption>
					<a href="#" id="lowbody_btn1"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_curl.png"
						alt="sample21" />
					<figcaption>
						<h3>레그 컬</h3>
					</figcaption>
					<a href="#" id="lowbody_btn2"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_extension.png"
						alt="sample86" />
					<figcaption>
						<h3>레그 익스텐션</h3>
					</figcaption>
					<a href="#" id="lowbody_btn3"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_press.png"
						alt="sample72" />
					<figcaption>
						<h3>레그 프레스</h3>
					</figcaption>
					<a href="#" id="lowbody_btn4"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/low_bar_squat.png"
						alt="sample21" />
					<figcaption>
						<h3>로우 바 스쿼트</h3>
					</figcaption>
					<a href="#" id="lowbody_btn5"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/lunge.png"
						alt="sample86" />
					<figcaption>
						<h3>런지</h3>
					</figcaption>
					<a href="#" id="lowbody_btn6"></a>
				</figure>
			</div>
		</div>
	</div>
	<div id="ModalContentTotalBox">
		<!-- The Modal -->
		<div id="lowbody1" class="lowbodyModal">
			<!-- Modal content -->
			<div class="lowbodyModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/hiba_squat.png"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>하이바 스쿼트</h3>
					<p>바의 위치를 목이 시작되는 승모의 윗부분에 위치하고 실시합니다.</p>
				</div>
			</div>
		</div>
		<div id="lowbody2" class="lowbodyModal">
			<!-- Modal content -->
			<div class="lowbodyModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_curl.png"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>레그컬</h3>
					<p>다리패드가 자신의 아킬레스건 위에 위치하여 양다리가 11자 모양이 될 수 있도록 합니다. 허벅지 뒷근육의
						힘을 이용해서 다리를 수축시켜줍니다. 발끝은 다리와 90도가 되도록 합니다. 다리의 근육힘을 다 풀지 않고 어느정도
						살짝 굽힌 상태까지 내리듯이 다리를 굽혀서 원위치합니다.</p>
				</div>
			</div>
		</div>
		<div id="lowbody3" class="lowbodyModal">
			<!-- Modal content -->
			<div class="lowbodyModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_extension.png"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>레그 익스텐션</h3>
					<p>앉았을때 무릎 바로 아래부분이 머신에 살짝 떨어질정도 위 의자 위치, 발목 살짝 윗부분에 가동부분이 오게
						해야한다. 엉덩이와 등을 떼지 않는다. 근육은 끝까지 수축시키되 뼈는 끝까지 펴지말고, 이완시킬때에도 긴장을
						놔버릴때까지 완전히 펴지 않는다.</p>
				</div>
			</div>
		</div>
		<div id="lowbody4" class="lowbodyModal">
			<!-- Modal content -->
			<div class="lowbodyModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_press.png"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>레그 프레스</h3>
					<p>머신의 발판에 양발을댈때 발 앞꿈치의 끝이 발판에서 조금 위에 위치할 수 있도록 합니다. 엉덩이와 등을
						받침대에 딱 부착시켜놓고 양다리는 11자 모양으로 곧게 위치시켜주고 다리 사이의 간격은 자신의 어깨너비만큼 벌립니다.
						허벅지의 힘을 이용하여 발바닥으로 민다는 느낌으로 발판을 밀어줍니다. 허벅지 사이의 간격이 벌어지거나 좁혀지지 않고
						간격을 그대로 유지하도록 합니다. 다시 다리를 구부려 다리사이의 각도가 90도가 되도록 원래위치로 돌아옵니다.</p>
				</div>
			</div>
		</div>
		<div id="lowbody5" class="lowbodyModal">
			<!-- Modal content -->
			<div class="lowbodyModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/low_bar_squat.png"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>로우바 스쿼트</h3>
					<p>양발의 간격은 자신의 어깨너비 또는 그보다 약간 더 벌리는게 좋습니다. 바로 엉덩이를 수직이동이 아닌
						엉덩이를 약간 뒤쪽으로 빼면서 앉아줍니다.</p>
				</div>
			</div>
		</div>
		<div id="lowbody6" class="lowbodyModal">
			<!-- Modal content -->
			<div class="lowbodyModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/lunge.png"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>런지</h3>
					<p>먼저 엉덩이 넓이로 다리를 벌리고 선 후, 상체를 펴고 코어에 힘을 주고, 어깨에 힘을 풀고, 턱을 치켜
						드세요. 그리고 오른쪽 다리를 뻗어 한 걸음 나아가면서 두 무릎이 90도 각도를 이룰 때까지 엉덩이를 낮추어 줍니다.
						앞쪽에 위치한 무릎이 발목 바로 위에 있도록 해야 하며, 다른 쪽 무릎이 바닥에 강하게 닿지 않도록, 부드럽게 내리는
						것도 중요합니다. 무게 중심은 앞쪽에 있는 발뒤꿈치에 실어서 일어설 때 적절하게 사용할 수 있도록 하며, 계속해서
						오른쪽 발을 앞으로 내밀어서 자세를 만들어 줍니다. 숙이고 들어 올리는 반복적인 움직임을 30초 동안 진행한 후, 반대
						방향으로 30초 동안 진행하면 1회가 완료됩니다.</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>