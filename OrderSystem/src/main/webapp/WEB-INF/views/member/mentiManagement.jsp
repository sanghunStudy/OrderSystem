<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>TRAINERBOT 멘티 관리</title>
</head>
 <%@ include file="../gnb/nav.jsp" %>
<body>
	<script>
		var contextPath = '${pageContext.request.contextPath}';
		var trainer = '${sessionScope.trainer}';
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
					<li class="menu-icons"><a href="${pageContext.request.contextPath}/member/promotion"><i class="fas fa-address-card"></i><p>트레이너 신청</p></a></li>	
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
					<div class="ranking-table-box">
						<table class="ranking-table">
							<thead>
								<tr>
									<td>순위</td>
									<td>아이디</td>
									<td>포인트</td>
									<td>멘티 수</td>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${rankerList.size() > 0 }">
										<c:forEach var="ranker" items="${rankerList}">
											<tr>
												<td>${ranker.ranking}</td>
												<td>${ranker.username}</td>
												<td>${ranker.point}</td>
												<td>${ranker.menti}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">랭킹에 등록된 트레이너가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
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
					<tbody class="applicant-list">
						<c:choose>
							<c:when test="${wfaList.size() > 0}">
								<c:forEach var="item" items="${wfaList}">
									<tr>
										<td class="applicant">${item.username}</td>
										<td class="apply-date">${item.applyDate}</td>
										<td>${item.height}cm${item.weights}kg</td>
										<td>${item.goal}</td>
										<td colspan="2" class="action">
											<div class="agree btn-t" id="agree">Agree</div>
											<div class="disagree btn-t" id="disagree">Disagree</div>
										</td>
									</tr>
								</c:forEach>
							</c:when>

							<c:otherwise>
								<tr>
									<td colspan="5">승인 대기중인 회원이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="third-line">
				<div class="latest-log">
					<div class="title">
						<span>Latest Log</span>
					</div>
					<div class="contents-wrapper">
						<div id="log-items">
							<div class="log-item">
								<div class="log-detail">
									<div class="pushpin-box">
										<span class="icon-pushpin"></span>
									</div>
									<div class="log-detail-contents">
										<span class="user-name">오창영</span>님이 <span class="subject">벤치프레스</span>를
										완료하였습니다.
									</div>
								</div>
								<div class="log-time-box">
									<span class="log-time">32분전</span>
								</div>
							</div>
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
							<td colspan="2">Action</td>
						</tr>
					</thead>
					<tbody class="myMenti-list">
						<c:choose>
							<c:when test="${myMenti.size() > 0 }">
								<c:forEach var="menti" items="${myMenti}">
									<tr>
										<td class="my-menti">${menti.username}</td>
										<td>
											<div class="progress-container-t">
												<span id="value" class="progress-value-t"
													style="background-color: #272a3d">1%</span>

												<div class="progress-bar-t">
													<div id="bar" class="progress-value-t multi"
														data-code="dbVal" style="width: 1%;"></div>
												</div>
											</div>
										</td>
										<td><div class="planModal" id="exer-modal-btn">운동관리</div></td>
										<td><div class="planModal" id="food-modal-btn">식단관리</div></td>
										<td>2019.05.07</td>
										<td><button class="chart-menti btn-collection menti-btn">
												<span class="fas fa-chart-bar"></span><span>차트</span>
											</button></td>
										<td><button class="cancel-menti btn-collection menti-btn">
												<span class="icon-cross"></span><span>해지</span>
											</button></td>

									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6">멘토링중인 멘티가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>

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
											<div class="modal-header">
												<h2>기간 설정</h2>
											</div>
											<div class="contents-container">
												<div class="selected-menti">
													<div class="subtitle">멘티</div>
													<div class="menti-name"></div>
												</div>
												<div class="physical-info">
													<div class="selected-weights">
														<div class="subtitle">체중</div>
														<div class="menti-weights"></div>
													</div>
													<div class="energy-requirement">
														<div class="subtitle">에너지 요구량</div>
														<div class="menti-emetabolism"></div>
													</div>
													<div class="selected-goal">
														<div class="subtitle">목표</div>
														<div class="menti-goal"></div>
													</div>
												</div>
												<div class="plan-duration">
													<div class="start-date">
														<div class="start-date subtitle">시작일</div>
														<div class="sel sel-year">
															<select name="select-year" id="select-year">
																<option value="" disabled>년</option>
																<option value="2019">2019</option>
																<option value="2020">2020</option>
																<option value="2021">2021</option>
																<option value="2022">2022</option>
																<option value="2023">2023</option>
															</select>
														</div>
														<span class="separator">.</span>
														<div class="sel sel-month">
															<select name="select-superpower" id="select-month">
																<option value="" disabled>월</option>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
																<option value="6">6</option>
																<option value="7">7</option>
																<option value="8">8</option>
																<option value="9">9</option>
																<option value="10">10</option>
																<option value="11">11</option>
																<option value="12">12</option>
															</select>
														</div>
														<span class="separator">.</span>
														<div class="sel sel--superman">
															<select name="select-superpower" id="select-day"
																class="select-day">
																<option value="" disabled>일</option>

															</select>
														</div>
													</div>
													<div class="end-date">
														<div class="end-date subtitle">종료일</div>
														<div class="sel sel-year">
															<select name="select-year" id="select-year">
																<option value="" disabled>년</option>
																<option value="2019">2019</option>
																<option value="2020">2020</option>
																<option value="2021">2021</option>
																<option value="2022">2022</option>
																<option value="2023">2023</option>
															</select>
														</div>
														<span class="separator">.</span>
														<div class="sel sel-month">
															<select name="select-superpower" id="select-month">
																<option value="" disabled>월</option>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
																<option value="6">6</option>
																<option value="7">7</option>
																<option value="8">8</option>
																<option value="9">9</option>
																<option value="10">10</option>
																<option value="11">11</option>
																<option value="12">12</option>
															</select>
														</div>
														<span class="separator">.</span>
														<div class="sel sel-day">
															<select name="select-superpower" id="select-day"
																class="select-day">
																<option value="" disabled>일</option>

															</select>
														</div>
													</div>
												</div>
											</div>
											<ul class="list-inline">

												<li><button type="button"
														class="modal-btn-collection next-step next-food">
														<span>식단 관리</span>
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
																	value="carbohydrate"><label for="checkboxOne">탄수화물</label></li>
																<li><input type="checkbox" id="checkboxTwo"
																	value="protein"><label for="checkboxTwo">단백질</label></li>
																<li><input type="checkbox" id="checkboxThree"
																	value="fat"><label for="checkboxThree">지방</label></li>
															</ul>
														</div>
													</div>
													<div class="nutrient">
														<span class="sub-title">식사 시간</span>
														<div class="hash-container">
															<ul class="ks-cboxtags">
																<li><input type="radio" id="radioOne" name="radio"
																	value="Rainbow Dash" checked><label
																	for="radioOne" name="">아침</label></li>
																<li><input type="radio" id="radioTwo" name="radio"
																	value="Cotton Candy"><label for="radioTwo">점심</label></li>
																<li><input type="radio" id="radioThree"
																	name="radio" value="Rarity"><label
																	for="radioThree">저녁</label></li>
															</ul>
														</div>
													</div>

												</div>
												<!-- 				<div class="save-area"><a href="#" class="button">SAVE</a></div> -->

											</div>
											<ul class="list-inline">
												<li><button type="button"
														class="modal-btn-collection prev-step prev-food">
														  <span>기간 설정</span>
													</button></li>
												<li><button type="button" class="modal-btn-collection add-food">
														<span>식단 추가</span>
													</button></li>
												<li><button type="button"
														class="modal-btn-collection next-step next-food">
														<span>플랜 확인</span>
													</button></li>
											</ul>
										</div>
										<div class="tab-pane" role="tabpanel" id="step3">
											<div class="cal-container">
												<div class="calendar light">
													<div class="calendar_header">
														<h1 class="header_title">Diet List</h1>
														<p class="header_copy">Diet Plan</p>
													</div>
													<div class="calendar_plan">
														<div class="cl_plan">
															<div class="cl_title">Day</div>
															<div class="cl_copy">22nd May 2019</div>
															<div class="cl_add">
																<i class="fas fa-plus"></i>
															</div>
														</div>
													</div>
													<div class="calendar_events">
														<p class="ce_title">To Eat List</p>
														<div class="event_item">
															<div class="ei_Dot dot_active"></div>
															<div class="ei_Title">10:30 am</div>
															<div class="ei_Copy">한솥도시락 현미고기고기</div>
														</div>
														<div class="event_item">
															<div class="ei_Dot"></div>
															<div class="ei_Title">12:00 pm</div>
															<div class="ei_Copy">학식</div>
														</div>
														<div class="event_item">
															<div class="ei_Dot"></div>
															<div class="ei_Title">14:00 pm</div>
															<div class="ei_Copy">
																One day 견과류 1봉지<br>#해태 #롯데
															</div>
														</div>
														<div class="event_item">
															<div class="ei_Dot"></div>
															<div class="ei_Title">16:30 pm</div>
															<div class="ei_Copy">프로틴 2알</div>
														</div>
														<div class="event_item">
															<div class="ei_Dot"></div>
															<div class="ei_Title">18:30 am</div>
															<div class="ei_Copy">닭가슴살 30g 1팩</div>
														</div>
													</div>
												</div>
											</div>


											<ul class="list-inline">
												<li><button type="button"
														class="modal-btn-collection prev-step prev-food">
														  <span>식단관리</span>
													</button></li>
												<li><button type="button"
														class="modal-btn-collection btn-info-full next-step next-food">
														<span>확인 및 안내</span>  
													</button></li>
											</ul>
										</div>
										<div class="tab-pane" role="tabpanel" id="complete">
											<div class="cal-container">
												<div class="calendar light">
													<h3>확인 및 안내</h3>
													<p>위 운동/식단 관리는 본 웹사이트(TrainerBot)가 작성하는 것이 아닌 회원들간의
														정보교환의 일종으로 본 사는 결과에 대하여 어떠한 책임도 지지 않습니다.</p>
												</div>
												<ul class="list-inline">
													<li><button type="button"
															class="modal-btn-collection prev-step prev-food">
															 <span>플랜 확인</span>
														</button></li>
													<li><button type="button"
															class="modal-btn-collection btn-info-full next-step next-food save-submit"><span>저장
															및 전송</span></button></li>
												</ul>

											</div>
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
											<div class="modal-header">
												<h2>기간 설정</h2>
											</div>
											<div class="contents-container">
												<div class="selected-menti">
													<div class="subtitle">멘티</div>
													<div class="menti-name"></div>
												</div>
												<div class="physical-info">
													<div class="selected-weights">
														<div class="subtitle">체중</div>
														<div class="menti-weights"></div>
													</div>
													<div class="energy-requirement">
														<div class="subtitle">에너지 요구량</div>
														<div class="menti-emetabolism"></div>
													</div>
													<div class="selected-goal">
														<div class="subtitle">목표</div>
														<div class="menti-goal"></div>
													</div>
												</div>
												<div class="plan-duration">
													<div class="start-date">
														<div class="start-date subtitle">시작일</div>
														<div class="sel sel-year">
															<select name="select-year" id="select-year">
																<option value="" disabled>년</option>
																<option value="2019">2019</option>
																<option value="2020">2020</option>
																<option value="2021">2021</option>
																<option value="2022">2022</option>
																<option value="2023">2023</option>
															</select>
														</div>
														<span class="separator">.</span>
														<div class="sel sel-month">
															<select name="select-superpower" id="select-month">
																<option value="" disabled>월</option>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
																<option value="6">6</option>
																<option value="7">7</option>
																<option value="8">8</option>
																<option value="9">9</option>
																<option value="10">10</option>
																<option value="11">11</option>
																<option value="12">12</option>
															</select>
														</div>
														<span class="separator">.</span>
														<div class="sel sel--superman">
															<select name="select-superpower" id="select-day"
																class="select-day">
																<option value="" disabled>일</option>

															</select>
														</div>
													</div>
													<div class="end-date">
														<div class="end-date subtitle">종료일</div>
														<div class="sel sel-year">
															<select name="select-year" id="select-year">
																<option value="" disabled>년</option>
																<option value="2019">2019</option>
																<option value="2020">2020</option>
																<option value="2021">2021</option>
																<option value="2022">2022</option>
																<option value="2023">2023</option>
															</select>
														</div>
														<span class="separator">.</span>
														<div class="sel sel-month">
															<select name="select-superpower" id="select-month">
																<option value="" disabled>월</option>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
																<option value="6">6</option>
																<option value="7">7</option>
																<option value="8">8</option>
																<option value="9">9</option>
																<option value="10">10</option>
																<option value="11">11</option>
																<option value="12">12</option>
															</select>
														</div>
														<span class="separator">.</span>
														<div class="sel sel-day">
															<select name="select-superpower" id="select-day"
																class="select-day">
																<option value="" disabled>일</option>

															</select>
														</div>
													</div>
												</div>
											</div>
											<ul class="list-inline">

												<li><button type="button"
														class="modal-btn-collection next-step next-exer">
														<span>플랜 확인</span> 

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
															<input type="text" required class="lb-goal"> <span
																class="highlight"></span> <span class="bar"></span> <label>목표중량<small>(in
																	Kg)</small></label>
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
												<li><button type="button"
														class="modal-btn-collection prev-step">
														  <span>기간 설정</span>
													</button></li>
												<li><button type="button"
														class="modal-btn-collection add-exer">
														<span>운동 추가</span> 
													</button></li>
												<li><button type="button"
														class="modal-btn-collection next-step">
														<span>플랜 확인</span>  
													</button></li>
											</ul>
										</div>
										<div class="tab-pane" role="tabpanel" id="step7">
											<div class="cal-container">
												<div class="calendar light">
													<div class="calendar_header">
														<h1 class="header_title">Work-out List</h1>
														<p class="header_copy">Work-out Plan</p>
													</div>
													<div class="calendar_plan">
														<div class="cl_plan">
															<div class="cl_title">Day</div>
															<div class="cl_copy">22nd May 2019</div>
															<div class="cl_add">
																<i class="fas fa-plus"></i>
															</div>
														</div>
													</div>
													<div class="calendar_events">
														<p class="ce_title">To Eat List</p>
														<div class="event_item">
															<div class="ei_Dot dot_active"></div>
															<div class="ei_Title">10:30 am</div>
															<div class="ei_Copy">한솥도시락 현미고기고기</div>
														</div>
														<div class="event_item">
															<div class="ei_Dot"></div>
															<div class="ei_Title">12:00 pm</div>
															<div class="ei_Copy">학식</div>
														</div>
														<div class="event_item">
															<div class="ei_Dot"></div>
															<div class="ei_Title">14:00 pm</div>
															<div class="ei_Copy">
																One day 견과류 1봉지<br>#해태 #롯데
															</div>
														</div>
														<div class="event_item">
															<div class="ei_Dot"></div>
															<div class="ei_Title">16:30 pm</div>
															<div class="ei_Copy">프로틴 2알</div>
														</div>
														<div class="event_item">
															<div class="ei_Dot"></div>
															<div class="ei_Title">18:30 am</div>
															<div class="ei_Copy">닭가슴살 30g 1팩</div>
														</div>
													</div>
												</div>
											</div>
											<ul class="list-inline">
												<li><button type="button"
														class="modal-btn-collection prev-step prev-food">
														  <span>식단관리</span>
													</button></li>
												<li><button type="button"
														class="modal-btn-collection btn-info-full next-step next-food">
														<span>확인 및 안내</span>  
													</button></li>
											</ul>
										</div>
										<div class="tab-pane" role="tabpanel" id="step8">
											<div class="cal-container">
												<div class="calendar light">
													<h3>확인 및 안내</h3>
													<p>위 운동/식단 관리는 본 웹사이트(TrainerBot)가 작성하는 것이 아닌 회원들간의
														정보교환의 일종으로 본 사는 결과에 대하여 어떠한 책임도 지지 않습니다.</p>
												</div>
												<ul class="list-inline">
													<li><button type="button"
															class="modal-btn-collection prev-step">
															  <span>플랜확인</span>
														</button></li>
													<li><button type="button"
															class="modal-btn-collection btn-info-full save-submit">
															<span>저장 및 전송</span>
														</button></li>
												</ul>
											</div>
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
		<div class="alarm">
 <p class="label">
 알람창 테스트<br/>흐럇차차찹
 </p>
 <div class="tail"></div>
</div>
<!-- 	<nav class="menu"> -->
<!--    <input type="checkbox" href="#" class="menu-open" name="menu-open" id="menu-open" /> -->
<!--    <label class="menu-open-button" for="menu-open" id="priority"> -->
<!--     <span class="lines line-1"></span> -->
<!--     <span class="lines line-2"></span> -->
<!--     <span class="lines line-3"></span> -->
<!--   </label> -->

<!--    <a href="#" class="menu-item blue"> <i class="fa fa-anchor"></i> </a> -->
<!--    <a href="#" class="menu-item green" id="calBtn"> <i class="fas fa-calculator" ></i> </a> -->
<!--    <a href="#" class="menu-item red"> <i class="fa fa-heart"></i> </a> -->
<!--    <a href="#" class="menu-item purple"> <i class="fa fa-microphone"></i> </a> -->
<!--    <a href="#" class="menu-item orange"> <i class="fa fa-star"></i> </a> -->
<!--    <a href="#" class="menu-item lightblue"> <i class="fa fa-diamond"></i> </a> -->
<!-- </nav> -->


</body>
</html>