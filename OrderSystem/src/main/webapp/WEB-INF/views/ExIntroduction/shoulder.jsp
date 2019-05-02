<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/shoulder.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/ExIntroduction/shoulder.js"></script>
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
					<li class="part" id="opened_page"><a
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
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/behind_neck_press.png"
						alt="sample72" />
					<figcaption>
						<h3>비하인드 넥프레스</h3>
					</figcaption>
					<a href="#" id="shoulder_btn1"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/bent_over_lateral_raise.png"
						alt="sample21" />
					<figcaption>
						<h3>벤트 오버 레터럴 레이즈</h3>
					</figcaption>
					<a href="#" id="shoulder_btn2"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/dumbbell_shoulder_press.png"
						alt="sample86" />
					<figcaption>
						<h3>덤벨 숄더 프레스</h3>
					</figcaption>
					<a href="#" id="shoulder_btn3"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/front_raise.png"
						alt="sample72" />
					<figcaption>
						<h3>프론트 레이즈</h3>
					</figcaption>
					<a href="#" id="shoulder_btn4"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/military_press.png"
						alt="sample21" />
					<figcaption>
						<h3>밀리터리 프레스</h3>
					</figcaption>
					<a href="#" id="shoulder_btn5"></a>
				</figure>
				<figure class="snip1273">
					<img
						src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/side-lateral_raise.png"
						alt="sample86" />
					<figcaption>
						<h3>사이드 레터럴 레이즈</h3>
					</figcaption>
					<a href="#" id="shoulder_btn6"></a>
				</figure>
			</div>
		</div>
	</div>
	<div id="ModalContentTotalBox">
		<!-- The Modal -->
		<div id="shoulder1" class="shoulderModal">
			<!-- Modal content -->
			<div class="shoulderModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/behind_neck_press.png"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>비하인드 넥프레스</h3>
					<p>비하인드 넥프레스는 바벨을 내릴 때 머리 뒤로 내리는 운동이다. 어깨의 삼각근에 수직으로 내리 꽂아 주는
						동작이기 때문에 어깨에 자극이 즉각적으로 가게되서 어깨 근육의 효과가 높다. 어깨는 원래 부상의 위험이 높은 부위이다.
						비하인드 넥프레스는 자세를 잘못잡고 제대로 컨트롤 하지 못하면 바로 어깨에 부상을 줄 수 있다. 그래서 초보자에게는
						보통 추천하지 않고 바벨을 잘 다룰수 있는 운동인부터 수행하는것이 안전하다.</p>
				</div>
			</div>
		</div>
		<div id="shoulder2" class="shoulderModal">
			<!-- Modal content -->
			<div class="shoulderModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/bent_over_lateral_raise.png"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>벤트 오버 레터럴 레이즈</h3>
					<p>벤트 오버 레터럴 레이즈는 앞과 측면 그리고 후면까지 고루 자극하기 좋은 운동 종류다. 기본 레터럴 레이즈는
						앞과 측면 삼각근에 가장 효과적인것으로 꼽히는 운동이다. 벤트오버 레터럴 레이즈 자세는 어깨의 뒷부분 후면을 자극하기에
						가장 좋은 자세다. 팔을 옆으로 뻗는 동작은 기본 레터럴 레이즈와 동일하나, 벤트오버는 몸통을 숙이고 하는 운동이다.
						레터럴레이즈는 팔 자체를 뻗어 들어올리는 동작때문에 삼각근 - 뒷면에 가장 많은 자극을 주고 그 다음으로 등근육에
						자극이 가게 되는 운동이다.</p>
				</div>
			</div>
		</div>
		<div id="shoulder3" class="shoulderModal">
			<!-- Modal content -->
			<div class="shoulderModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/dumbbell_shoulder_press.png"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>덤벨 숄더 프레스</h3>
					<p>팔 운동중
						하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔
						운동중
						하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
				</div>
			</div>
		</div>
		<div id="shoulder4" class="shoulderModal">
			<!-- Modal content -->
			<div class="shoulderModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/front_raise.png"
					alt="sample72" />
				<div id="ModalContentTitle">
					<h3>프론트 레이즈</h3>
					<p>프론트 레이즈는 덤벨을 바깥, 정면으로 들면서 어깨를 단련시키는 운동이다. 단순관절운동으로 동작이 복잡하지
						않고 다양한 근육과 관절을 사용하지 않는다. 한마디로 어깨에만 집중할 수 있다는 것이다. 전면 삼각근 발달에 탁월하다고
						할 수 있다. 근력운동의 일종이다보니 근육의 크기를 높이는 데에도 물론 도움이 되지만, 그보다는 근육의 모양을 세밀하게
						다듬을 때 더 효과가 있다.</p>
				</div>
			</div>
		</div>
		<div id="shoulder5" class="shoulderModal">
			<!-- Modal content -->
			<div class="shoulderModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/military_press.png"
					alt="sample21" />
				<div id="ModalContentTitle">
					<h3>밀리터리 프레스</h3>
					<p>밀리터리 프레스는 삼각근과 상완삼두근, 흉근 상부까지 함께 동원되는 가장 기본이 되는 어깨 운동이다. 아울러
						몸통의 균형을 잡기 위해 내복사근 및 외복사근의 복근과 척추기립근의 협응이 이루어진다. 전면 삼각근과 측면 삼각근을
						발달시키기 위한 타겟 운동으로서의 역할 뿐 아니라, 전체적인 삼각근의 매스를 키우는데 도움이 되기 때문에 어깨 운동의
						가장 중요한 운동으로서 다루어진다.</p>
				</div>
			</div>
		</div>
		<div id="shoulder6" class="shoulderModal">
			<!-- Modal content -->
			<div class="shoulderModalContent">
				<img
					src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/side-lateral_raise.png"
					alt="sample86" />
				<div id="ModalContentTitle">
					<h3>사이드 레터럴 레이즈</h3>
					<p>사이드레터럴레이즈는 측면 삼각근을 키우는 운동이다. 어깨를 키우기 위해 하는 운동 중 하나이다. 사이드
						레터럴 레이즈는 섬세한 운동으로써 큰 근육이 아닌 작은 근육에 속하기 때문에 아무생각 없이 덤벨을 들어 올린다고 해서
						측면을 공략할수 있는 운동이 아니다. 그래서 대부분 레터럴 레이즈를 할때 자극점을 찾기가 쉽지 않을 것이다. 사이드
						레터럴 레이즈의 가장 중요한 포인트는 어깨부터 팔꿈치에 해당하는 상완을 이용해 운동하는 것이지 팔전체를 이용해
						해당부위를 자극 하는것이 결코 절대 아니다.</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>