<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/statistics.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon (1).ico">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mento.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mentoCharts.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="${pageContext.request.contextPath}/resources/js/mentoCharts.js"></script>

<title>TRAINERBOT 멘티 관리</title>
</head>
<body>
	<div id="fullBox">
		<div class="menu-box">
			<div class="logo">
				<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo">
				<p>TRAINERBOT</p>
			</div>
			<ul class="menu-bar">
				<li class="menu-icons"><a href="statistics"><i class="fas fa-chart-bar"></i><p>운동일지 통계</p></a></li>
				<li class="menu-icons"><a href="MyExerciseJournal"><i class="fas fa-book"></i></a><p>운동일지 작성</p></li>
				<li class="menu-icons"><a href="basicInformation"><i class="fas fa-user-edit"></i></a><p>설문조사</p></li>
				<li class="menu-icons"><a href="mentiManagement"><i class="fas fa-users"></i></a><p>멘티 관리</p></li>
				<li class="menu-icons"><a href="${pageContext.request.contextPath}/opo/webRtc"><i class="fas fa-comment-dots"></i><p>화상채팅</p></a></li>
			</ul>
		</div>
		<div id="wrapper">
			<div class="rank">
			<div id="ranker" style="position: relative; height:25vh; width:44.5vw">
				<div class="title"><img src="${pageContext.request.contextPath}/resources/images/mypage/crown.png" class="crown"><span>RANKING</span></div>
				<ul>
					<li></li>
				</ul>
			</div>
			<div id="lineChart Ranking" style="position: relative; height:25vh; width:44.5vw">
				<canvas id="line-chart-ranking"></canvas>
			</div>
		</div>
		<div class="menti-apply">
			<table>
				<thead>
					<td></td>
					<td>Name</td>
					<td>Date</td>
					<td>Physical Information</td>
					<td>Goal</td>
					<td></td>
				</thead>
				<tbody>
					<td><div class="checkboxes"><input id="a" type="checkbox" tabindex="1"/><label class="green-background" for="a"></td>
					<td>웰시코기</td>
					<td>2019-05-15</td>
					<td>키 175cm 몸무게 70kg</td>
					<td>홀쭉 날씬 s라인</td>
					<td></td>
					<td></td>
				</tbody>
			</table>
		</div>
		<div class="third-line">
			<div class="latest-log">
				<h3>Latest Log</h3>
			</div>
			<div class="menti-weight" style="position: relative; height:25vh; width:62vw">
				<canvas id="line-chart-mentiWegiht"></canvas>
			</div>

		</div>
	<div class="mentiperformance">
			<h3>Menti Performance</h3>
			<table class="performance">
				<tbody>
					<tr>
						<td>오창영님</td>
						<td>
							<div class="progress-container">
								<span id="value" class="progress-value" style="background-color:#272a3d ">1%</span>
							
								<div class="progress-bar">					
   									 <div id="bar" class="progress-value multi"  data-code="dbVal" style="width: 1%;">
  							 	 	</div>
								</div>
							</div>
						</td>
						<td><div class="planModal">Plan Management</div></td>
						<td>2019.05.07</td>
					</tr>
				</tbody>
			</table>
	</div>
	</div>
</body>
</html>