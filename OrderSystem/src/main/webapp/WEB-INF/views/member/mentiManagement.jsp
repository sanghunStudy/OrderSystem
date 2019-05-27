<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-sclae=1, maximum-sclae=1, initial-scale=1, user-scalable=no">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/icomoon/style.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/favicon (1).ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mento.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mentoCharts.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/statistics&menti/mentoCharts.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/statistics&menti/commons.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="custom.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>TRAINERBOT 멘티 관리</title>
</head>
<body>
	<script>
		var contextPath = '${pageContext.request.contextPath}';
	</script>
	<div id="fullBox">
		<div class="menu-box">
			<div class="logo">
				<a href="${pageContext.request.contextPath}"><img
					src="${pageContext.request.contextPath}/resources/images/logo.png"
					alt="logo">
					<p>TRAINERBOT</p></a>
			</div>
			<ul class="menu-bar">
				<li class="menu-icons"><a href="statistics"><i
						class="fas fa-chart-bar"></i>
					<p>운동일지 통계</p></a></li>
				<li class="menu-icons"><a href="MyExerciseJournal"><i
						class="fas fa-book"></i>
					<p>운동일지 작성</p></a></li>
				<li class="menu-icons"><a href="basicInformation"><i
						class="fas fa-user-edit"></i>
					<p>설문조사</p></a></li>
				<li class="menu-icons"><a href="mentiManagement"><i
						class="fas fa-users"></i>
					<p>멘티 관리</p></a></li>
				<li class="menu-icons"><a
					href="${pageContext.request.contextPath}/opo/webRtc"><i
						class="fas fa-comment-dots"></i>
					<p>화상채팅</p></a></li>
			</ul>
		</div>
		<div id="wrapper">
			<div class="rank">
				<div id="ranker"
					style="position: relative; height: 30vh; width: 35vw">
					<div class="title">
						<img
							src="${pageContext.request.contextPath}/resources/images/mypage/crown.png"
							class="crown"><span>RANKING</span>
					</div>
					<table>
						<thead>
							<tr>
								<td>Name</td>
								<td>Point</td>
								<td>Menti</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>오창영 님</td>
								<td>50pt</td>
								<td>8명</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="lineChart Ranking"
					style="position: relative; height: 30vh; width: 54vw">
					<canvas id="line-chart-ranking"></canvas>
				</div>
			</div>
			<div class="menti-apply">
				<div class="title">
					<span>Menti Apply</span>
				</div>
				<table class="apply-list">
					<thead>
						<tr>
							<th>Name</th>
							<th>Date</th>
							<th>Physical Information</th>
							<th>Goal</th>
							<th colspan="2">Action</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td>웰시코기</td>
							<td>2019-05-15</td>
							<td>키 175cm 몸무게 70kg</td>
							<td>홀쭉 날씬 s라인</td>
							<td><div class="agree btn">Agree</div></td>
							<td><div class="disagree btn">Disagree</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="third-line">
				<div class="latest-log">
					<div class="title">
						<span>Latest Log</span>
					</div>
					<div id="log-items">
						<div class="log-item">
							<span class="user-name">오창영님</span>이 <span class="subject">벤치프레스</span>를
							완료하였습니다. <span class="log-time">32분 전</span>
						</div>
					</div>
				</div>
				<div class="menti-weight"
					style="position: relative; height: 38vh; width: 60vw">
					<canvas id="line-chart-mentiWegiht"></canvas>
				</div>

			</div>
			<div class="mentiperformance">
				<div class="title">
					<span>Menti Performance</span>
				</div>
				<table class="performance">
					<thead>
						<tr class="th">
							<td>Name</td>
							<td>Performance Rate</td>
							<td colspan="2">Plan Management</td>
							<td>Date</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>오창영님</td>
							<td>
								<div class="progress-container">
									<span id="value" class="progress-value"
										style="background-color: #272a3d">1%</span>

									<div class="progress-bar">
										<div id="bar" class="progress-value multi" data-code="dbVal"
											style="width: 1%;"></div>
									</div>
								</div>
							</td>
							<td><div class="planModal" id="exer-modal-btn">운동관리</div></td>
							<td><div class="planModal" id="food-modal-btn">식단관리</div></td>
							<td>2019.05.07</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 운동관리,식단관리 모달 -->
		<div id="modals">
			<div class="food-modal" id="food-modal">
				<div class="tab-container">
					<div class="row-line">
						<section>
							<div class="wizard">
								<div class="wizard-inner">
									<div class="active-line"></div>
									<ul class="nav nav-tabs" role="tablist" id="test1">
										<li role="presentation" class="active stepactive1">
											<div class="connecting-line border-right"></div> <a
											href="#step1" id="tab" data-toggle="tab"
											aria-controls="step1" role="tab" title="Step 1"> <span
												class="round-tab"> 1 </span>
												<p>기간 설정</p>
										</a>
										</li>
										<li role="presentation" class="disabled stepactive2">
											<div class="connecting-line border-right border-left"></div>
											<a href="#step2" id="tab" data-toggle="tab"
											aria-controls="step2" role="tab" title="Step 2"> <span
												class="round-tab"> 2 </span>
												<p>식단 관리</p>
										</a>
										</li>
										<li role="presentation" class="disabled stepactive3">
											<div class="connecting-line border-right border-left"></div>
											<a href="#step3" id="tab" data-toggle="tab"
											aria-controls="step3" role="tab" title="Step 3"> <span
												class="round-tab"> 3 </span>
												<p>플랜 확인</p>
										</a>
										</li>
										<li role="presentation" class="disabled stepactive4">
											<div class="connecting-line"></div> <a href="#complete"
											id="tab" data-toggle="tab" aria-controls="complete"
											role="tab" title="Complete"> <span class="round-tab">
													4 </span>
												<p>확인 및 안내</p>
										</a>
										</li>
									</ul>
								</div>
								<form role="form">
									<div class="tab-content">
										<div class="tab-pane active" role="tabpanel" id="step1">
											<h3>기간 설정</h3>
											<ul class="list-inline">

												<li><button type="button"
														class="btn next-step next-food">
														식단 관리  <i class="fa fa-arrow-right"></i>
													</button></li>
											</ul>
										</div>
										<div class="tab-pane" role="tabpanel" id="step2">
											<div class="food-management">
												<div class="modal-header">
													<h2>식단관리</h2>
												</div>
												<div class="contents-container">
													<div class="date-area">
														<i class="fas fa-angle-left" id="food_prev"></i><span
															class="schedule-date"></span><i
															class="fas fa-angle-right" id="food_next"></i>
													</div>
													<div class="group">
														<input type="text" required> <span
															class="highlight"></span> <span class="bar"></span> <label
															class="only-modal">음식이름</label>
													</div>
													<div class="spinner">
														<div class="gram-spinner">
															<span class="sub-title">양(gram)</span>
															<div class="input-group-spinner input-number-group">
																<div class="input-group-button">
																	<span class="input-number-decrement">-</span>
																</div>
																<input class="input-number" type="number" value="10"
																	min="0" max="1000" step="10">
																<div class="input-group-button">
																	<span class="input-number-increment">+</span>
																</div>
															</div>
														</div>
														<div class="count-spinner">
															<span class="sub-title">개수</span>
															<div class="input-group-spinner input-number-group">
																<div class="input-group-button">
																	<span class="input-number-decrement">-</span>
																</div>
																<input class="input-number" type="number" value="1"
																	min="0" max="1000">
																<div class="input-group-button">
																	<span class="input-number-increment">+</span>
																</div>
															</div>
														</div>
													</div>

													<div class="group">
														<input type="text" required> <span
															class="highlight"></span> <span class="bar"></span> <label
															class="only-modal">칼로리(Kcal)</label>
													</div>
													<div class="group">
														<input type="text" required> <span
															class="highlight"></span> <span class="bar"></span> <label
															class="only-modal">기타사항</label>
													</div>
													<div class="nutrient">
														<span class="sub-title">영양분</span>
														<div class="hash-container">
															<ul class="ks-cboxtags">
																<li><input type="checkbox" id="checkboxOne"
																	value="Rainbow Dash"><label for="checkboxOne">탄수화물</label></li>
																<li><input type="checkbox" id="checkboxTwo"
																	value="Cotton Candy" checked><label
																	for="checkboxTwo">단백질</label></li>
																<li><input type="checkbox" id="checkboxThree"
																	value="Rarity" checked><label
																	for="checkboxThree">지방</label></li>
															</ul>
														</div>
													</div>

												</div>
												<!-- 				<div class="save-area"><a href="#" class="button">SAVE</a></div> -->

											</div>
											<ul class="list-inline">
												<li><button type="button"
														class="btn prev-step prev-food">
														<i class="fa fa-arrow-left"></i>  기간 설정
													</button></li>
												<li><button type="button"
														class="btn add-food">
														식단 추가 <i class="fas fa-plus"></i>
													</button></li>
												<li><button type="button"
														class="btn next-step next-food">
														플랜 확인  <i class="fa fa-arrow-right"></i>
													</button></li>
											</ul>
										</div>
										<div class="tab-pane" role="tabpanel" id="step3">
											<h3>플랜 확인</h3>
											<p>플랜확인하는 곳 입니다.</p>
											<ul class="list-inline">
												<li><button type="button"
														class="btn prev-step prev-food">
														<i class="fa fa-arrow-left"></i>  식단관리
													</button></li>
												<li><button type="button"
														class="btn btn-info-full next-step next-food">
														확인 및 안내  <i class="fa fa-arrow-right"></i>
													</button></li>
											</ul>
										</div>
										<div class="tab-pane" role="tabpanel" id="complete">
											<h3>확인 및 안내</h3>
											<p>위 운동/식단 관리는 본 웹사이트(TrainerBot)가 작성하는 것이 아닌 회원들간의 정보교환의 일종으로 본 사는 결과에 대하여 어떠한 책임도 지지 않습니다. </p>
											<ul class="list-inline">
												<li><button type="button"
														class="btn prev-step prev-food">
														<i class="fa fa-arrow-left"></i>  Previous
													</button></li>
												<li><button type="button"
														class="btn btn-info-full next-step next-food">Save
														and Submit</button></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</form>
							</div>
						</section>
					</div>
				</div>


			</div>
			<div class="exer-modal" id="exer-modal">
				<div class="tab-container">
					<div class="row-line">
						<section>
							<div class="wizard">
								<div class="wizard-inner">
									<div class="active-line"></div>
									<ul class="nav nav-tabs" role="tablist" id="test2">
										<li role="presentation" class="active stepactive1">
											<div class="connecting-line border-right"></div> <a
											href="#step5" data-toggle="tab" aria-controls="step5"
											role="tab" title="Step 5"> <span class="round-tab">
													1 </span>
												<p>기간 설정</p>
										</a>
										</li>
										<li role="presentation" class="disabled stepactive2">
											<div class="connecting-line border-right border-left"></div>
											<a href="#step6" data-toggle="tab" aria-controls="step6"
											role="tab" title="Step 6"> <span class="round-tab">
													2 </span>
												<p>운동 관리</p>
										</a>
										</li>
										<li role="presentation" class="disabled stepactive3">
											<div class="connecting-line border-right border-left"></div>
											<a href="#step7" data-toggle="tab" aria-controls="step7"
											role="tab" title="Step 7"> <span class="round-tab">
													3 </span>
												<p>플랜 확인</p>
										</a>
										</li>
										<li role="presentation" class="disabled stepactive4">
											<div class="connecting-line"></div> <a href="#step8"
											data-toggle="tab" aria-controls="step8" role="tab"
											title="Step 8"> <span class="round-tab"> 4 </span>
												<p>확인 및 안내</p>
										</a>
										</li>
									</ul>
								</div>
								<form role="form">
									<div class="tab-content">
										<div class="tab-pane active" role="tabpanel" id="step5">
											<h3>기간 설정</h3>
											<ul class="list-inline">

												<li><button type="button"
														class="btn next-step next-exer">
														플랜 확인  <i class="fa fa-arrow-right"></i>
													</button></li>
											</ul>
										</div>
										<div class="tab-pane" role="tabpanel" id="step6">
											<div class="exer-management">
												<div class="modal-header">
													<h2>운동관리</h2>
												</div>
												<div class="contents-container">
													<div class="date-area">
														<i class="fas fa-angle-left" id="exer_prev"></i><span
															class="schedule-date"></span><i
															class="fas fa-angle-right" id="exer_next"></i>
													</div>
													<form autocomplete="off">
														
														<div class="group">
															<div class="autocomplete">
																<input type="text" required class="ename" id="ename">
																<span class="highlight"></span> <span class="bar"></span>
																<label>운동이름</label>
															</div>
														</div>
														<div class="spinner">
															<div class="set-spinner">
																<span class="sub-title">세트</span>
																<div class="input-group-spinner input-number-group">
																	<div class="input-group-button">
																		<span class="input-number-decrement">-</span>
																	</div>
																	<input class="input-number" type="number" value="1"
																		min="0" max="1000">
																	<div class="input-group-button">
																		<span class="input-number-increment">+</span>
																	</div>
																</div>
															</div>
															<div class="reps-spinner">
																<span class="sub-title">반복회수</span>
																<div class="input-group-spinner input-number-group">
																	<div class="input-group-button">
																		<span class="input-number-decrement">-</span>
																	</div>
																	<input class="input-number" type="number" value="1"
																		min="0" max="1000">
																	<div class="input-group-button">
																		<span class="input-number-increment">+</span>
																	</div>
																</div>
															</div>
															<div class="lb-spinner">
																<span class="sub-title">중량</span>
																<div class="input-group-spinner input-number-group">
																	<div class="input-group-button">
																		<span class="input-number-decrement">-</span>
																	</div>
																	<input class="input-number" type="number" value="1"
																		min="0" max="1000">
																	<div class="input-group-button">
																		<span class="input-number-increment">+</span>
																	</div>
																</div>
															</div>
														</div>
														<div class="group">
															<input type="text" required class="parts"> <span
																class="highlight"></span> <span class="bar"></span> <label>운동부위</label>
														</div>
														<div class="group">
															<input type="text" required class="details"> <span
																class="highlight"></span> <span class="bar"></span> <label>기타사항</label>
														</div>
														<!-- 	<span class="icon-right-arrow" ></span><span class="icon-left-arrow"></span> -->
													</form>
												</div>
												<!-- 				<div class="save-area"><a href="#" class="button">SAVE</a></div>		 -->
											</div>
											<ul class="list-inline">
												<li><button type="button" class="btn prev-step">
														<i class="fa fa-arrow-left"></i>  기간 설정
													</button></li>
												<li><button type="button"
														class="btn add-exer">
														운동 추가 <i class="fas fa-plus"></i>
													</button></li>
												<li><button type="button" class="btn next-step">
														플랜 확인  <i class="fa fa-arrow-right"></i>
													</button></li>
											</ul>
										</div>
										<div class="tab-pane" role="tabpanel" id="step7">
											<h3>플랜 확인</h3>
											<p>플랜 확인하는 곳 입니다.</p>
											<ul class="list-inline">
												<li><button type="button" class="btn prev-step">
														<i class="fa fa-arrow-left"></i>  운동 관리
													</button></li>
												<li><button type="button"
														class="btn btn-info-full next-step">
														확인 및 안내  <i class="fa fa-arrow-right"></i>
													</button></li>
											</ul>
										</div>
										<div class="tab-pane" role="tabpanel" id="step8">
											<h3>확인 및 안내</h3>
											<p>위 운동/식단 관리는 본 웹사이트(TrainerBot)가 작성하는 것이 아닌 회원들간의 정보교환의 일종으로 본 사는 결과에 대하여 어떠한 책임도 지지 않습니다. </p>
											<ul class="list-inline">
												<li><button type="button" class="btn prev-step">
														<i class="fa fa-arrow-left"></i>  플랜확인
													</button></li>
												<li><button type="button"
														class="btn btn-info-full next-step">저장 및 전송</button></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</form>
							</div>
						</section>
					</div>
				</div>

			</div>
		</div>
</body>
</html>