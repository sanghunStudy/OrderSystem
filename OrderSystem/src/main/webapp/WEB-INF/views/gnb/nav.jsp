<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>common nav</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/nav-menu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gnb/calculator.css">
<script src="${pageContext.request.contextPath}/resources/js/calculator.js"></script>
<script src="https://unpkg.com/vue"></script>
<body>
	<nav class="menu">
   <input type="checkbox" href="#" class="menu-open" name="menu-open" id="menu-open" />
   <label class="menu-open-button" for="menu-open" id="priority">
    <span class="lines line-1"></span>
    <span class="lines line-2"></span>
    <span class="lines line-3"></span>
  </label>

   <a href="#" class="menu-item blue"> <i class="fa fa-anchor"></i> </a>
   <a href="#" class="menu-item green" id="calBtn"> <i class="fas fa-calculator" ></i> </a>
   <a href="#" class="menu-item red"> <i class="fa fa-heart"></i> </a>
   <a href="#" class="menu-item purple"> <i class="fa fa-microphone"></i> </a>
   <a href="#" class="menu-item orange"> <i class="fa fa-star"></i> </a>
   <a href="#" class="menu-item lightblue"> <i class="fa fa-diamond"></i> </a>
</nav>

<!-- The Modal -->
	<div id="calcModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<div class="calculator-tabs">

				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">1RM계산</li>
					<li class="tab-link" data-tab="tab-2">칼로리계산</li>
				</ul>

				<div id="tab-1" class="tab-content current">
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
				<div id="tab-2" class="tab-content">
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
								<td><input type="number" v-model="age"></td>
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