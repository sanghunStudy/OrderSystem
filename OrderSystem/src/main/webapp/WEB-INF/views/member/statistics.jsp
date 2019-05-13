<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, minimum-sclae=1, maximum-sclae=1, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/charts.css">
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/icomoon/style.css"></head> --%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/icomoon/demo-files/demo.css"> --%>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/charts.js"></script> 

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<title>나의 운동 차트</title>
<style>

</style>
<script>

var squat = [],
	squatDate=[],
	dead = [],
	deadDate=[],
	benchDate=[],
	bench = [],
	inputWeight=[],
	inputDate=[],
	list=[],
    metabolism={b:'',e:''},
	data={};
var copyArray = [];
</script>
</head>
<body>
<c:forEach var="energy" items="${metabolism}">
	<script>
	metabolism={
		b:'${energy.bmetabolism}',
		e:'${energy.erequirement}'		
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
 		<c:when test="${avg.exerciseName eq '데드리프트'}" > 
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

var deadLbRate = rateCal(dead);
var squatLbRate = rateCal(squat);
var benchLbRate = rateCal(bench);


	
</script>
<div id="fullBox">
<div class="menu-box">
<div class="menu-bar">
	<div class="menu-icons"><a href="statistics"><i class="fas fa-chart-bar"></i></a></div>
	<div class="menu-icons"><a href="MyExerciseJournal"><i class="fas fa-book"></i></a></div>
	<div class="menu-icons"><a href="basicInformation"><i class="fas fa-user-edit"></i></a></div>
	<div class="menu-icons"><a href="mentiManagement"><i class="fas fa-users"></i></a></div>
	<div class="menu-icons"><a href="${pageContext.request.contextPath}/opo/webRtc"><i class="fas fa-comment-dots"></i></a></div>
</div>
</div>
<div id="wrapper">
<div class="four-charts">
	<div id="lineChart dead" style="position: relative; height:25vh; width:22vw">
		<canvas id="line-chart-daed"></canvas>

	</div>
	<div id="lineChart squat" style="position: relative; height:25vh; width:22vw">
		<canvas id="line-chart-squat" ></canvas>

	</div>
	<div id = "lineChart bench" style="position: relative; height:25vh; width:22vw">
		<canvas id="line-chart-bench"></canvas>

	</div>
	<div id = "doughnutChart" style="position: relative; height:25vh; width:22vw">
	<canvas id="doughnut-chart"></canvas>

	</div>
</div>
	<div id = "another-chart">
		<div id = "lineChart-weight" style="position: relative; height:35vh; width:54vw">
			<canvas id="line-chart-weight"></canvas>
		</div>
		<div id = "radarChart" style="position: relative; height:35vh; width:35vw">
			<canvas id="radar-chart"></canvas>

		</div>
	</div>
	
	<div id = "exercise-list-box">
		<h5>최근 운동일지</h5>
		<table class="exercise-list">
			<tr>
			    <td>운동명</td>
			    <td>평균 중량</td>
				<td>반복회수</td>
				<td>세트 합계</td>
				<td>1RM</td>
			</tr>
			
				<c:forEach var="item" items="${avgLb}" begin="0" varStatus="status">
					
				
					<script>
						data = {
							date:'${item.start}',
							name:'${item.exerciseName}',
							lb:'${item.avgLb}',
							reps:'${item.sumReps}',
							set:'${item.doneSet}',
							oneRm:'${itme.oneRm}'
						};
						copyArray.push(data);
						for(var i in copyArray) {
							if(copyArray[i].name = '${item.exerciseName}')
							
						}
					</script>		
					
								
			<c:if test="${item.start == avgLb[0].start}">
			<tr class="percentRow">
					<td>${item.exerciseName}</td>
					<td class="avgLb">${item.avgLb}</td>
					<td class="sumReps">${item.sumReps}</td>
					<td class="doneSet">${item.doneSet}</td>
					<td class="oneRm">${item.oneRm}</td>
					
			</tr>				
			</c:if>	
				</c:forEach>	
				<script>

				</script>	
		</table>
	</div>
	<div class="toWrapper">
		<div class="toDo">
			<div><div class="title"><span>To do list</span></div><div class="edit_list"><i class="fas fa-edit"></i></div></div>
			<div class=""></div>
		</div>
		<div class="toEat">
			<div><div class="title"><span>To eat list</span></div><div class="edit_list"><i class="fas fa-edit"></i></div></div>
			<div class=""></div>
		</div>
	</div>
</div>
</div>
</body>
</html>