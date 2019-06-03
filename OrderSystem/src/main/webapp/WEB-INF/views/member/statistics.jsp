<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-sclae=1, maximum-sclae=1, initial-scale=1, user-scalable=no">
<!-- <link href="https://cdn.rawgit.com/YJSoft/Webfonts/0.1/BM_JUA.css" rel="stylesheet" type="text/css" /> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/charts.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/icomoon/style.css">
</head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/statistics.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/favicon (1).ico">
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/favicon (1).ico">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/statistics&menti/charts.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/statistics&menti/statistics.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/statistics&menti/commons.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/SeeMoreJournals.js"></script>


<title>나의 운동 차트</title>
<style>
</style>

</head>
<body>
	<!-- 그래프에 값을 넘기기 위해 쿼리반환값들을 자바스크립트 배열혹은 json object로 복사,변환해줌 -->
	<c:forEach var="energy" items="${metabolism}">
		<script>
			metabolism = {
				b : '${energy.bmetabolism}',
				e : '${energy.erequirement}'
			}
		</script>
	</c:forEach>
	<c:forEach var="weights" items="${weight}">
		<script>
			inputDate.push('${weights.start}');
			inputWeight.push('${weights.userWeight}');
		</script>
	</c:forEach>
	<c:forEach var="avg" items="${avgLb}">
		<c:choose>
			<c:when test="${avg.exerciseName eq '데드리프트'}">
				<script>
					dead.push('${avg.avgLb}');
					deadDate.push('${avg.start}');
				</script>
			</c:when>
			<c:when test="${avg.exerciseName eq '스쿼트'}">
				<script>
					squat.push('${avg.avgLb}');
					squatDate.push('${avg.start}');
				</script>
			</c:when>
			<c:when test="${avg.exerciseName eq '플랫벤치프레스'}">
				<script>
					bench.push('${avg.avgLb}');
					benchDate.push('${avg.start}');
				</script>
			</c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>

	</c:forEach>
	<script>
		dead.reverse();
		deadDate.reverse();
		squat.reverse();
		squatDate.reverse();
		bench.reverse();
		benchDate.reverse();
	</script>
	<c:forEach var="item" items="${overallAvg}">
		<c:if
			test="${item.exerciseName eq '플랫벤치프레스' or item.exerciseName eq '데드리프트' or item.exerciseName eq '스쿼트' or item.exerciseName eq '풀업' or item.exerciseName eq '밀리터리프레스'}">
			<script>
				overallAvg.push('${item.avgLb}');
			</script>
		</c:if>
	</c:forEach>
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
				<li class="menu-icons"><a
					href="${pageContext.request.contextPath}/member/promotion"><i
						class="fas fa-address-card"></i>
					<p>트레이너 신청</p></a></li>
			</ul>
		</div>
		<div id="wrapper">
			<div class="four-charts">
				<div id="lineChart dead"
					style="position: relative; height: 25vh; width: 22vw">
					<canvas id="line-chart-daed"></canvas>

				</div>
				<div id="lineChart squat"
					style="position: relative; height: 25vh; width: 22vw">
					<canvas id="line-chart-squat"></canvas>

				</div>
				<div id="lineChart bench"
					style="position: relative; height: 25vh; width: 22vw">
					<canvas id="line-chart-bench"></canvas>

				</div>
				<div id="doughnutChart"
					style="position: relative; height: 25vh; width: 22vw">
					<canvas id="doughnut-chart"></canvas>
					
				</div>


			</div>
			<div id="another-chart">
				<div id="lineChart-weight"
					style="position: relative; height: 35vh; width: 54vw">
					<canvas id="line-chart-weight"></canvas>
				</div>
				<div id="radarChart"
					style="position: relative; height: 35vh; width: 35vw">
					<canvas id="radar-chart"></canvas>

				</div>
			</div>

			<div id="exercise-list-box">
				<div class="title">
					<span>최근 운동 일지</span>
				</div>
				<div class="detail">
					<i class="far fa-plus-square"></i>
				</div>

				<table class="exercise-list table">
					<thead>
						<tr>
							<td>운동명</td>
							<td>평균 중량<span style="font-size: 8px;">(증가율)</span></td>
							<td>반복회수<span style="font-size: 8px;">(증가율)</span></td>
							<td>세트 합계<span style="font-size: 8px;">(증가율)</span></td>
							<td>1RM<span style="font-size: 8px;">(증가율)</span></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${avgLb}" begin="0"
							varStatus="status">


							<script>
								/* 쿼리 조회값 자바스크립트 배열로 복사*/
								data = {
									date : '${item.start}',
									name : '${item.exerciseName}',
									lb : '${item.avgLb}',
									reps : '${item.sumReps}',
									set : '${item.doneSet}',
									oneRm : '${item.oneRm}'
								};
								copyArray.push(data);
							</script>


							<c:if test="${item.start == avgLb[0].start}">
								<c:if
									test="${item.exerciseName eq '플랫벤치프레스' or item.exerciseName eq '데드리프트' or item.exerciseName eq '스쿼트' or item.exerciseName eq '풀업' or item.exerciseName eq '밀리터리프레스'}">
									<script>
										myAvg.push('${item.avgLb}');
									</script>
								</c:if>
								<tr class="percentRow">
									<td class="exTitle">${item.exerciseName}</td>
									<td class="avgLb">${item.avgLb}</td>
									<td class="sumReps">${item.sumReps}</td>
									<td class="doneSet">${item.doneSet}</td>
									<td class="oneRm">${item.oneRm}</td>

								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<script>
					var index = -1;
					var val = document.body.getElementsByClassName('exTitle');
					/*복사한 배열을 운동별로 분리 */
					for (var q = 0; q < val.length; q++) {
						var filteredObj = copyArray.filter(function(item, i) {

							return item.name === val[q].innerText;

						});

						// 				var value = rateCal(comparison,curVal)
						/*운동별로 분리한 배열의 key값별로  첫번째값과 두번째값을 가져옴*/
						var keys = Object.keys(filteredObj[0]);
						var value;

						for (var j = 2; j < keys.length; j++) {

							/*가져온 운동리스트에서 이전 데이터가 존재하지 않을경우*/
							if (filteredObj.length <= 1)
								value = 'noData';

							else
								/*가져온 값들을 비율을 계산하는 함수 rateCal에 넘겨 비율값을 value 객체가 가리키게함 */
								value = rateCal(filteredObj[1][keys[j]],
										filteredObj[0][keys[j]]);

							var percent = document.createElement("span");
							percent.className = "percent";

							/*value를 적합한 td에 appendChild해줌. value값에 따른 상태표시*/
							var percentRow = document.body
									.getElementsByClassName('percentRow');

							percentRow[q].getElementsByTagName('td')[j - 1]
									.appendChild(percent);
							if (value > 0) {
								percent.innerHTML = '('
										+ value
										+ "%"
										+ '<i class="fas fa-long-arrow-alt-up"></i>'
										+ ')';
								percent.classList.add('increase');
							} else if (value < 0) {
								percent.innerHTML = '('
										+ value
										+ "%"
										+ '<i class="fas fa-long-arrow-alt-down"></i>'
										+ ')';
								percent.classList.add('decrease');
							} else if (value == 'noData' || value == 0) {

								percent.innerHTML = '('
										+ '<i class="fas fa-minus"></i>' + ')';
								percent.classList.add('fixedRate');
							}

						}

					}
				</script>
			</div>
			<div id="toWrapper">
				<div class="toDo">
					<div class="title">
						<span>To Do List</span>
					</div>
					<div id="top_line">

						<div class="to_do_date">
							<i class="fas fa-angle-left" id="do_prev"></i><span
								class="moment"></span><i class="fas fa-angle-right" id="do_next"></i>
						</div>
					</div>
					<div class="to_do_table">
						<table class="to_do table">
							<tbody>
								<tr>
									<td><div class="checkboxes">
											<input id="a" type="checkbox" tabindex="1" /><label
												class="green-background" for="a"></label>
										</div></td>
									<td><div class="item_box">
											<div class="to_item">데드리프트</div>
											<p>데드리프트 60kg 중량으로 10회씩 3세트</p>
										</div></td>
									<td class="parts">등</td>
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
									<td><i class="fas fa-edit"></i></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="toEat">
					<div class="title">
						<span>To Eat List</span>
					</div>
					<div id="top_line">

						<div class="to_do_date">
							<i class="fas fa-angle-left" id="eat_prev"></i><span
								class="moment"></span><i class="fas fa-angle-right"
								id="eat_next"></i>
						</div>
					</div>
					<div class="to_do_table">
						<table class="to_eat table">
							<tbody>
								<tr>
									<td><div class="checkboxes">
											<input id="b" type="checkbox" tabindex="2" /><label
												class="green-background" for="b"></label>
										</div></td>
									<td><div class="item_box">
											<div class="to_item">바나나100g</div>
											<p>바나나 보통크기 3개</p>
										</div></td>
									<td class="nutrient">탄수화물,단백질</td>
									<td class="kcal">250Kcal</td>
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
									<td><i class="fas fa-edit"></i></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="more_exercise_list" class="more_exercise">
		<div class="content_square">
			<div class="list-head">
				<h3>지난 운동 일지</h3>
			</div>
			<c:choose>
				<c:when test="">
					<%-- <c:forEach var="mel" items="${list}">
					<div>
						<ul>
							<li>${mel.exerciseDate}</li>
							<li>${mel.title}</li>
							
						</ul>
					</div>
				</c:forEach> --%>
				</c:when>
				<c:otherwise>
					<div class="nothing">지난 운동 일지가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>