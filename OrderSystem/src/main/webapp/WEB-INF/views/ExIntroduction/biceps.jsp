<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/biceps.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/ExIntroduction/biceps.js"></script>
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
					<li class="part" id="opened_page"><a
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
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/barbell_curl.png"
						alt="sample72" />
					<figcaption>
						<h3>바벨 컬</h3>
					</figcaption>
					<a href="#" id="armtrain_btn1"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/concentrate_curl.png"
						alt="sample21" />
					<figcaption>
						<h3>컨센트레이트 컬</h3>
					</figcaption>
					<a href="#" id="armtrain_btn2"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/dumbbell_curl.png"
						alt="sample86" />
					<figcaption>
						<h3>덤벨 컬</h3>
					</figcaption>
					<a href="#" id="armtrain_btn3"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/ez-var_curl.png"
						alt="sample72" />
					<figcaption>
						<h3>ez-bar 컬</h3>
					</figcaption>
					<a href="#" id="armtrain_btn4"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/hammer_curl.png"
						alt="sample21" />
					<figcaption>
						<h3>해머 컬</h3>
					</figcaption>
					<a href="#" id="armtrain_btn5"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/pretzel_curl.png"
						alt="sample86" />
					<figcaption>
						<h3>프리쳐 컬</h3>
					</figcaption>
					<a href="#" id="armtrain_btn6"></a>
				</figure>
			</div>
		</div>
	</div>
	<div id="ModalContentTotalBox">
		<!-- The Modal -->
		<div id="armtrain1" class="armModal">
			<!-- Modal content -->
			<div class="armModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/barbell_curl.png"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>바벨 컬</h3>
					<p>바벨컬은 대표적인 상완이두근 운동이고, 보통 스트레이트 바 또는 이지바(Ez-Bar)를 이용해 실시하는
						운동이며 우리가 흔히 알고 있는 “알통” 혹은 “봉우리”라고 불리는 대표적인 상완이두근을 단련하기 위해 실시하는
						운동이라 볼 수 있다. 팔 전면부의 크기와 모양을 형성하기 위해 효과적이면서 기본적인 운동이라 할 수 있다. 우리의
						신체 일부인 팔은 전면 이두근과 후면 삼두근으로 나뉘어져 있으며, 이 중 이두근은 단두(안쪽)과 장두(바깥쪽)로
						이루어져 있다. 단두,장두를 나눠서 운동하는 방법이 있지만 이 두가지를 기본적으로 밸런스 있게 잡을 수 있는 운동이
						바로 바벨컬이라고 할 수 있다.</p>
				</div>
			</div>
		</div>
		<div id="armtrain2" class="armModal">
			<!-- Modal content -->
			<div class="armModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/concentrate_curl.png"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>컨센트레이트 컬</h3>
					<p>컨센트레이트 컬은 이두를 완전히 고립시켜 이두부위만 집중적으로 훈련할 수 있다. 의자만 하나 있으면 집에서
						홈트레이닝으로 수행 가능한 운동이다. 주요 운동부위는 상완이두근이다. 컨센트레이트 컬은 덤벨컬과 비슷하지만 반동이
						없다는 점과 팔을 허벅지에 보조하고 있다는 점으로 인해 전면 삼각근 등의 보조근의 사용이 현저하게 줄어든다. 따라서
						컨센트레이트 컬은 상완이두근만을 운동하기에 가장 좋은 방법 중 하나이다.</p>
				</div>
			</div>
		</div>
		<div id="armtrain3" class="armModal">
			<!-- Modal content -->
			<div class="armModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/dumbbell_curl.png"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>덤벨 컬</h3>
					<p>덤벨 컬운동은 알통근육으로 대표되는 이두근 팔근육을 고르게 키워준다. 던벨컬운동은 다른 관절은 사용하지 않고
						팔만 굽혀서 이두근만 고립시킨다. 동작자세에 집중해서 운동하는 것. 한쪽 팔에 더 집중하고 싶다면 따로 드는게 좋다.
						고른 발달을 원하면 두쪽 다 동시에 들어준다.</p>
				</div>
			</div>
		</div>
		<div id="armtrain4" class="armModal">
			<!-- Modal content -->
			<div class="armModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/ez-var_curl.png"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>ez-bar 컬</h3>
					<p>EZ-Bar컬은 손목부담을 덜어주고, 운동효과를 조금 더 올려줄 수 있다. 손잡이 부분을 좁게 혹은 넓게
						잡아서 원하는 부위를 자극 할 수 있다. 이두근의 크기와 힘을 발달시키는 대표적인 운동이다. 핵심은 신체의 반동을
						이용하지 않고, 팔꿈치를 고정시킨 상태에서 절제있는 동작으로 운동한다. 이두근 뿐만 아니라 전완근(팔뚝)의 발달에도 큰
						영향을 끼친다.</p>
				</div>
			</div>
		</div>
		<div id="armtrain5" class="armModal">
			<!-- Modal content -->
			<div class="armModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/hammer_curl.png"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>해머컬</h3>
					<p>해머컬은 이두근 운동 가운데 아주 중요한 역할을 하고 있지만, 동시에 생각보다 많은 사람들이 중요성을 느끼지
						못하는 운동이다. 이두근은 짧은 근육인 단두근과, 긴 근육인 장두근으로 나눌 수 있다. 장두근이 제대로 자극되지 않으면
						근육이 성장하지 않고, 균형이 맞지 않아 밸런스가 깨진다. 헤머컬은 장두근 위주로 단련하는 운동이다.</p>
				</div>
			</div>
		</div>
		<div id="armtrain6" class="armModal">
			<!-- Modal content -->
			<div class="armModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/pretzel_curl.png"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>프리처 컬</h3>
					<p>프리처컬은 일반적인 일어서나 앉아서 하는 바벨운동보다더 힘든 운동이다. 패드에 윗팔을 고정시키고 이두근의
						힘만으로 바벨을 들어올리기 때문이다. 기구를 통해 확실히 팔을 고정시키기 때문에 안정적으로 할 수 있다. 바벨은 좁게
						잡고 가벼운걸 사용한다. 팔 모양을 멋지고 이두근모양을 풍성하게 하는 이두운동이다. 이두근 시작지점을 강화시켜주고
						만드는데 필수인 운동이다.</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>