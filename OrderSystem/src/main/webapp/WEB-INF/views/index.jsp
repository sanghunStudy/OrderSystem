<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지 입니다.</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/index.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/gnb/calculator.css">
<script src="https://unpkg.com/vue"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/calculator.js"></script>

</head>
<!-- 네비바 -->
<jsp:include page="gnb/head.jsp" flush="true" />


<body>
	<div id="container">
		<div class="section0">
			
			<p class="section-introduce">02   Our Second Project</p>
			<p class="section-title">Are you satisfied with <br>your body?</p>
			<p class="section-article">Now you are in perfect shape with trainer bot</p>
			<div class="section-footer"><img src="${pageContext.request.contextPath}/resources/images/main/play.png" class="play-icon"><span>Let's get it start</span></div>
		
		</div>
		<div class="section1">
			<div id="carousel_section">
				<ul>
					<li class="first-carousel bgBlur"><img
						src="${pageContext.request.contextPath}/resources/images/main/section1-dumbel.jpg" class="shadow-fileter">
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg">
						<filter id="shadow">
						  <fePointLight x = "50" y = "100" z = "200"/>
						</filter>
						</svg>
						<div class="section1_item">
							<div class="section1-title"><span>팔운동 </span><span id="section1_title">" 덤벨 "</span></div>
							<p>
								덤벨기구는 마치 바벨을 축소시켜 놓은듯한 생김새를 가지고 있다.<br> 크기가 작고 아주 가벼운 중량부터
								사용 가능하여 초보자가 최소한<br> 비용으로 홈에서 운동을 하고자 할때 유용하게 쓸수 있다. 하지만<br>
								덤벨 운동은 초보자가 컨트롤하기 까다로워 올바른 자세를 잘<br> 익혀야 한다.
							</p>
						</div></li>
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg">
    <filter id="blur">
        <feGaussianBlur stdDeviation="6" />
      <feComponentTransfer>
    <feFuncR type="linear" slope="2"/>
    <feFuncG type="linear" slope="2"/>
    <feFuncB type="linear" slope="2"/>
    </feComponentTransfer>
    </filter>
</svg>

					<li class="second-carousel bgBlur"><img
						src="/kopo/resources/images/main/exer-a.png" class="shadow-fileter">
						<div class="section1_item">
							<div class="section1-title"><span>팔운동 </span><span id="section1_title">＂덤벨 컬＂</span></div>
							<p>
								바벨 컬에 비해 상완이두근의 선명도를 높일 수 있는 운동이다.<br> 선 자세와 앉은 자세(벤치,
								짐볼)에서 운동이 가능하며, 그립을 <br> 잡는 방향에 따라 발현되는 근육이 달라지며, 양팔을 동시에 <br>
								운동하거나 한 팔씩 번갈아가며 운동을 할 수도 있다.
							</p>
						</div></li>
					<!-- 					<li><img src="../img/img03.png"></li> -->
					<!-- 					<li><img src="../img/img04.png"></li> -->

				</ul>
			</div>
		</div>
		<div class="section2">
			<div class="section2-wrap">
				<div class="first-line">
					<div class="section2-box">
						<div class="section2-item-box">
							<div class="section2-image-box"><img src="${pageContext.request.contextPath}/resources/images/main/second-section/business4.png"></div>
							<div class="section2-contents-box">
								<div class="section2-contents-title">디지털 솔루션</div>
								<p class="section2-contents-text">사용자들이 민감하게 반응하고 빠르게 확산되는 디지털 기반의 운동 정보들을 커뮤니티를 통해서 솔루션을 제공합니다.</p>
							</div>
						</div>
					</div>
					<div class="section2-box">
						<div class="section2-item-box">
							<div class="section2-image-box"><img src="${pageContext.request.contextPath}/resources/images/main/second-section/business6.png"></div>
							<div class="section2-contents-box">
								<div class="section2-contents-title">마일리지 시스템</div>
								<p class="section2-contents-text">커뮤니티 활성화를 위해 마일리지 제도를 도입하여 일정 포인트 이상의 회원들에겐 트레이너가 될 수 있는 자격이 주어집니다.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="second-line">
					<div class="section2-box">
						<div class="section2-item-box">
							<div class="section2-image-box"><img src="${pageContext.request.contextPath}/resources/images/main/second-section/business7.png"></div>
							<div class="section2-contents-box">
								<div class="section2-contents-title">데이터 시각화</div>
								<p class="section2-contents-text">운동일지 기능을 통해 작성된 데이터를 시각화하여 그래프로 나타냅니다.</p>
							</div>
						</div>
					</div>
					<div class="section2-box">
						<div class="section2-item-box">
							<div class="section2-image-box"><img src="${pageContext.request.contextPath}/resources/images/main/second-section/business2.png"></div>
							<div class="section2-contents-box">
								<div class="section2-contents-title">화상 채팅</div>
								<p class="section2-contents-text">트레이너들은 정확하고 체계적인 솔루션제공을 위해 회원들과 화상통화를 할 수 있습니다.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="last-line">
					<div class="section2-box">
						<div class="section2-item-box">
							<div class="section2-image-box"><img src="${pageContext.request.contextPath}/resources/images/main/second-section/business5.png"></div>
							<div class="section2-contents-box">
								<div class="section2-contents-title">맞춤 플랜</div>
								<p class="section2-contents-text">사용자들 간의 멘토/멘티 시스템을 바탕으로 트레이너가 작성한  효율적이고 최적화 된  개인별 맞춤 플랜으로 운동할 수 있습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
		<div class="section3">
			<div class="section3_item">
				<p class="section3_title">
					your own <span>Trainer</span>
				</p>
				<p class="section3_sub_title">Build Your Body Yourself with your
					own Trainer</p>
				<div id="start-btn">
					<p
						onclick="location.href='${pageContext.request.contextPath}/question/list'">GET
						Started</p>
				</div>

				<div id="foot-wrap">
					<div id="menu-info">
						<a href="${pageContext.request.contextPath}/ExIntroduction/chest">TRAINING</a>
						| <a href="${pageContext.request.contextPath}/question/list">QUESTION</a>
						| <a href="${pageContext.request.contextPath}/trainer/list"
							class="no-word">PERSONAL TRAINER</a>
					</div>
					<div id="main-info">
						<div id="foot-logo">
							<div id="logo-info">
								<img
									src="${pageContext.request.contextPath}/resources/images/logo.png">
								<span>TRAINER BOT</span>
							</div>
						</div>
						<!--                 COPYRIGHT 2010 BY KOREA POLYTECHNICS. ALL RIGHTS RESERVED.<br> -->
						<!--                 <br> -->
						<!--                	 제작자: 김건우 배상훈 상의준 송영채 오창영 윤성운<br> -->
						<!--                 TEL: 042-670-0613 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<nav class="menu">
		<input type="checkbox" href="#" class="menu-open" name="menu-open"
			id="menu-open" /> <label class="menu-open-button" for="menu-open">
			<span class="lines line-1"></span> <span class="lines line-2"></span>
			<span class="lines line-3"></span>
		</label> <a href="#" class="menu-item purple"> <i class="fa fa-microphone"></i>
		</a> <a href="#" class="menu-item green" id="calBtn"> <i
			class="fas fa-calculator"></i>
		</a> <a href="#" class="menu-item red"> <i class="fa fa-heart"></i>
		</a> <a href="#" class="menu-item orange"> <i class="fa fa-star"></i>
		</a>
		<!--    <a href="#" class="menu-item blue"> <i class="fa fa-anchor"></i> </a> -->
		<!--    <a href="#" class="menu-item lightblue"> <i class="fa fa-diamond"></i> </a> -->
	</nav>

	<!-- The Modal -->
	<div id="calcModal" class="calculatorModal">

		<!-- Modal content -->
		<div class="calculatorModal-content">
			<span class="calculatorModal-close">&times;</span>
			<div class="calculator-tabs">

				<ul class="calculatorModal-tabs">
					<li class="tab-link current" data-tab="calculatorModal-tab-1">1RM계산</li>
					<li class="tab-link" data-tab="calculatorModal-tab-2">칼로리계산</li>
				</ul>

				<div id="calculatorModal-tab-1"
					class="calculatorModal-tab-content current">
					<div id="app">
						<label>사용중량</label><input v-model="x" type="number" id="kg">
						<label>반복횟수</label><input v-model="y" type="number" id="reps">
						<a>&emsp;&emsp;추산1RM : <span id="onerm">{{ sum }}</span></a>

						<table id="onet">
							<thead>
								<tr>
									<th>Warm up</th>
									<th>1RM(%)</th>
									<th>중량</th>
									<th>reps</th>
									<th>셋트당 휴식시간</th>
									<th>기를 수 있는 능력</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>50%</td>
									<td>{{ one }}</td>
									<td>8</td>
									<td>~2분</td>
									<td>근지구력증가</td>
								</tr>
								<tr>
									<td>2</td>
									<td>60%</td>
									<td>{{ two }}</td>
									<td>5</td>
									<td>~2분</td>
									<td>근지구력증가</td>
								</tr>
								<tr>
									<td>3</td>
									<td>70%</td>
									<td>{{ three }}</td>
									<td>3</td>
									<td>~3분</td>
									<td>근비대증가</td>
								</tr>
								<tr>
									<td>4</td>
									<td>80%</td>
									<td>{{ four }}</td>
									<td>1</td>
									<td>~3분</td>
									<td>근력증가</td>
								</tr>
								<tr>
									<td>5</td>
									<td>90%</td>
									<td>{{ five }}</td>
									<td>1</td>
									<td>~5분</td>
									<td>힘증가</td>
								</tr>
								<tr>
									<td>6</td>
									<td>95%</td>
									<td>{{ six }}</td>
									<td>1</td>
									<td>5-15분</td>
									<td>힘증가</td>
								</tr>
								<tr>
									<td>7</td>
									<td>100%</td>
									<td>{{ seven }}</td>
									<td>1</td>
									<td>5-15분</td>
									<td>힘증가</td>
								</tr>
							</tbody>
						</table>
					</div>
					<script>
						var app = new Vue({
							el : '#app',
							data : {
								x : 0,
								y : 0,
								sum : 0,
								one : 0,
								two : 0,
								three : 0,
								four : 0,
								five : 0,
								six : 0,
								seven : 0,
								eight : 0,
								nine : 0
							},
							watch : {
								x : function(v) {

									var result = Math.floor(Number(v)
											* (1 + (Number(this.y) / 30)));

									if (isNaN(result))
										this.sum = 0;
									else
										this.sum = result;
								},

								y : function(v) {

									var result = Math.floor(Number(this.x)
											* (1 + (Number(v) / 30)));

									if (isNaN(result))
										this.sum = 0;
									else
										this.sum = result;
								},

								sum : function(v) {
									var mp = [];

									var percent = [ 0.5, 0.6, 0.7, 0.8, 0.9,
											0.95, 1.0, 1.02 ];

									for (var u = 0; u <= percent.length; u++) {
										var jun = this.sum * percent[u];
										var min = 999.9;
										var result = 0;

										for (var i = 0; i < jun; i++) {
											mp[i] = i * 2.5;
										}
										for (var i = 1; i < mp.length; i++) {

											if (Math.abs(jun - mp[i]) < min) {
												min = jun - mp[i];
												result = mp[i];
											}
										}
										switch (u) {
										case 0:
											this.one = result;
											break;
										case 1:
											this.two = result;
											break;
										case 2:
											this.three = result;
											break;
										case 3:
											this.four = result;
											break;
										case 4:
											this.five = result;
											break;
										case 5:
											this.six = result;
											break;
										case 6:
											this.seven = result;
											break;
										case 7:
											this.eight = result;
											break;
										case 8:
											this.nine = result;
											break;
										default:
											break;
										}
									}
								}
							}
						});
					</script>
				</div>
				<div id="calculatorModal-tab-2" class="calculatorModal-tab-content">
					<h1>칼로리계산기</h1>
					<div id="exam">
						<table border=1>
							<tr>
								<td>성별</td>
								<td><select v-model="sex">
										<option disabled="disabled" selected>성별을 선택하세요</option>
										<option>남자</option>
										<option>여자</option>
								</select></td>
							</tr>
							<tr>
								<td>나이</td>
								<td><input type="number" v-model="age" id="age"></td>
							</tr>
							<tr>
								<td>키</td>
								<td><input type="number" v-model="height"></td>
							</tr>
							<tr>
								<td>체중</td>
								<td><input type="number" v-model="weight"></td>
							</tr>
							<tr>
								<td>훈련량</td>
								<td><select v-model="train">
										<option disabled="disabled" selected>훈련량을 설정해주세요</option>
										<option>일상생활</option>
										<option>적은훈련량</option>
										<option>일반적인훈련량</option>
										<option>높은훈련량</option>
								</select></td>
							</tr>
							<tr>
								<td>식단 목표</td>
								<td><select v-model="goal">
										<option disabled="disabled" selected>식단목표를 설정해주세요</option>
										<option>체중감소(극단적)</option>
										<option>체중감소(적극적)</option>
										<option>체중감소(중립적)</option>
										<option>체중감소(소극적)</option>
										<option>체중유지</option>
										<option>체중증가(소극적)</option>
										<option>체중증가(중립적)</option>
										<option>체중증가(적극적)</option>
								</select></td>
							</tr>
						</table>
						<table border=1>
							<tr>
								<td>기초대사량</td>
								<td>추정에너지요구량</td>
							</tr>
							<tr>
								<td id="Bmetabolism">{{Math.round(sum)}}</td>
								<td id="Erequirement">{{Math.round(goalCal)}}</td>
							</tr>
						</table>
						<i class="fas fa-save"></i>
					</div>
					<script>
						var vmSum = new Vue({
							el : "#exam",
							data : {
								sex : '',
								age : '',
								height : '',
								weight : '',
								train : '',
								goal : ''
							},
							computed : {
								sum : function() {
									if (this.sex == "남자")
										return (this.weight * 10)
												+ (this.height * 6.25)
												- (this.age * 5) + 5;
									else if (this.sex == "여자")
										return (this.weight * 10)
												+ (this.height * 6.25)
												- (this.age * 5) - 161;
									else
										return 0;
								},
								preCal : function() {
									if (this.train == "일상생활")
										return this.sum * 1.2;
									else if (this.train == "적은훈련량")
										return this.sum * 1.37;
									else if (this.train == "일반적인훈련량")
										return this.sum * 1.55;
									else if (this.train == "높은훈련량")
										return this.sum * 1.725;
									else
										return 0;
								},
								goalCal : function() {
									if (this.goal == "체중감소(극단적)")
										return this.preCal * 0.7;
									else if (this.goal == "체중감소(적극적)")
										return this.preCal * 0.75;
									else if (this.goal == "체중감소(중립적)")
										return this.preCal * 0.80;
									else if (this.goal == "체중감소(소극적)")
										return this.preCal * 0.85;
									else if (this.goal == "체중증가(소극적)")
										return this.preCal * 1.05;
									else if (this.goal == "체중증가(중립적)")
										return this.preCal * 1.1;
									else if (this.goal == "체중증가(적극적)")
										return this.preCal * 1.15;
									else
										return this.preCal;
								}
							},
						});
					</script>
				</div>

			</div>
		</div>

	</div>
</body>
</html>